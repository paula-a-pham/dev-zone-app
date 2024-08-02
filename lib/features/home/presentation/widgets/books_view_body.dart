import 'package:dev_zone/core/constants/app_styles.dart';
import 'package:dev_zone/features/home/presentation/widgets/featured_list_view.dart';
import 'package:dev_zone/features/home/presentation/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        FeaturedListView(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 15.0, left: 15.0),
            child: Text(
              'Newest Books',
              style: AppStyles.kTextStyle18,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: 15.0,
            left: 15.0,
            right: 15.0,
          ),
          sliver: NewestBooksListView(),
        ),
      ],
    );
  }
}
