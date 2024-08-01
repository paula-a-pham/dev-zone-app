import 'package:dev_zone/core/constants/styles.dart';
import 'package:dev_zone/core/service/service_locator.dart';
import 'package:dev_zone/features/home/data/models/book_model/item.dart';
import 'package:dev_zone/features/home/data/repos/home_repo_implementation.dart';
import 'package:dev_zone/features/home/presentation/manager/related_books_cubit/related_books_cubit.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_informations.dart';
import 'package:dev_zone/features/home/presentation/widgets/related_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BookInformations(
            book: book,
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
            child: const RelatedBooksListView(),
          ),
        ],
      ),
    );
  }
}
