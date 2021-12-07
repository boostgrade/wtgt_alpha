import 'server_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:where_to_go_today/src/services/models/server_error_response.dart';

/// Сущность, которая преобразует ошибки сервера в ошибки приложенния
/// для дальнейшей обработки.
class ServerErrorMapper {
  /// Для обработки остальных серверных ошибок
  /// необходимо задать новые целочисленные константы, соотвтетсвующие кодам.
  static const int _notFound = 404;
  static const int _badRequest = 400;
  static const int _unauthorized = 401;

  static Exception fromStatusCode(DioError err) {
    /// Для обработки остальных серверных ошибок
    /// нужно написать дополнительные блоки в условном выражении,
    /// предварительно создав классы исключений.
    if (err.response?.statusCode == _notFound) {

      return NotFoundException(err.response?.statusCode, err.response?.statusMessage);
    }
    if (err.response?.statusCode == _badRequest) {
      final  dataerr = ServerErrorResponse.fromJson(err.response?.data);

      return BadRequestException(dataerr.code, dataerr.message);
    }
    if (err.response?.statusCode == _unauthorized) {

      return UnauthorizedException(err.response?.statusCode, err.response?.statusMessage);
    }

    /// Возвращается по-умолчанию для остальных ошибок
    return ServerErrorException(err.response?.statusCode, err.response?.statusMessage);
  }
}
