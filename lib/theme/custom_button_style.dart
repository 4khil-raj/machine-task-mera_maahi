import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillOnPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL15 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              15.h,
            ),
            topRight: Radius.circular(
              15.h,
            ),
            bottomRight: Radius.circular(
              15.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillPrimaryTL7 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
