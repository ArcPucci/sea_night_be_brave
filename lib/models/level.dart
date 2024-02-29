import 'package:flutter/material.dart';

class Level {
  final int id;
  final String level;
  final String asset;
  final String description;
  final int golds;
  final int emeralds;
  final int diamonds;
  final int luckyCoin;
  final int unluckyCoin;
  final int worms;
  final int sharks;
  final int width;
  final int height;
  final Color color;
  final String bg;

  const Level({
    required this.id,
    required this.level,
    required this.asset,
    required this.description,
    required this.golds,
    required this.emeralds,
    required this.diamonds,
    required this.luckyCoin,
    required this.unluckyCoin,
    required this.worms,
    required this.sharks,
    required this.width,
    required this.color,
    required this.height,
    required this.bg,
  });
}
