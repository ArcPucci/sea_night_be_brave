import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

enum BoxType { gold, emerald, diamond, lucky, unlucky, worm, shark, exit, idle }

class GameProvider extends ChangeNotifier {
  // final CoinManager coinManager;
  final Level level;
  final Box user;

  final GoRouter router;

  late int x;
  late int y;

  late int _medKit;
  late int _shield;
  late int _health;

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

  bool _canView = false;

  bool get canView => _canView;

  // final Future<int> Function() showMiniGameDialog;
  // final Future<bool> Function(bool success, Level level) showFinishDialog;

  GameProvider({
    // required LevelManager levelManager,
    // required StoreManager storeManager,
    // required this.showMiniGameDialog,
    // required this.coinManager,
    // required this.showFinishDialog,
    required this.router,
  })  : level = levels.first,
        user = User('assets/png/mike.png') {
    init();
  }

  bool get canGoUp => y > 0;

  bool get canGoRight => x < _matrixWidth - 1;

  bool get canGoDown => y < _matrixHeight - 1;

  bool get canGoLeft => x > 0;

  int get medKit => _medKit;

  int get balance => _balance;

  int get health => _health;

  int get shield => _shield;

  bool get canMove => _canMove;

  Box get _currentBox => matrix[y][x];

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
    _underBox = Empty()..use();

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
      print(tempBox.length);
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

    if (_underBox is Finish) {
      // _boxType = BoxType.chest;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 1));
      _boxType = BoxType.idle;
      notifyListeners();
      // final total = _balance + level.reward;
      // coinManager.addMoney(total);
      // final playAgain = await showFinishDialog(true, level);
      _canMove = false;
      matrix[y][x] = _underBox;
      // if (!playAgain) return;
      init();
    }

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
        // TODO: Handle this case.
        break;
      case Empty():
        // TODO: Handle this case.
        break;
      case Finish():
        // TODO: Handle this case.
        break;
      case Gold():
        // TODO: Handle this case.
        break;
      case Diamond():
        // TODO: Handle this case.
        break;
      case Emerald():
        // TODO: Handle this case.
        break;
      case LuckyCoin():
        // TODO: Handle this case.
        break;
      case UnluckyCoin():
        // TODO: Handle this case.
        break;
      case Worm():
        // TODO: Handle this case.
        break;
      case Shark():
        // TODO: Handle this case.
        break;
    }
    notifyListeners();
  }
}
