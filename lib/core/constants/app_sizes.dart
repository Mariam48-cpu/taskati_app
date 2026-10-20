import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppSizes {
  // Spacing
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 40;

  // Radius
  static double get radiusXs => 6.r;
  static double get radiusSm => 8.r;
  static double get radiusMd => 30.r;
  static double get radiusLg => 12.r;
  static double get radiusXl => 20.r;
  static double get radiusXxl => 24.r;
  static double get radiusRound => 999.r;

  // Buttons
  static double get buttonHeight => 40.h;
  static double get buttonSmallHeight => 36.h;
  static double get buttonWidth => 327.w;

  // Inputs
  static double get inputHeight => 52.h;

  // Avatar
  static const double avatarSmall = 32;
  static const double avatarMedium = 44;
  static const double avatarLarge = 64;
  static const double avatarXLarge = 88;

  // Icons
  static const double iconSmall = 16;
  static const double iconMedium = 20;
  static const double iconLarge = 24;
  static const double iconXLarge = 32;

  // Bottom navigation
  static double get bottomNavHeight => 98.h;

  // Screen
  static const double screenHorizontalPadding = 20;
}
