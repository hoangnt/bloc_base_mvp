import 'dart:async';

import 'package:monki_bloc/common/constant/status_code.dart';
import 'package:monki_bloc/common/network/model/base_response.dart';

mixin BaseResponseHandleMixin {
  Future<void> handleBaseResponse<T>({
    required Future<BaseResponse<T>> api,
    String? loadingText,
    FutureOr<void> Function(T)? onSuccess,
    void Function(String)? onError,
  }) async {
    // TODO: loading display here

    final res = await api;

    if (res.statusCode != StatusCode.success && onError != null) {
      onError(res.message ?? "Something went wrong !");
      // TODO: loading dismiss here
      return;
    }

    if (onSuccess != null) {
      await onSuccess(res.data as T);
    }

    // TODO: loading dismiss here
  }
}
