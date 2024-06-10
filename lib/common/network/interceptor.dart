import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({"Authorization": 'Bearer token_put_in_here'});
    super.onRequest(options, handler);
  }
}
