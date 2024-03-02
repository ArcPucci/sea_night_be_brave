import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/providers/providers.dart';

enum BoxType {
  gold,
  emerald,
  diamond,
  lucky,
  unlucky,
  worm,
  shark,
  exit,
  idle,
  luckyChoose,
  unluckyChoose,
  empty,
  jackpot,
  antiJackpot,
}

class GameProvider extends ChangeNotifier {
  final StoreProvider storeProvider;
  final Level level;
  final Box user;
  final BGCard bgCard;

  final GoRouter router;

  late int x;
  late int y;

  late int _balance;

  late bool _canMove;

  late List<List<Box>> matrix;

  late Box _underBox;

  static const _matrixWidth = 6;

  static const _matrixHeight = 10;

  int get width => _matrixWidth;

  int get height => _matrixHeight;

  BoxType _boxType = BoxType.idle;

  BoxType get boxType => _boxType;

  bool _deviceWorks = true;

  GameProvider({
    required LevelManager levelManager,
    required this.storeProvider,
    required this.router,
  })  : level = levelManager.level,
        user = User(storeProvider.characterCard.asset),
        bgCard = storeProvider.bgCard {
    init();
  }

  bool get canGoUp => y > 0;

  bool get canGoRight => x < _matrixWidth - 1;

  bool get canGoDown => y < _matrixHeight - 1;

  bool get canGoLeft => x > 0;

  int get balance => _balance;

  bool get canMove => _canMove;

  Box get _currentBox => matrix[y][x];

  bool _deviceUsed = false;

  void _updatePosition(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        y--;
        break;
      case AxisDirection.right:
        x++;
        break;
      case AxisDirection.down:
        y++;
        break;
      case AxisDirection.left:
        x--;
        break;
    }
  }

  bool _canGoNext(AxisDirection direction) => switch (direction) {
        AxisDirection.up => canGoUp,
        AxisDirection.right => canGoRight,
        AxisDirection.down => canGoDown,
        AxisDirection.left => canGoLeft,
      };

  void init() {
    x = 0;
    y = 0;

    int golds = level.golds;
    int emeralds = level.emeralds;
    int diamonds = level.diamonds;
    int lucky = level.luckyCoin;
    int unlucky = level.unluckyCoin;
    int worm = level.worms;
    int shark = level.sharks;

    _balance = 0;

    _canMove = true;

    matrix = [];
    _underBox = Finish()..use();

    final count = golds + emeralds + diamonds + lucky + unlucky + worm + shark;

    List<Box> tempBox = [];
    while (count > tempBox.length) {
      if (golds > 0) {
        tempBox.add(Gold());
        golds--;
      }
      if (emeralds > 0) {
        tempBox.add(Emerald());
        emeralds--;
      }
      if (diamonds > 0) {
        tempBox.add(Diamond());
        diamonds--;
      }
      if (lucky > 0) {
        tempBox.add(LuckyCoin());
        lucky--;
      }
      if (unlucky > 0) {
        tempBox.add(UnluckyCoin());
        unlucky--;
      }
      if (worm > 0) {
        tempBox.add(Worm());
        worm--;
      }
      if (shark > 0) {
        tempBox.add(Shark());
        shark--;
      }
    }

    tempBox.addAll(
      List.generate(
        _matrixWidth * _matrixHeight - count - 1,
        (index) => Empty(),
      ),
    );

    tempBox.shuffle();

    tempBox = [Finish(), ...tempBox];

    for (var i = 0; i < _matrixHeight; ++i) {
      matrix.add(tempBox.skip(i * _matrixWidth).take(_matrixWidth).toList());
    }

    matrix[0][0] = user;
    notifyListeners();
  }

  void goUp() => move(AxisDirection.up);

  void goRight() => move(AxisDirection.right);

  void goDown() => move(AxisDirection.down);

  void goLeft() => move(AxisDirection.left);

  void _restorePrev() {
    matrix[y][x] = _underBox;
  }

  void _moveToNext() {
    _underBox = _currentBox;
    matrix[y][x] = user;
  }

  void move(AxisDirection direction) async {
    if (!canMove || _boxType != BoxType.idle) {
      return;
    }

    if (!_canGoNext(direction)) {
      return;
    }

    _restorePrev();
    _updatePosition(direction);
    _moveToNext();

    notifyListeners();

    await _useEffect();
    notifyListeners();
  }

  Future<void> _useEffect() async {
    if (_underBox is! Finish && _underBox.isOpened) {
      return;
    }
    _underBox.use();
    switch (_underBox) {
      case User():
        break;
      case Empty():
        break;
      case Finish():
        _balance += 30;

        storeProvider.onAddMoney(_balance);
        _balance = 0;
        _boxType = BoxType.exit;
        notifyListeners();
        break;
      case Gold():
        onUseDavidsAbility(10);
        _boxType = BoxType.gold;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 1));
        _boxType = BoxType.idle;

        notifyListeners();
        break;
      case Diamond():
        onUseDavidsAbility(25);
        _boxType = BoxType.diamond;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 1));
        _boxType = BoxType.idle;

        notifyListeners();
        break;
      case Emerald():
        onUseDavidsAbility(15);
        _boxType = BoxType.emerald;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 1));
        _boxType = BoxType.idle;

        notifyListeners();
        break;
      case LuckyCoin():
        _boxType = BoxType.lucky;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 1));
        _boxType = BoxType.luckyChoose;
        notifyListeners();
        break;
      case UnluckyCoin():
        _boxType = BoxType.unlucky;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 1));
        _boxType = BoxType.unluckyChoose;
        notifyListeners();
        break;
      case Worm():
        _deviceWorks = false;
        _boxType = BoxType.worm;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 1));
        _boxType = BoxType.idle;

        notifyListeners();
        break;
      case Shark():
        if (user.skin.contains('nicolas') && !_deviceUsed && _deviceWorks) {
          _deviceUsed = true;
          break;
        }
        onBalanceMinus(20);
        _boxType = BoxType.shark;
        notifyListeners();

        await Future.delayed(const Duration(seconds: 1));
        _boxType = BoxType.idle;

        notifyListeners();
        break;
    }
  }

  void onChoose() async {
    final lucky = Random().nextBool();
    if (_boxType == BoxType.luckyChoose) {
      _boxType = lucky ? BoxType.jackpot : BoxType.empty;
      if (lucky) onUseDavidsAbility(100);
    } else if (_boxType == BoxType.unluckyChoose) {
      _boxType = lucky ? BoxType.empty : BoxType.antiJackpot;
      if (!lucky) onBalanceMinus(100);
    }

    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _boxType = BoxType.idle;
    notifyListeners();
  }

  void onBalanceMinus(int count) {
    if (_balance >= count) {
      _balance -= count;
    } else {
      _balance = 0;
    }
    final coins = (storeProvider.coins * 0.05).round();
    storeProvider.onMinusMoney(coins);
  }

  void onExit() {
    router.pop();
  }

  void onUseDavidsAbility(int coins) {
    if (user.skin.contains('david') && _deviceWorks) {
      _balance += (coins * 1.05).round();
    } else {
      _balance += coins;
    }
  }

  void onMove(int newX, int newY) {
    if (x - newX == 1 && newY == y) {
      goLeft();
    } else if (x - newX == -1 && newY == y) {
      goRight();
    } else if (y - newY == 1 && newX == x) {
      goUp();
    } else if (y - newY == -1 && newX == x) {
      goDown();
    }
    notifyListeners();
  }
}
