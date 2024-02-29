import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return GameProvider(
          router: router,
          levelManager: Provider.of(context, listen: false),
          storeProvider: Provider.of(context, listen: false),
        );
      },
      child: Consumer<GameProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return PopScope(
            canPop: false,
            child: BGWidget(
              hasBG: value.bgCard.image.isEmpty ? false : true,
              bg: value.bgCard.image,
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  GameAppBar(
                    balance: value.balance,
                    onClose: () => onShowExitDialog(context),
                    onInfo: () => onShowInfoDialog(context),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 336.r,
                        height: 560.r,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < value.height; i++)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int j = 0; j < value.width; j++)
                                          CellWidget(box: value.matrix[i][j]),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: -26.r + 56.r * value.x,
                              top: -26.r + 56.r * value.y,
                              child: MovePad(
                                onDown: value.goDown,
                                onLeft: value.goLeft,
                                onRight: value.goRight,
                                onUp: value.goUp,
                              ),
                            ),
                            if (value.boxType != BoxType.idle)
                              FindView(
                                boxType: value.boxType,
                                onChoose: value.onChoose,
                                onExit: value.onExit,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const TotalBalance(),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void onShowExitDialog(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
          child: const Center(child: ExitDialog()),
        );
      },
    );
  }

  void onShowInfoDialog(BuildContext context) async {
    await showDialog(
      barrierColor: Colors.transparent,
      useSafeArea: false,
      context: context,
      builder: (context) {
        return const InfoDialog();
      },
    );
  }
}
