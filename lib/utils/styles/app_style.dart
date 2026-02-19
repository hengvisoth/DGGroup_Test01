import 'package:flutter/material.dart';

import 'app_color.dart';

class AppRadius {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
}

class AppBorderRadius {
  static final BorderRadius sm = BorderRadius.circular(AppRadius.sm);
  static final BorderRadius md = BorderRadius.circular(AppRadius.md);
  static final BorderRadius lg = BorderRadius.circular(AppRadius.lg);
}

class AppTextStyles {
  static const TextStyle figmaBold8Capitalize = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 8,
    height: 1.2,
    letterSpacing: 0,
  );

  static const TextStyle figmaBold16Capitalize = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle figmaBold14Capitalize = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1,
    letterSpacing: 0,
  );

  static const TextStyle figmaBold10Uppercase = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 10,
    height: 1,
    letterSpacing: 0,
  );
}

class AppBoxShadow {
  static const boxShadow = BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5, offset: Offset(3, 0));
}

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColor.bgColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.secondaryColor,
      primary: AppColor.secondaryColor,
      surface: AppColor.surface,
    ).copyWith(onPrimary: AppColor.textOnPrimary, onSurface: AppColor.textColor),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.surface,
      foregroundColor: AppColor.textColor,
      titleTextStyle: AppTextStyles.figmaBold16Capitalize,
    ),
    textTheme: const TextTheme(
      bodySmall: AppTextStyles.figmaBold8Capitalize,
      titleMedium: AppTextStyles.figmaBold16Capitalize,
      labelSmall: AppTextStyles.figmaBold10Uppercase,
    ),
  );
}
