import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

class InterestsChipView extends StatelessWidget {
  const InterestsChipView({super.key});

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.only(top: 7, right:10, bottom:8),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Travelling",
        style: TextStyle(
          color: Colors.red,
          fontSize:12,
          fontFamily: 'Sk-Modernist',
          fontWeight: FontWeight.w700,
        ),
      ),
      avatar: CustomImageView(
        imagePath: ImageConstant.imgCheckmarkPrimary,
        height: 16,
        width: 16,
        margin: EdgeInsets.only(right: 3),
      ),
      backgroundColor: Colors.white,
      selected: false,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
