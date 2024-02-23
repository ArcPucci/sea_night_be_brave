import 'package:flutter/material.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.bgGradient,
          image: DecorationImage(
            image: AssetImage('assets/png/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
