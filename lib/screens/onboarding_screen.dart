import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: onPageChanged,
                children: [
                  _buildBody1(),
                  _buildBody2(),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            CustomButton1(
              text: currentIndex == 0 ? 'Next' : 'Continue',
              onTap: onNext,
            ),
            SizedBox(height: 64.h),
          ],
        ),
      ),
    );
  }

  void onNext() {
    if (currentIndex == 1) {
      return;
    }
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    currentIndex = index;
    setState(() {});
  }

  Widget _buildBody1() {
    return Column(
      children: [
        SizedBox(height: 108.h),
        Image.asset(
          'assets/png/onboarding1.png',
          width: 390.w,
          height: 340.h,
          fit: BoxFit.contain,
          alignment: const Alignment(0.5, 0),
        ),
        SizedBox(height: 65.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Explore the seabed\nand find ',
            style: AppTextStyles.textStyle1.copyWith(
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: 'treasures!',
                style: AppTextStyles.textStyle1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.cyan,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody2() {
    return Column(
      children: [
        SizedBox(height: 54.h),
        SizedBox(
          width: 360.w,
          height: 419.h,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/png/picture2.png',
                  width: 340.w,
                  height: 367.h,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset(
                  'assets/png/picture1.png',
                  width: 340.w,
                  height: 367.h,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Choose the best ',
            style: AppTextStyles.textStyle1.copyWith(
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: 'customization!',
                style: AppTextStyles.textStyle1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.cyan,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
