import 'package:dev_zone/core/constants/colors.dart';
import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:flutter/material.dart';

class FeaturedItemError extends StatelessWidget {
  const FeaturedItemError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlackOfNight,
      child: Icon(
        Icons.error_outline_rounded,
        color: kBrightGrey,
        size: context.getDeviceWidth() * 0.1,
      ),
    );
  }
}
