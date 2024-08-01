import 'package:dev_zone/core/constants/colors.dart';
import 'package:dev_zone/core/constants/constants.dart';
import 'package:dev_zone/core/constants/styles.dart';
import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_details_interaction.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: context.getDeviceHeight() * 0.3,
            child: const BookImage(
              imageUrl: kAppName,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              kAppName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kTextStyle18,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              kAppName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kTextStyle14.copyWith(
                fontSize: 16,
                color: kCloudCover,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: BookDetailsInteraction(
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You may also like',
                style: kTextStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: context.getDeviceHeight() * 0.2,
            //child: const BookImageListView(),
            child: const Icon(Icons.error_outline_rounded),
          ),
        ],
      ),
    );
  }
}
