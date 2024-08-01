import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_zone/core/errors/api_failure.dart';
import 'package:dev_zone/features/home/data/models/book_model/book_model.dart';
import 'package:dev_zone/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  static FeaturedBooksCubit getFeaturedBooksCubit(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<ApiFailure, BookModel> result = await homeRepo.getFeaturedBooks();
    result.fold(
      (apiFailure) {
        emit(FeaturedBooksFailure(errorMessage: apiFailure.errorMessage));
      },
      (bookModel) {
        emit(FeaturedBooksSuccess(books: bookModel));
      },
    );
  }
}
