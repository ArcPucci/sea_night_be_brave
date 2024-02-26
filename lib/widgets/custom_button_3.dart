import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class CustomButton3 extends StatelessWidget {
  const CustomButton3({
    super.key,
    required this.text,
    this.onTap,
    this.enabled = true,
  });

  final String text;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1 : 0.6,
        child: Container(
          width: 256.w,
          height: 62.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: GradientBoxBorder(
              width: 2.sp,
              gradient: AppTheme.thirdGradient,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 2.r),
                blurRadius: 10.r,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(text, style: AppTextStyles.textStyle9),
        ),
      ),
    );
  }
}
