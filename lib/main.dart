import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runZonedGuarded(() {
    runApp(ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return const MyApp();
      },
    ));
  }, (error, stack) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const Scaffold(),
    );
  }
}
