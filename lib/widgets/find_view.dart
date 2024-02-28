import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class FindView extends StatelessWidget {
  const FindView({
    super.key,
    required this.boxType,
    this.onChoose,
    this.onExit,
  });

  final BoxType boxType;
  final VoidCallback? onChoose;
  final VoidCallback? onExit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
        child: Container(
          width: 336.r,
          height: 560.r,
          decoration: BoxDecoration(
            color: AppTheme.brown.withOpacity(0.4),
          ),
          alignment: Alignment.topCenter,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (boxType) {
      case BoxType.gold:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/gold.png',
            width: 208.r,
            height: 216.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.emerald:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/emerald.png',
            width: 208.r,
            height: 216.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.diamond:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/diamond.png',
            width: 208.r,
            height: 216.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.lucky:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/jackpot.png',
            width: 208.r,
            height: 216.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.unlucky:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/unlucky.png',
            width: 208.r,
            height: 216.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.worm:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/worm.png',
            width: 208.r,
            height: 216.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.shark:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/shark.png',
            width: 208.r,
            height: 274.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.exit:
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 60.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.scale(
                scale: 1.5,
                child: Image.asset(
                  'assets/png/views/exit.png',
                  width: 300.r,
                  height: 270.r,
                  fit: BoxFit.contain,
                ),
              ),
              CustomButton1(text: 'Exit', onTap: onExit),
            ],
          ),
        );
      case BoxType.luckyChoose:
        return SizedBox(
          width: 300.r,
          child: Column(
            children: [
              SizedBox(height: 140.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildChest(onChoose: onChoose),
                  _buildChest(onChoose: onChoose),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                'Try your luck',
                style: AppTextStyles.textStyle6.copyWith(
                  color: AppTheme.gold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Choose a chest!',
                style: AppTextStyles.textStyle6.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      case BoxType.unluckyChoose:
        return SizedBox(
          width: 300.r,
          child: Column(
            children: [
              SizedBox(height: 140.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildChest(lucky: false, onChoose: onChoose),
                  _buildChest(lucky: false, onChoose: onChoose),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                'Try your luck',
                style: AppTextStyles.textStyle6.copyWith(
                  color: AppTheme.yellow2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Choose a chest!',
                style: AppTextStyles.textStyle6.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      case BoxType.empty:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/empty_chest.png',
            width: 300.r,
            height: 270.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.jackpot:
        return Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Transform.scale(
            scale: 1.4,
            child: Image.asset(
              'assets/png/views/gold_chest.png',
              width: 300.r,
              height: 270.r,
              fit: BoxFit.contain,
            ),
          ),
        );
      case BoxType.antiJackpot:
        return Padding(
          padding: EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'assets/png/views/anti_jackpot_chest.png',
            width: 300.r,
            height: 338.r,
            fit: BoxFit.contain,
          ),
        );
      case BoxType.idle:
        return const SizedBox();
    }
  }

  Widget _buildChest({
    bool lucky = true,
    VoidCallback? onChoose,
  }) {
    return GestureDetector(
      onTap: onChoose,
      child: Container(
        width: 143.r,
        height: 136.r,
        decoration: BoxDecoration(
          color: AppTheme.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2.sp,
            color: Colors.white,
          ),
          image: DecorationImage(
            image: AssetImage(lucky
                ? 'assets/png/views/jackpot_chest.png'
                : 'assets/png/views/unlucky_chest.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
