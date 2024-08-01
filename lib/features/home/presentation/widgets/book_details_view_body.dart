import 'package:dev_zone/core/constants/colors.dart';
import 'package:dev_zone/core/constants/constants.dart';
import 'package:dev_zone/core/constants/styles.dart';
import 'package:dev_zone/core/service/service_locator.dart';
import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:dev_zone/core/widgets/error_message.dart';
import 'package:dev_zone/core/widgets/loading_indicator.dart';
import 'package:dev_zone/features/home/data/models/book_model/book_model.dart';
import 'package:dev_zone/features/home/data/models/book_model/item.dart';
import 'package:dev_zone/features/home/data/repos/home_repo_implementation.dart';
import 'package:dev_zone/features/home/presentation/manager/related_books_cubit/related_books_cubit.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_details_interaction.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image_list_view.dart';
import 'package:dev_zone/features/home/presentation/widgets/related_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsViewBody extends StatelessWidget {
  final Item? book;
  const BookDetailsViewBody({
    super.key,
    required this.book,
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
            child: BookImage(
              imageUrl: book?.volumeInfo?.imageLinks?.thumbnail ?? kAppName,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              book?.volumeInfo?.title ?? 'There is no title for this book.',
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
              book?.volumeInfo?.authors?[0] ??
                  'There is no authors for this book.',
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
              onTap: () async {
                Uri url = Uri.parse(
                    book?.volumeInfo?.previewLink ?? 'https://www.google.com/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
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
          BlocProvider(
            create: (context) =>
                RelatedBooksCubit(getIt.get<HomeRepoImplementation>())
                  ..getRelatedBook(
                      category:
                          book?.volumeInfo?.categories?[0] ?? 'Programming'),
            child: RelatedBooksListView(),
          ),
        ],
      ),
    );
  }
}
