import 'package:dev_zone/core/constants/constants.dart';
import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:dev_zone/features/home/presentation/widgets/newest_books_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => SizedBox(
        height: context.getDeviceHeight() * 0.2,
        child: const NewestBooksItem(
            imageUrl: kAppName,
            title:
                'Symposium on Advanced Programming Methods for Digital Computers',
            author:
                'United States. Navy Mathematical Computing Advisory Panel'),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 15.0,
      ),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      physics: const BouncingScrollPhysics(),
    );
  }
}
