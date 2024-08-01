import 'package:dev_zone/core/utils/extensions/device_details.dart';
import 'package:dev_zone/core/widgets/error_message.dart';
import 'package:dev_zone/core/widgets/loading_indicator.dart';
import 'package:dev_zone/features/home/presentation/manager/related_books_cubit/related_books_cubit.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_image_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedBooksListView extends StatelessWidget {
  const RelatedBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getDeviceHeight() * 0.2,
      child: BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
        builder: (context, state) {
          if (state is RelatedBooksSuccess) {
            return BookImageListView(
              books: state.books,
            );
          } else if (state is RelatedBooksFailure) {
            return ErrorMessage(errorMessage: state.errorMessage);
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
