import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/screens/screens.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPremium(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
          child: Container(
            width: 336.w,
            height: 140.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [AppTheme.boxShadow1],
              border: Border.all(width: 4.sp, color: AppTheme.gold),
            ),
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Premium', style: AppTextStyles.textStyle6),
                    SizedBox(height: 8.h),
                    Text(
                      '• All characters and\n   backgrounds',
                      style: AppTextStyles.textStyle5.copyWith(
                        color: AppTheme.white,
                      ),
                    ),
                    Text(
                      '• Without ads',
                      style: AppTextStyles.textStyle5.copyWith(
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/png/icons/diving.png',
                  width: 84.r,
                  height: 84.r,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPremium(BuildContext context) {
    final route = MaterialPageRoute(builder: (context) => PremiumScreen());

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
