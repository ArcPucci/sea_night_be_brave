import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({
    super.key,
    required this.child,
    this.bg,
    this.hasBG = true,
    this.hasBottomBar = true,
    this.opacity,
  });

  final String? bg;
  final bool hasBottomBar;
  final bool hasBG;
  final Widget child;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppTheme.bgGradient,
                        image: hasBG
                            ? DecorationImage(
                                image: AssetImage(bg ?? 'assets/png/bg/bg.png'),
                                fit: BoxFit.fill,
                                alignment: Alignment.bottomRight,
                                opacity: opacity ?? 0.2,
                              )
                            : null,
                      ),
                    ),
                  ),
                  if (hasBottomBar) SizedBox(height: 66.h),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 390.w,
              height: 422.h,
              decoration: BoxDecoration(
                gradient: AppTheme.blueGradient,
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(child: child),
                  if (hasBottomBar) SizedBox(height: 66.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
