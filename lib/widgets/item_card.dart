import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.asset,
    required this.title,
    this.onTap,
    required this.gradient,
  });

  final VoidCallback? onTap;
  final LinearGradient gradient;
  final String asset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 336.w,
        height: 260.h,
        decoration: BoxDecoration(
          boxShadow: [AppTheme.boxShadow1],
          gradient: AppTheme.bgGradient,
          borderRadius: BorderRadius.circular(10),
          border: GradientBoxBorder(
            width: 6.sp,
            gradient: AppTheme.thirdGradient,
          ),
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 336.w,
          height: 68.h,
          decoration: BoxDecoration(gradient: gradient),
          alignment: Alignment.center,
          child: Text(title, style: AppTextStyles.textStyle6),
        ),
      ),
    );
  }
}
