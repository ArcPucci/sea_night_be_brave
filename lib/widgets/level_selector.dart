import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class LevelSelector extends StatelessWidget {
  const LevelSelector({
    super.key,
    required this.level,
    this.onPrev,
    this.onNext,
  });

  final Level level;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(level.asset),
          fit: BoxFit.cover,
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
              GestureDetector(
                onTap: onPrev,
                child: Image.asset(
                  'assets/png/icons/back.png',
                  width: 72.r,
                  height: 72.r,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                level.level,
                style: AppTextStyles.textStyle4.copyWith(
                  color: level.color,
                ),
              ),
              GestureDetector(
                onTap: onNext,
                child: Transform.rotate(
                  angle: pi,
                  child: Image.asset(
                    'assets/png/icons/back.png',
                    width: 72.r,
                    height: 72.r,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            level.description,
            style: AppTextStyles.textStyle5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
