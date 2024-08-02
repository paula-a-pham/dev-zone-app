import 'package:dev_zone/core/constants/app_strings.dart';
import 'package:dev_zone/features/home/presentation/widgets/books_view_body.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.kAppName,
        ),
        titleSpacing: 15.0,
      ),
      body: const BooksViewBody(),
    );
  }
}
