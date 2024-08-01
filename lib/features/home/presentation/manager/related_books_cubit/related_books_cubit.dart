import 'package:dartz/dartz.dart';
import 'package:dev_zone/core/errors/api_failure.dart';
import 'package:dev_zone/features/home/data/models/book_model/book_model.dart';
import 'package:dev_zone/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit(this.homeRepo) : super(RelatedBooksInitial());

  final HomeRepo homeRepo;

  static RelatedBooksCubit getRelatedBooksCubit(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getRelatedBook({required String category}) async {
    emit(RelatedBooksLoading());
    Either<ApiFailure, BookModel> result =
        await homeRepo.getRelatedBooks(category: category);
    result.fold(
      (apiFailure) {
        emit(RelatedBooksFailure(errorMessage: apiFailure.errorMessage));
      },
      (bookModel) {
        emit(RelatedBooksSuccess(books: bookModel));
      },
    );
  }
}
