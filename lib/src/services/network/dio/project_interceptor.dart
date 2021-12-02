import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:where_to_go_today/src/services/exceptions/server/server_exceptions.dart';

class ProjectInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {    
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {   
      if(err.response?.statusCode == 400){
        throw BadRequestException();
      }

      if(err.response?.statusCode == 401){
        throw UnauthorizedException();
      }
    
     debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    return super.onError(err, handler);
  }
}