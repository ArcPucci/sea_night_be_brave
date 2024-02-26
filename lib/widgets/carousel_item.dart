import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.cardModel,
    this.selected = false,
  });

  final bool selected;
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(cardModel is CharacterCard)
        Image.asset(
          'assets/png/bg/bg6.png',
          width: 256.w,
          height: 420.h,
          fit: BoxFit.cover,
        ),
        Container(
          width: 256.w,
          height: 420.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(cardModel.asset),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 2),
                blurStyle: BlurStyle.outer,
                blurRadius: 10.r,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 6.sp,
              color: selected ? AppTheme.gold : Colors.white,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 256.w,
            height: 138.h,
            decoration: BoxDecoration(
              gradient: AppTheme.gradient3,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(5),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: _buildText(),
          ),
        ),
      ],
    );
  }

  Widget _buildText() {
    if (cardModel is CharacterCard) {
      return SizedBox(
        width: 198.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(cardModel.title, style: AppTextStyles.textStyle6),
            Text(
              (cardModel as CharacterCard).subTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle7.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            cardModel.title,
            style: AppTextStyles.textStyle3.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30.h),
        ],
      );
    }
  }
}
