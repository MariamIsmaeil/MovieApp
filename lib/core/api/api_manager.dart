import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/constants.dart';
@singleton
class ApiManager {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
            baseUrl: Constants.baseUrl,
          headers: {
            'Authorization': Constants.apikey,
          }
        )
    );
  }

  Future<Response> getRequest({required String endpoint, Map<String,
      dynamic>? queryParameters }) async {
    var response = await dio.get(endpoint,queryParameters: queryParameters);
    return response;

  }
}