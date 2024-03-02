import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class CellWidget extends StatelessWidget {
  const CellWidget({
    super.key,
    required this.box,
  });

  final Box box;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (336.r / 6).floorToDouble(),
      height:( 560.r / 10).floorToDouble(),
      decoration: BoxDecoration(
        color: (box.isOpened && box is! User)
            ? box is Finish
                ? AppTheme.blue2
                : AppTheme.darkBlue
            : null,
        borderRadius: BorderRadius.circular(4),
        border: (box is User)
            ? null
            : GradientBoxBorder(
                width: 2.r,
                gradient: box.isOpened
                    ? AppTheme.secondGradient
                    : AppTheme.thirdGradient,
              ),
        image: (box is User || box is Finish)
            ? null
            : DecorationImage(
                image: box.isOpened
                    ? const AssetImage('assets/png/cells/bubbles.png')
                    : const AssetImage('assets/png/cells/seabed.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
      ),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    if (box is User) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: 2,
            child: Image.asset(
              box.skin,
              width: 56.r,
              height: 56.r,
              alignment: const Alignment(0, -1.75),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 56.r,
            height: 56.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: GradientBoxBorder(
                width: 2.sp,
                gradient: AppTheme.secondGradient,
              ),
            ),
          ),
        ],
      );
    }
    if (!box.isOpened) return const SizedBox();
    return Image.asset(
      box.skin,
      width: 56.r,
      height: 56.r,
      fit: BoxFit.cover,
    );
  }
}
