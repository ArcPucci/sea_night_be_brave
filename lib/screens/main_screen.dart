import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      bg: 'assets/png/bg/bg2.png',
      child: Column(
        children: [
          const Expanded(child: LevelSelector()),
          SizedBox(height: 32.h),
          CustomButton1(text: 'Start', onTap: () => context.go('/game')),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
