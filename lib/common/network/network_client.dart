import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monki_bloc/common/constant/status_code.dart';
import 'package:monki_bloc/common/network/model/base_response.dart';
import 'package:monki_bloc/config/base_url.dart';

class NetworkClient {
  static final NetworkClient _instance = NetworkClient._();

  NetworkClient._() {
    _dio = Dio(apiOption);
    _dio.interceptors.addAll([
      // TokenInterceptor(),
    ]);
  }
  factory NetworkClient() => _instance;

  late Dio _dio;
  final BaseOptions apiOption = BaseOptions(
    baseUrl: BaseUrl.getServerUrl(),
    connectTimeout: const Duration(seconds: 10),
  );

  Future<BaseResponse> get({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    try {
      debugPrint('API GET request: ${BaseUrl.getServerUrl()}$endpoint');
      debugPrint('API log params: $params');

      final res = await _dio.request(
        endpoint,
        queryParameters: params,
        options: Options(method: "GET"),
      );

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  Future<BaseResponse> post({
    required String endpoint,
    required Map<String, dynamic> params,
  }) async {
    try {
      debugPrint('API POST request: ${BaseUrl.getServerUrl()}$endpoint');
      debugPrint('API log params: $params');

      final res = await _dio.request(
        endpoint,
        data: params,
        options: Options(method: "POST"),
      );

      return _handleResponse(res);
    } catch (e) {
      return _handleResponse(null);
    }
  }

  BaseResponse _handleResponse(Response? response) {
    if (response == null) {
      debugPrint("==== API call failed ====");
      return BaseResponse(
        statusCode: StatusCode.crash,
        message: "Something went wrong !!!",
      );
    }

    Map<String, dynamic>? jsonData = <String, dynamic>{};
    try {
      jsonData = Map.from(response.data);
    } catch (e) {
      jsonData = null;
    }

    final data = BaseResponse(
      statusCode: response.statusCode ?? StatusCode.crash,
      data: jsonData != null ? jsonData["data"] : null,
      message: jsonData != null ? jsonData["message"] : null,
      paging: (jsonData != null && jsonData["paging"] != null)
          ? Paging.fromJson(jsonData["paging"])
          : null,
    );

    debugPrint(
        "==== Response ${response.statusCode}: ${response.realUri} ====");
    debugPrint("${data.toJson()}");
    debugPrint("==========================================");

    return data;
  }
}
