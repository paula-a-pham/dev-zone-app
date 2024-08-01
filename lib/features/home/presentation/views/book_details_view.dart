import 'package:dev_zone/features/home/data/models/book_model/item.dart';
import 'package:dev_zone/features/home/presentation/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final Item? book;
  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BookDetailsViewBody(
        book: book,
      ),
    );
  }
}
