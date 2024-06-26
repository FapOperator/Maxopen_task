import 'package:flutter/material.dart';
import 'package:maxopen_task/core/theme/app_color.dart';

abstract class AppTheme {
  static final dark = ThemeData(
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColor.white,
        fontSize: 30,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColor.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF888888),
        fontSize: 16,
        fontFamily: 'Poppins',
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 18,
      ),
    ),
    // appBarTheme: const AppBarTheme(backgroundColor: AppColor.white),
    // colorScheme: const ColorScheme(
    //     secondary: AppColor.text80,
    //     background: AppColor.text80,
    //     brightness: Brightness.light,
    //     error: AppColor.text80,
    //     onBackground: AppColor.text80,
    //     onError: AppColor.text80,
    //     onPrimary: AppColor.text80,
    //     onSecondary: AppColor.text80,
    //     onSurface: AppColor.text80,
    //     primary: AppColor.accentBrand,
    //     primaryContainer: AppColor.text80,
    //     secondaryContainer: AppColor.text80,
    //     surface: AppColor.text80),
    // primarySwatch: AppColor.white,
    // backgroundColor: AppColor.accentBrand,
    // scaffoldBackgroundColor: AppColor.surface,
    // inputDecorationTheme: InputDecorationTheme(
    //   focusedErrorBorder:
    //       OutlineInputBorder(borderSide: BorderSide(color: AppColor.error80)),
    //   errorBorder:
    //       OutlineInputBorder(borderSide: BorderSide(color: AppColor.error80)),
    //   suffixStyle:
    //       AppTextStyle.mainText.copyWith(color: AppColor.accentBrand80),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(5.0),
    //     borderSide: const BorderSide(color: AppColor.outline),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(5.0),
    //     borderSide: const BorderSide(color: AppColor.blue),
    //   ),
    //   labelStyle: AppTextStyle.mainText.copyWith(color: AppColor.text60),
    // ),
    // textSelectionTheme:
    //     const TextSelectionThemeData(cursorColor: AppColor.blue),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: TextButton.styleFrom(
    //     backgroundColor: AppColor.accentBrand,
    //     foregroundColor: AppColor.surface,
    //     textStyle: AppTextStyle.mainText,
    //   ),
    // ),
    // radioTheme: RadioThemeData(
    //   fillColor: MaterialStateProperty.resolveWith<Color>((states) {
    //     if (states.contains(MaterialState.disabled)) {
    //       return AppColor.text60;
    //     } else if (states.contains(MaterialState.selected)) {
    //       return AppColor.accentBrand;
    //     }
    //     return AppColor.text60;
    //   }),
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.resolveWith<Color>((states) {
    //     if (states.contains(MaterialState.disabled)) {
    //       return AppColor.text60;
    //     } else if (states.contains(MaterialState.selected)) {
    //       return AppColor.accentBrand;
    //     }
    //     return AppColor.text60;
    //   }),
    // ),
    // switchTheme: SwitchThemeData(
    //   thumbColor: MaterialStateProperty.resolveWith<Color>(
    //     (states) {
    //       if (states.contains(MaterialState.disabled)) {
    //         return AppColor.text80;
    //       } else if (states.contains(MaterialState.selected)) {
    //         return AppColor.accentBrand;
    //       }
    //       return AppColor.text80;
    //     },
    //   ),
    //   trackColor: MaterialStateProperty.resolveWith<Color>(
    //     (states) {
    //       if (states.contains(MaterialState.disabled)) {
    //         return AppColor.text60;
    //       } else if (states.contains(MaterialState.selected)) {
    //         return AppColor.accentBrand38;
    //       }
    //       return AppColor.text60;
    //     },
    //   ),
    // ),
    // snackBarTheme: SnackBarThemeData(
    //   backgroundColor: AppColor.blackAlpha[80],
    //   actionTextColor: AppColor.accentBrand80,
    // ),
  );
}
