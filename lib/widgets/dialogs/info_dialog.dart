import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDialog extends StatefulWidget {
  const InfoDialog({super.key});

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  bool firstScreen = true;

  double blur = 2;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Column(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: blur, sigmaX: blur),
                child: SizedBox(height: 12.h),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: blur, sigmaX: blur),
                  ),
                ),
                ClipRRect(
                  child: Container(
                    width: 100.w,
                    height: 49.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: blur, sigmaX: blur),
                  child: Image.asset(
                    'assets/png/icons/close.png',
                    width: 36.r,
                    height: 36.r,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
