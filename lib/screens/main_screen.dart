import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LevelManager>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          bg: value.level.bg,
          child: Column(
            children: [
              Expanded(
                child: LevelSelector(
                  level: value.level,
                  onNext: value.onNext,
                  onPrev: value.onPrev,
                ),
              ),
              SizedBox(height: 32.h),
              CustomButton1(text: 'Start', onTap: () => context.go('/game')),
              SizedBox(height: 60.h),
            ],
          ),
        );
      },
    );
  }
}
