import 'package:dev_zone/core/constants/app_colors.dart';
import 'package:dev_zone/core/constants/app_strings.dart';
import 'package:dev_zone/core/constants/app_styles.dart';
import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:dev_zone/features/home/data/models/book_model/item.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_details_interaction.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class BookInformations extends StatelessWidget {
  final Item? book;
  const BookInformations({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: context.getDeviceHeight() * 0.3,
          child: BookImage(
            imageUrl:
                book?.volumeInfo?.imageLinks?.thumbnail ?? AppStrings.kAppName,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            book?.volumeInfo?.title ?? 'There is no title for this book.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.kTextStyle18,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            book?.volumeInfo?.authors?[0] ??
                'There is no authors for this book.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.kTextStyle14.copyWith(
              fontSize: 16,
              color: AppColors.kCloudCover,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: BookDetailsInteraction(
            book: book,
          ),
        ),
      ],
    );
  }
}
