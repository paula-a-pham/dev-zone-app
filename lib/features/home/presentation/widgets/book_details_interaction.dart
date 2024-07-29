import 'package:dev_zone/core/constants/colors.dart';
import 'package:dev_zone/features/home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookDetailsInteraction extends StatelessWidget {
  final VoidCallback onTap;
  const BookDetailsInteraction({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: CustomButton(
            buttonColor: Colors.white,
            text: 'Free',
            bottomLeftRadius: 15.0,
            topLeftRadius: 15.0,
            textColor: kBlackOfNight,
          ),
        ),
        Expanded(
          child: CustomButton(
            onTap: onTap,
            buttonColor: kRoyalOrange,
            text: 'Preview',
            bottomRightRadius: 15.0,
            topRightRadius: 15.0,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
