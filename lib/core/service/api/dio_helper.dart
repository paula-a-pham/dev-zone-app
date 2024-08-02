import 'package:dev_zone/core/constants/app_end_points.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;

  static void dioInit() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppEndPoints.kBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String endPoint,
      required Map<String, dynamic> queryParameters}) async {
    return await _dio!.get(endPoint, queryParameters: queryParameters);
  }
}
