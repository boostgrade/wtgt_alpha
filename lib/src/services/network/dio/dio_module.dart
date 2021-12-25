import 'package:dio/dio.dart';
import 'package:where_to_go_today/src/services/urls.dart';
import 'project_interceptor.dart';

/// Класс-модуль для конфигурации dio
class DioModule {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: baseUrl,
    )
    ..interceptors.addAll(
      [
        LogInterceptor(),
        ErrorInterceptor(),
      ],
    );
}
