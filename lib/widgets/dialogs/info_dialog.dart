import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class InfoDialog extends StatefulWidget {
  const InfoDialog({super.key});

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  bool firstScreen = true;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return ClipPath(
      clipper: firstScreen ? MyClipper(overlay) : null,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
        child: Material(
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            child: firstScreen ? _buildFirstBody() : _buildSecondBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstBody() {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Container(
          width: 336.w,
          height: 49.h,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: Image.asset(
              'assets/png/icons/close.png',
              width: 36.r,
              height: 36.r,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: Center(
            child: Container(
              width: 336.r,
              height: 560.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage('assets/png/picture4.png'),
                  fit: BoxFit.fill,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.symmetric(horizontal: 39.w),
              child: Column(
                children: [
                  Text(
                    'Balance of your current game, at the end of the game it will be added to the total balance',
                    style: AppTextStyles.textStyle7,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4 * 56.r + 16.h),
                  Text(
                    'Move around the seabed in search of treasures, tapping on the cells next to your character',
                    style: AppTextStyles.textStyle7,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Center(
                      child: CustomButton3(
                        text: 'About the finds',
                        onTap: () => setState(() => firstScreen = false),
                      ),
                    ),
                  ),
                  Text(
                    'Your total balance is accumulated for all games and can be used for purchases in the store',
                    style: AppTextStyles.textStyle7,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 28.r + 4.h + (17 / 14) * 14.r),
        SizedBox(height: 78.h),
      ],
    );
  }

  Widget _buildSecondBody() {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Container(
          width: 336.w,
          height: 49.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => setState(() => firstScreen = true),
                child: Image.asset(
                  'assets/png/icons/back.png',
                  width: 36.r,
                  height: 36.r,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Image.asset(
                  'assets/png/icons/close.png',
                  width: 36.r,
                  height: 36.r,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: 286.w,
          child: Text(
            'You can find the following things underwater:',
            style: AppTextStyles.textStyle10,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 317.w,
          child: Column(
            children: [
              InfoItem(
                text: 'Gold',
                text2: ', +10 to game balance',
                asset: 'assets/png/info/gold.png',
              ),
              SizedBox(height: 10.h),
              InfoItem(
                text: 'Emerald',
                text2: ', +15 to game balance',
                asset: 'assets/png/info/emerald.png',
              ),
              SizedBox(height: 10.h),
              InfoItem(
                text: 'Diamond',
                text2: ', +25 to game balance',
                asset: 'assets/png/info/diamond.png',
              ),
              SizedBox(height: 10.h),
              InfoItem(
                text: 'Lucky coin',
                text2: ', the Jackpot\nmini-game starts',
                asset: 'assets/png/info/lucky.png',
              ),
              SizedBox(height: 10.h),
              InfoItem(
                text: 'Unlucky coin',
                text2: ', the AntiJackpot\nmini-game starts',
                color: AppTheme.red,
                asset: 'assets/png/info/unlucky.png',
              ),
              SizedBox(height: 10.h),
              InfoItem(
                text: 'Worm',
                text2: ", breaks the character's\nspecial device",
                color: AppTheme.red,
                asset: 'assets/png/info/worm.png',
              ),
              SizedBox(height: 10.h),
              InfoItem(
                text: 'Shark',
                text2:
                    ', -20 of the current game\nbalance and -5% of the total',
                color: AppTheme.red,
                asset: 'assets/png/info/shark.png',
              ),
              SizedBox(height: 10.h),
              InfoItem(
                text: 'Exit',
                text2:
                    ', the surface is where you\nstarted from and must return\nto complete the game.',
                asset: 'assets/png/info/exit.png',
              ),
            ],
          ),
        ),
        Spacer(),
        CustomButton3(
          text: 'Back to Game',
          onTap: Navigator.of(context).pop,
        ),
        SizedBox(height: 78.h),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final EdgeInsets edgeInsets;

  MyClipper(this.edgeInsets);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.fillType = PathFillType.evenOdd;
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(
            145.w + (100.w / 2),
            12.h + edgeInsets.top + (49.h / 2),
          ),
          width: 100.w,
          height: 49.h,
        ),
        Radius.circular(6),
      ),
    );

    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          128.w,
          edgeInsets.top + 648.h + 68.h / 2,
          134.w,
          68.h,
        ),
        Radius.circular(6),
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
