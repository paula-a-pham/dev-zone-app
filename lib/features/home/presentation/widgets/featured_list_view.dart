import 'package:dev_zone/core/constants/constants.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const BookImage(imageUrl: kAppName),
      separatorBuilder: (context, index) => const SizedBox(
        width: 15.0,
      ),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
    );
  }
}
