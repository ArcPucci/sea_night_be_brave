import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    this.width,
    required this.text,
    required this.text2,
    this.color,
    required this.asset,
  });

  final double? width;
  final String text;
  final String text2;
  final Color? color;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          asset,
          width: width ?? 53.w,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 6.w),
        RichText(
          text: TextSpan(
            text: text,
            style: AppTextStyles.textStyle5.copyWith(
              color: color ?? AppTheme.turquoise,
            ),
            children: [
              TextSpan(
                text: text2,
                style: AppTextStyles.textStyle5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
