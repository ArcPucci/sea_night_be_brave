import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return GameProvider(
          router: GoRouter.of(context),
        );
      },
      child: Consumer<GameProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return BGWidget(
            hasBG: false,
            child: Column(
              children: [
                SizedBox(height: 19.h),
                const GameAppBar(),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (int j = 0; j < value.width; j++)
                                        CellWidget(box: value.matrix[i][j]),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: -26.r,
                            top: -26.r,
                            child: const MovePad(),
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
          );
        },
      ),
    );
  }
}
