import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${value.coins}',
                  style: AppTextStyles.textStyle3.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 2.w),
                Image.asset(
                  'assets/png/icons/coins.png',
                  width: 28.r,
                  height: 28.r,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 4.h),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return AppTheme.thirdGradient.createShader(bounds);
              },
              child: Text('Total balance', style: AppTextStyles.textStyle7),
            ),
          ],
        );
      },
    );
  }
}
