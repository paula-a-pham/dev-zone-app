import 'package:dev_zone/core/constants/colors.dart';
import 'package:dev_zone/core/utils/functions/book_status.dart';
import 'package:dev_zone/core/utils/helpers/url_helper.dart';
import 'package:dev_zone/features/home/data/models/book_model/item.dart';
import 'package:dev_zone/features/home/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookDetailsInteraction extends StatelessWidget {
  final Item? book;
  const BookDetailsInteraction({
    super.key,
    this.book,
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
            onTap: () {
              UrlHelper.openUrl(
                  url: book?.volumeInfo?.previewLink ??
                      'https://www.google.com/');
            },
            buttonColor: kRoyalOrange,
            text: getBookStatus(book: book),
            bottomRightRadius: 15.0,
            topRightRadius: 15.0,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
