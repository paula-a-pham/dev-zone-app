import 'package:flutter/material.dart';

extension DeviceDetails on BuildContext {
  double getDeviceHeight() {
    return MediaQuery.of(this).size.height;
  }

  double getDeviceWidth() {
    return MediaQuery.of(this).size.width;
  }
}
