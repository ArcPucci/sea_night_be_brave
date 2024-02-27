import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar({
    super.key,
    this.onInfo,
    this.onClose,
  });

  final VoidCallback? onInfo;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onInfo,
            child: Image.asset(
              'assets/png/icons/info.png',
              width: 36.r,
              height: 36.r,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Text('0', style: AppTextStyles.textStyle6),
              SizedBox(width: 2.w),
              Image.asset(
                'assets/png/icons/coins2.png',
                width: 32.r,
                height: 32.r,
                fit: BoxFit.cover,
              ),
            ],
          ),
          GestureDetector(
            onTap: onClose,
            child: Image.asset(
              'assets/png/icons/close.png',
              width: 36.r,
              height: 36.r,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
