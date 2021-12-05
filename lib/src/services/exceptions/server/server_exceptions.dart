import 'package:flutter/cupertino.dart';

/// Для преобразования ошибок сервера в ошибки приложенния,
/// необходимо создать соответсвующие классы,
/// расширяющие класс [Exception]
/// с названиями, соответсвующими конкретной ошибке.

/// Серверная ошибка по-умолчанию
class ServerErrorException implements Exception {
  final int? code;
  final String? message;  
  const ServerErrorException(this.code, this.message);
  printError(){
    print('[${code}] => PATH: ${message}');
  }
  
}

class NotFoundException implements Exception {
  final int? code;
  final String? message;    
  
   void printerror(){
    return debugPrint('[${code}] => PATH: Наконец-то 404!!!!');
   }
    
  const NotFoundException(this.code, this.message);
}

class BadRequestException implements Exception {
   final int? code;
  final String? message;  
  const BadRequestException(this.code, this.message);
}

class UnauthorizedException implements Exception {
   final int? code;
  final String? message;  
  const UnauthorizedException(this.code, this.message);

  //TODO необходимо перезапросить токен
  void printerror(){
    return debugPrint('[${code}] => PATH: ${message}');
  }
}
