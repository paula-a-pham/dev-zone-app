import 'package:dev_zone/core/constants/end_points.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void dioInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: kBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String endPoint,
      required Map<String, dynamic> queryParameters}) async {
    return await dio!.get(endPoint, queryParameters: queryParameters);
  }
}
