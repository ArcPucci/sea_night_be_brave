import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 576.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/png/mike.png'),
          fit: BoxFit.contain,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 15.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/png/icons/back.png',
                width: 72.r,
                height: 72.r,
                fit: BoxFit.cover,
              ),
              Text(
                'Normal',
                style: AppTextStyles.textStyle4.copyWith(
                  color: AppTheme.green,
                ),
              ),
              Transform.rotate(
                angle: pi,
                child: Image.asset(
                  'assets/png/icons/back.png',
                  width: 72.r,
                  height: 72.r,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'A large number of finds and a small number of obstacles',
            style: AppTextStyles.textStyle5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
