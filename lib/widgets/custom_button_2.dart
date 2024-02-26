import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.link,
    this.onTap,
  });

  final Link link;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.w,
      height: 62.h,
      decoration: BoxDecoration(
        border: Border.all(width: 2.sp, color: Colors.white),
        boxShadow: [AppTheme.boxShadow1],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Image.asset(
            link.asset,
            width: 26.r,
            height: 26.r,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8.w),
          Text(link.title, style: AppTextStyles.textStyle8),
          const Spacer(),
          Transform.rotate(
            angle: pi,
            child: Image.asset(
              'assets/png/icons/back.png',
              width: 30.r,
              height: 30.r,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
