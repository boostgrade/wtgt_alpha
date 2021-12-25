import 'package:flutter/cupertino.dart';

/// Для преобразования ошибок сервера в ошибки приложенния,
/// необходимо создать соответсвующие классы,
/// расширяющие класс [Exception]
/// с названиями, соответсвующими конкретной ошибке.

/// Серверная ошибка по-умолчанию
class ServerErrorException implements Exception {
  final int? code;
  final String? message;
  ServerErrorException(this.code, this.message);
}

/// Ошибка 404
class NotFoundException implements Exception {
  final int? code;
  final String? message;
  NotFoundException(this.code, this.message) {
    debugPrint('[$code] => PATH: Наконец-то 404!!!!');
  }
}

/// Ошибка 400
class BadRequestException implements Exception {
  final int? code;
  final String? message;
  const BadRequestException(this.code, this.message);
}

/// Ошибка 401
class UnauthorizedException implements Exception {
  final int? code;
  final String? message;
  UnauthorizedException(this.code, this.message) {
    //TODO необходимо перезапросить токен

    debugPrint('[$code] => PATH: $message');
  }
}
