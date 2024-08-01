import 'package:dev_zone/core/constants/constants.dart';
import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:dev_zone/core/widgets/error_message.dart';
import 'package:dev_zone/core/widgets/loading_indicator.dart';
import 'package:dev_zone/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:dev_zone/features/home/presentation/widgets/newest_books_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.separated(
            itemBuilder: (context, index) => SizedBox(
              height: context.getDeviceHeight() * 0.2,
              child: NewestBooksItem(
                imageUrl: state.books.items?[index].volumeInfo?.imageLinks
                        ?.thumbnail ??
                    kAppName,
                title: state.books.items?[index].volumeInfo?.title ??
                    'There is no title for this book.',
                author: state.books.items?[index].volumeInfo?.authors?[0] ??
                    'There is no authors for this book.',
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 15.0,
            ),
            itemCount: state.books.items?.length,
          );
        } else if (state is NewestBooksFailure) {
          return SliverFillRemaining(
              child: ErrorMessage(errorMessage: state.errorMessage));
        } else {
          return const SliverFillRemaining(child: LoadingIndicator());
        }
      },
    );
  }
}
