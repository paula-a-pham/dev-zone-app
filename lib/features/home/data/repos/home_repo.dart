import 'package:dartz/dartz.dart';
import 'package:dev_zone/core/errors/api_failure.dart';
import 'package:dev_zone/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<ApiFailure, BookModel>> getFeaturedBooks();
  Future<Either<ApiFailure, BookModel>> getNewestBooks();
  Future<Either<ApiFailure, BookModel>> getRelatedBooks(
      {required String category});
}
