import 'package:dio/dio.dart';
import 'package:restapiwithdio/model/network_response.dart';

class NetworkExecutor {
  final Dio _dio;

  NetworkExecutor(this._dio);

  Future<NetworkResponse> getRequest({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    Response? response;
    try {
      response = await _dio.get(
        path,
        queryParameters: queryParams,
        options: options,
      );
      return NetworkResponse(
        response.statusCode ?? -1,
        response.data,
        response.headers,
        response.statusMessage ?? '',
      );
    }
    catch (e) {
      return NetworkResponse(
        response?.statusCode ?? -1,
        response?.data ??
            {
              'success': false,
              'message': 'Something went wrong',
              'response_code': -1
            },
        response?.headers ?? <String, dynamic>{},
        response?.statusMessage ?? '',
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    dynamic data,
    Options? options,
  }) async {
    Response? response;
    try {
      response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParams,
        options: options,
      );
      return NetworkResponse(
        response.statusCode ?? -1,
        response.data,
        response.headers,
        response.statusMessage ?? '',
      );
    } catch (e) {
      return NetworkResponse(
        response?.statusCode ?? -1,
        response?.data ??
            {
              'success': false,
              'message': 'Something went wrong',
              'response_code': -1
            },
        response?.headers ?? {},
        response?.statusMessage ?? '',
      );
    }
  }

  Future<NetworkResponse> putRequest({
    required String path,
    Map<String, dynamic>? queryParams,
    dynamic data,
  }) async {
    final Response response =
    await _dio.put(path, data: data, queryParameters: queryParams);
    return NetworkResponse(
      response.statusCode ?? -1,
      response.data,
      response.headers,
      response.statusMessage ?? '',
    );
  }

  Future<NetworkResponse> patchRequest({
    required String path,
    Map<String, dynamic>? queryParams,
    Options? options,
    dynamic data,
  }) async {
    final Response response = await _dio.patch(
        path,
        queryParameters: queryParams,
        options: options,
        data: data
    );
    return NetworkResponse(
      response.statusCode ?? -1,
      response.data ?? {},
      response.headers,
      response.statusMessage ?? '',
    );
  }

  Future<NetworkResponse> deleteRequest({
    required String path,
    Map<String, dynamic>? queryParams,
    dynamic data,
  }) async {
    final Response response =
    await _dio.delete(path, data: data, queryParameters: queryParams);
    return NetworkResponse(
      response.statusCode ?? -1,
      response.data,
      response.headers,
      response.statusMessage ?? '',
    );
  }
}