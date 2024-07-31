import 'package:dio/dio.dart';

abstract class ApiFailure {
  final String errorMessage;

  ApiFailure({required this.errorMessage});
}

class ServerFailure extends ApiFailure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: 'Connection timeout, Please try later!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout, Please try later!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: 'Receive timeout, Please try later!');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage: 'Bad certificate, Please try later!');
      case DioExceptionType.badResponse:
        return ServerFailure(errorMessage: 'Bad response, Please try later!');
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: 'Request cancelled, Please try later!');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage: 'No internet connection, Please try later!');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: 'Unexpected Error, Please try later!');
      default:
        return ServerFailure(
            errorMessage: 'Opps There was an Error, Please try later!');
    }
  }
}
