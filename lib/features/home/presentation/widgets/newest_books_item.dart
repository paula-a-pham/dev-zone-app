import 'package:dev_zone/core/constants/colors.dart';
import 'package:dev_zone/core/constants/styles.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class NewestBooksItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  const NewestBooksItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        BookImage(
          imageUrl: imageUrl,
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: kTextStyle18,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kTextStyle14.copyWith(color: kCloudCover),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                'Free',
                style: kTextStyle18.copyWith(
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
