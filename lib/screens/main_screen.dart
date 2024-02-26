import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      bg: 'assets/png/bg/bg2.png',
      child: Column(
        children: [
          const LevelSelector(),
          SizedBox(height: 32.h),
          const CustomButton1(text: 'Start'),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
