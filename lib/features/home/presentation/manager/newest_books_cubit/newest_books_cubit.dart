import 'package:dartz/dartz.dart';
import 'package:dev_zone/core/errors/api_failure.dart';
import 'package:dev_zone/features/home/data/models/book_model/book_model.dart';
import 'package:dev_zone/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  static NewestBooksCubit getNewestBooksCubit(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    Either<ApiFailure, BookModel> result = await homeRepo.getNewestBooks();
    result.fold(
      (apiFailure) {
        emit(NewestBooksFailure(errorMessage: apiFailure.errorMessage));
      },
      (bookModel) {
        emit(NewestBooksSuccess(books: bookModel));
      },
    );
  }
}
