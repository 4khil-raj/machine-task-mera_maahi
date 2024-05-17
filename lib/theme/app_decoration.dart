import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow900,
      );

  // Outline decorations
  static BoxDecoration get outline => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.07),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              20,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration();
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.2),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              15,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get circleBorder29 => BorderRadius.circular(
        29.h,
      );
  static BorderRadius get circleBorder33 => BorderRadius.circular(
        33.h,
      );
  static BorderRadius get circleBorder39 => BorderRadius.circular(
        39.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL15 => BorderRadius.vertical(
        bottom: Radius.circular(15.h),
      );
  static BorderRadius get customBorderTL15 => BorderRadius.only(
        topLeft: Radius.circular(15.h),
        topRight: Radius.circular(15.h),
        bottomRight: Radius.circular(15.h),
      );
  static BorderRadius get customBorderTL151 => BorderRadius.only(
        topLeft: Radius.circular(15.h),
        topRight: Radius.circular(15.h),
        bottomLeft: Radius.circular(15.h),
      );
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(30.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get roundedBorder48 => BorderRadius.circular(
        48.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder67 => BorderRadius.circular(
        67.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
