import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class BackgroundsScreen extends StatelessWidget {
  const BackgroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      hasBG: false,
      child: Column(
        children: [
          SizedBox(height: 27.h),
          Text('Backgrounds', style: AppTextStyles.textStyle6),
          SizedBox(height: 20.h),
          CarouselSlider(
            items: List.generate(
              bgCards.length,
              (index) {
                final card = bgCards[index];
                return CarouselItem(
                  selected: card.id == 0,
                  cardModel: card,
                );
              },
            ),
            options: CarouselOptions(
              height: 428.h,
              aspectRatio: 256 / 420,
              enlargeCenterPage: true,
              enlargeFactor: 0.12,
              viewportFraction: 0.70,
            ),
          ),
          Expanded(
            child: Center(
              child: Opacity(
                opacity: 0.6,
                child: Text('Purchased', style: AppTextStyles.textStyle10),
              ),
            ),
          ),
          const CustomButton3(text: 'Selected'),
          SizedBox(height: 32.h),
          const TotalBalance(),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
