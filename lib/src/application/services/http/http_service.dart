import 'package:dio/dio.dart';

import '../../../../utils/sharedPreference.dart';
import '../../../domain/state/api_state.dart';

abstract class HttpService {
  Future<ApiState> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? body,
  });

  /// Http post request
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? body,
  });
}

class DioHttpService extends HttpService {
  late final Dio dio;

  DioHttpService({
    bool enableCaching = true,
  }) {
    _initDio();
  }

  _initDio() {
    dio = Dio(baseOptions);
  }

  BaseOptions get baseOptions => BaseOptions();

  @override
  Future<Map<String, String>> getHeader() async {
    return {
      'accept': 'application/json',
      "content-type": "application/json",
      "Authorization": await SharedPref.getData(key: SharedPref.token) ?? "",
    };
  }

  @override
  Future<ApiState> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    final headers = await getHeader();
    dio.options = BaseOptions(headers: headers);
    try {
      final response = await dio.get(endpoint, queryParameters: queryParameters, data: body);

      if (response.statusCode == 200) {
        return SuccessState(response.data);
      } else {
        return ErrorState(response.data, ErrorType.unknown);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final response = e.response;

        return ErrorState(response!.data, codeToType(response.statusCode));
      }
      if (e.error.toString().contains("SocketException")) {
        return NetworkState();
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return ConnectionTimeOut();
      }
      throw Exception(e.toString());
    }
  }

  @override
  Future<ApiState> post(String endpoint, {Map<String, dynamic>? queryParameters, Object? body}) async {
    final headers = await getHeader();
    dio.options = BaseOptions(headers: headers);
    try {
      final response = await dio.post(endpoint, data: body, queryParameters: {"_format": "json"});
      print("Like Count Provider state http :$response ");

      if (response.statusCode == 200) {
        return SuccessState(response.data);
      } else {
        return ErrorState(response.data, codeToType(response.statusCode));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final response = e.response;

        return ErrorState(response!.data, codeToType(response.statusCode));
      }
      if (e.error.toString().contains("SocketException")) {
        return NetworkState();
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return ConnectionTimeOut();
      }
      throw Exception(e.toString());
    }
  }
}
