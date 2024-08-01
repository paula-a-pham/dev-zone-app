import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:dev_zone/core/widgets/error_message.dart';
import 'package:dev_zone/core/widgets/loading_indicator.dart';
import 'package:dev_zone/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: context.getDeviceHeight() * 0.25,
            child: BookImageListView(
              books: state.books,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return ErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
