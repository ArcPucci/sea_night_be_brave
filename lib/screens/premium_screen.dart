import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          bg: 'assets/png/bg/bg5.png',
          opacity: 0.6,
          hasBottomBar: false,
          child: Column(
            children: [
              SizedBox(height: 27.h),
              SizedBox(
                width: 342.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Image.asset(
                        'assets/png/icons/back.png',
                        width: 32.r,
                        height: 32.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Premium',
                      style: AppTextStyles.textStyle1.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 32.r),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Image.asset(
                'assets/png/picture3.png',
                width: 360.w,
                height: 367.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Image.asset(
                      'assets/png/icons/diving.png',
                      width: 46.r,
                      height: 46.r,
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'All characters and\nbackgrounds',
                    style: AppTextStyles.textStyle6,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/png/icons/no_ad.png',
                    width: 40.r,
                    height: 40.r,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8.w),
                  Text('Without ads', style: AppTextStyles.textStyle6),
                ],
              ),
              const Spacer(),
              CustomButton1(
                text: 'Buy for \$0.99 ',
                onTap: () {
                  value.onBuyPremium();
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      value.onBuyPremium();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Restore',
                      style: AppTextStyles.textStyle7.copyWith(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(width: 1.w, height: 16.h, color: Colors.white),
                  SizedBox(width: 12.w),
                  Text(
                    'Terms of Use',
                    style: AppTextStyles.textStyle7.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(width: 1.w, height: 16.h, color: Colors.white),
                  SizedBox(width: 12.w),
                  Text(
                    'Privacy Policy',
                    style: AppTextStyles.textStyle7.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }
}
