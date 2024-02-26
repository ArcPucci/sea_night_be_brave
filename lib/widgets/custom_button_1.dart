import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    this.onTap,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 256.w,
        height: 62.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: AppTheme.thirdGradient,
          boxShadow: [AppTheme.boxShadow1],
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.textStyle3),
      ),
    );
  }
}
