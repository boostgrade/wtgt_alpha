import 'server_exceptions.dart';

/// Сущность, которая преобразует ошибки сервера в ошибки приложенния
/// для дальнейшей обработки.
class ServerErrorMapper {
  /// Для обработки остальных серверных ошибок
  /// необходимо задать новые целочисленные константы, соотвтетсвующие кодам.
  static const int _notFound = 404;
  static const int _badRequest = 400;
  static const int _unauthorized = 401;
  
  static Exception fromStatusCode(int statusCode) {
    /// Для обработки остальных серверных ошибок
    /// нужно написать дополнительные блоки в условном выражении,
    /// предварительно создав классы исключений.
    if (statusCode == _notFound) {
      return NotFoundException();
    }
    if (statusCode == _badRequest) {
      return BadRequestException();
    }
    if (statusCode == _unauthorized) {
      return UnauthorizedException();
    }

    /// Возвращается по-умолчанию для остальных ошибок
    return ServerErrorException();
  }
}
