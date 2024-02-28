import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color cyan = Color(0xFF00FFFF);
  static const Color black = Color(0xFF141414);
  static const Color white = Color(0xFFC5D9FF);
  static const Color blue = Color(0xFF0066C5);
  static const Color blue2 = Color(0xFF000AF0);
  static const Color darkBlue = Color(0xFF0007AB);
  static const Color green = Color(0xFF3EF02E);
  static const Color brown = Color(0xFF5F5F5F);
  static const Color yellow = Color(0xFFFAFF00);
  static const Color yellow2 = Color(0xFFE1B700);
  static const Color gold = Color(0xFFFFCB32);
  static const Color red = Color(0xFFFF4040);

  static const LinearGradient bgGradient = LinearGradient(
    colors: [
      Color(0xFF00C4C4),
      blue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient blueGradient = LinearGradient(
    colors: [
      blue.withOpacity(0),
      blue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient thirdGradient = LinearGradient(
    colors: [
      Color(0xFFBDE9E9),
      Color(0xFFA1D9D9),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient secondGradient = LinearGradient(
    colors: [
      Color(0xFF1F8AB7),
      Color(0xFF0059AB),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient1 = LinearGradient(
    colors: [
      const Color(0xFF018BA3).withOpacity(0),
      const Color(0xFF018BA3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient2 = LinearGradient(
    colors: [
      const Color(0xFF0165A5).withOpacity(0),
      const Color(0xFF0165A5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient3 = LinearGradient(
    colors: [
      const Color(0xFF0176AC).withOpacity(0),
      const Color(0xFF0176AC),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final BoxShadow boxShadow1 = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    offset: const Offset(0, 4),
    blurRadius: 10.r,
  );
}
