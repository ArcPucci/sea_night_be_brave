import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/bg_widget.dart';
import 'package:sea_night_be_brave/widgets/item_card.dart';
import 'package:sea_night_be_brave/widgets/total_balance.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      hasBG: false,
      child: Column(
        children: [
          SizedBox(height: 63.h),
          ItemCard(
            title: 'Characters',
            asset: 'assets/png/characters.png',
            gradient: AppTheme.gradient1,
            onTap: () => context.go('/store/characters'),
          ),
          SizedBox(height: 30.h),
          ItemCard(
            title: 'Backgrounds',
            asset: 'assets/png/backgrounds.png',
            gradient: AppTheme.gradient2,
            onTap: () => context.go('/store/bg'),
          ),
          const Spacer(),
          const TotalBalance(),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
