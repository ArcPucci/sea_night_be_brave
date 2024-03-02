import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class BackgroundsScreen extends StatefulWidget {
  const BackgroundsScreen({super.key});

  @override
  State<BackgroundsScreen> createState() => _BackgroundsScreenState();
}

class _BackgroundsScreenState extends State<BackgroundsScreen> {
  int _currentBG = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        final currentBG = bgCards[_currentBG];
        final selected = currentBG.id == value.bgCard.id;
        final canSelect = value.boughtBG.contains(currentBG.id);
        final canBuy =
            !canSelect && !selected && (value.coins >= currentBG.price);
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
                    final selected = value.bgCard.id == card.id;
                    return CarouselItem(
                      selected: selected,
                      cardModel: card,
                    );
                  },
                ),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    _currentBG = index;
                    setState(() {});
                  },
                  height: 428.r,
                  aspectRatio: 256 / 420,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.12,
                  viewportFraction: 0.70,
                ),
              ),
              Expanded(
                child: Center(
                  child: Opacity(
                    opacity: canSelect ? 0.6 : 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          canSelect ? 'Purchased' : '${currentBG.price}',
                          style: AppTextStyles.textStyle10,
                        ),
                        if (!canSelect) ...[
                          SizedBox(width: 2.w),
                          Image.asset(
                            'assets/png/icons/coins.png',
                            width: 21.r,
                            height: 21.r,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton3(
                enabled: (!selected && canSelect) || canBuy,
                text: selected
                    ? 'Selected'
                    : canSelect
                        ? 'Select'
                        : 'Buy',
                onTap: () => value.onSelectBG(bgCards[_currentBG]),
              ),
              SizedBox(height: 32.h),
              const TotalBalance(),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }
}
