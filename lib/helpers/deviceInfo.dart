import 'package:flutter/material.dart';

class DeviceInfo {
  BuildContext? context;

  double? height, width;

  DeviceInfo(BuildContext context) {
    context = context;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}