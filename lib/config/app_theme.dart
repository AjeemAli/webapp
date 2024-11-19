import 'package:flutter/material.dart';
import '../src/constant/app_colors.dart';
import '../src/constant/app_text_style.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
      // Primary color scheme
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: AppColors.background,
      // AppBar theme
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: AppTextStyles.heading,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.body,
        displayLarge: AppTextStyles.heading,
        displayMedium: AppTextStyles.subheading,
        bodySmall: AppTextStyles.caption,
      ),
      // Color scheme
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ).copyWith(
        secondary: AppColors.secondary,
        brightness: Brightness.light,  // Make sure this matches ThemeData brightness
        primary: AppColors.primary,  // Set the primary color explicitly
        onPrimary: AppColors.textPrimary,  // Set the text color for primary color
        background: AppColors.background,  // Set background color
        onBackground: AppColors.textPrimary,  // Set text color for background
        surface: AppColors.cardBackground,  // Set surface color (e.g., for cards)
        onSurface: AppColors.textPrimary,  // Set text color for surface
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: AppTextStyles.heading,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.body,
        displayLarge: AppTextStyles.heading,
        displayMedium: AppTextStyles.subheading,
        bodySmall: AppTextStyles.caption,
      ),
      // Color scheme for dark mode
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ).copyWith(
        secondary: AppColors.secondary,
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.textPrimary,
        background: AppColors.background,
        onBackground: AppColors.textPrimary,
        surface: AppColors.cardBackground,
        onSurface: AppColors.textPrimary,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
      ),
    );
  }
}
