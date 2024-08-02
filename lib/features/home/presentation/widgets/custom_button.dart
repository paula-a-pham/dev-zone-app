import 'package:dev_zone/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? bottomLeftRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? topRightRadius;
  final Color buttonColor;
  final String text;
  final Color textColor;
  const CustomButton({
    super.key,
    this.onTap,
    this.bottomLeftRadius = 0.0,
    this.topLeftRadius = 0.0,
    this.bottomRightRadius = 0.0,
    this.topRightRadius = 0.0,
    required this.buttonColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeftRadius!),
            topLeft: Radius.circular(topLeftRadius!),
            bottomRight: Radius.circular(bottomRightRadius!),
            topRight: Radius.circular(topRightRadius!),
          ),
          color: buttonColor,
        ),
        child: Text(
          text,
          style: AppStyles.kTextStyle18.copyWith(color: textColor),
        ),
      ),
    );
  }
}
