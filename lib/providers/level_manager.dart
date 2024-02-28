import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class LevelManager extends ChangeNotifier {
  final GoRouter _router;

  LevelManager({required GoRouter router}) : _router = router;

  Level get level => levels[_currentIndex];

  int _currentIndex = 0;

  void onPlay() {
    _router.go('/game');
  }

  void onNext() {
    if (_currentIndex == levels.length - 1) {
      _currentIndex = 0;
    } else {
      _currentIndex++;
    }

    notifyListeners();
  }

  void onPrev() {
    if (_currentIndex == 0) {
      _currentIndex = levels.length - 1;
    } else {
      _currentIndex--;
    }

    notifyListeners();
  }
}
