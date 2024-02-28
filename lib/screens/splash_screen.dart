import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/services/preferences_services.dart';
import 'package:sea_night_be_brave/utils/utils.dart';
import 'package:sea_night_be_brave/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<PreferencesService>(
      context,
      listen: false,
    );

    Future.delayed(const Duration(seconds: 1), () {
      final firstInit = provider.getFirstInit();
      final path = firstInit ? '/onboarding' : '/';
      context.go(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      hasBottomBar: false,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 245.h),
            Container(
              width: 200.sp,
              height: 200.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.r,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/png/app_icon.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'SeaNight:',
              style: AppTextStyles.textStyle1.copyWith(
                color: AppTheme.cyan,
              ),
            ),
            Text('Be Brave', style: AppTextStyles.textStyle1),
          ],
        ),
      ),
    );
  }
}
