import 'package:dio/dio.dart';
import 'package:where_to_go_today/src/services/exceptions/server/server_error_mapper.dart';

/// Обрабатывает HTTP код и приводит его к Exception либо передает управление следующему Interceptor
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) { 
    throw ServerErrorMapper.fromStatusCode(err);
  }
}