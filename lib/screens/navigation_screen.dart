import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
    required this.child,
    required this.path,
  });

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Material(
      child: Stack(
        children: [
          Positioned.fill(child: child),
          Positioned(
            bottom: 0,
            child: Container(
              width: 390.w,
              height: 66.h + overlay.bottom,
              color: AppTheme.blue,
            ),
          ),
          Positioned(
            bottom: overlay.bottom,
            child: CustomBottomBar(path: path),
          ),
        ],
      ),
    );
  }
}
