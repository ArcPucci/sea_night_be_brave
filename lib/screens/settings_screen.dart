import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/bg_widget.dart';
import 'package:sea_night_be_brave/widgets/custom_button_2.dart';
import 'package:sea_night_be_brave/widgets/premium_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          bg: 'assets/png/bg/bg5.png',
          opacity: 0.6,
          child: Column(
            children: [
              SizedBox(height: 133.h),
              if (!value.premium) const PremiumButton(),
              SizedBox(height: 40.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  links.length,
                  (index) {
                    final link = links[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: CustomButton2(link: link),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
