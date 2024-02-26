import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sea_night_be_brave/models/models.dart';
import 'package:sea_night_be_brave/utils/utils.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key, required this.path});

  final String path;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          tabBarItems.length,
          (index) {
            final item = tabBarItems[index];
            final selected = index == getSelected();
            return GestureDetector(
              onTap: () => onTap(item),
              child: Container(
                width: 130.w,
                height: 66.h,
                color: Colors.transparent,
                child: Opacity(
                  opacity: selected ? 1 : 0.5,
                  child: Column(
                    children: [
                      Image.asset(
                        item.asset,
                        width: 32.r,
                        height: 32.r,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 7.h),
                      Text(item.title, style: AppTextStyles.textStyle2),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  int getSelected() {
    for (int i = tabBarItems.length - 1; i >= 0; i--) {
      if (widget.path.contains(tabBarItems[i].path)) return i;
    }
    return 0;
  }

  void onTap(TabBarItem item) {
    context.go(item.path);
    setState(() {});
  }
}
