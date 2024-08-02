import 'package:dev_zone/core/constants/app_colors.dart';
import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:flutter/material.dart';

class BookImageError extends StatelessWidget {
  const BookImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kBlackOfNight,
      child: Icon(
        Icons.error_outline_rounded,
        color: AppColors.kBrightGrey,
        size: context.getDeviceWidth() * 0.1,
      ),
    );
  }
}
