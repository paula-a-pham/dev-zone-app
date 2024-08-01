import 'package:dev_zone/core/constants/constants.dart';
import 'package:dev_zone/core/utils/extensions/app_navigation.dart';
import 'package:dev_zone/features/home/data/models/book_model/book_model.dart';
import 'package:dev_zone/features/home/presentation/views/book_details_view.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class BookImageListView extends StatelessWidget {
  final BookModel books;
  const BookImageListView({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () =>
            context.navigateTo(BookDetailsView(book: books.items?[index])),
        child: BookImage(
            imageUrl: books.items?[index].volumeInfo?.imageLinks?.thumbnail ??
                kAppName),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 15.0,
      ),
      itemCount: books.items?.length ?? 0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
    );
  }
}
