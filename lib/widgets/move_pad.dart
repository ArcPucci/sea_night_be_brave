import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovePad extends StatelessWidget {
  const MovePad({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108.r,
      height: 108.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.rotate(
            angle: pi,
            child: Image.asset(
              'assets/png/icons/arrow_right.png',
              width: 30.r,
              height: 30.r,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.rotate(
                angle: pi * 3 / 2,
                child: Image.asset(
                  'assets/png/icons/arrow_right.png',
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.cover,
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: Image.asset(
                  'assets/png/icons/arrow_right.png',
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/png/icons/arrow_right.png',
            width: 30.r,
            height: 30.r,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
