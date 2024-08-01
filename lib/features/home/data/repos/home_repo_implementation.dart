import 'package:dartz/dartz.dart';
import 'package:dev_zone/core/constants/end_points.dart';
import 'package:dev_zone/core/errors/api_failure.dart';
import 'package:dev_zone/core/service/api/dio_helper.dart';
import 'package:dev_zone/features/home/data/models/book_model/book_model.dart';
import 'package:dev_zone/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation extends HomeRepo {
  @override
  Future<Either<ApiFailure, BookModel>> getFeaturedBooks() async {
    try {
      var response =
          await DioHelper.getData(endPoint: kVolumes, queryParameters: {
        'q': 'Programming',
        'filter': 'free-ebooks',
      });
      return right(BookModel.fromJson(response.data));
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, BookModel>> getNewestBooks() async {
    try {
      var response =
          await DioHelper.getData(endPoint: kVolumes, queryParameters: {
        'q': 'Programming',
        'filter': 'free-ebooks',
        'orderBy': 'newest',
      });
      return right(BookModel.fromJson(response.data));
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<ApiFailure, BookModel>> getRelatedBooks() {
    // TODO: implement getRelatedBooks
    throw UnimplementedError();
  }
}
