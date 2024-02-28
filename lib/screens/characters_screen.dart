import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  int _currentSkin = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (BuildContext context, value, Widget? child) {
        final currentSkin = characterCards[_currentSkin];
        final selected = currentSkin.id == value.characterCard.id;
        final canSelect = value.boughtCharacters.contains(currentSkin.id);
        final canBuy =
            !canSelect && !selected && (value.coins >= currentSkin.price);
        return BGWidget(
          hasBG: false,
          child: Column(
            children: [
              SizedBox(height: 27.h),
              Text('Characters', style: AppTextStyles.textStyle6),
              SizedBox(height: 20.h),
              CarouselSlider(
                items: List.generate(
                  characterCards.length,
                  (index) {
                    final card = characterCards[index];
                    return CarouselItem(
                      selected: value.characterCard.id == card.id,
                      cardModel: card,
                    );
                  },
                ),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    _currentSkin = index;
                    setState(() {});
                  },
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
                    opacity: canSelect ? 0.6 : 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          canSelect ? 'Purchased' : '${currentSkin.price}',
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
                onTap: () => value.onSelectSkin(characterCards[_currentSkin]),
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
