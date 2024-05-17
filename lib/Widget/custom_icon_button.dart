import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

import '../theme/theme_helper.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: theme.colorScheme.onPrimary.withOpacity(1),
                  borderRadius: BorderRadius.circular(15.h),
                  border: Border.all(
                    color: appTheme.gray200,
                    width: 1.h,
                  ),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineOnPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(17.h),
        border: Border.all(
          color: theme.colorScheme.onPrimary.withOpacity(1),
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        borderRadius: BorderRadius.circular(39.h),
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
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(49.h),
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
  static BoxDecoration get outlineBlackTL34 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        borderRadius: BorderRadius.circular(34.h),
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
  static BoxDecoration get outlineBlackTL23 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        borderRadius: BorderRadius.circular(23.h),
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
  static BoxDecoration get outlineGrayTL15 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15.h),
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );
}
