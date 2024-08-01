import 'package:flutter/material.dart';

extension AppNavigation on BuildContext {
  void navigateTo(Widget view) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }
}
