import 'package:rxdart/rxdart.dart';
import 'package:where_to_go_today/src/ui/errors_handling/error_handler.dart';

/// Базовый класс для всех делегатов презентационной логики
class ViewModel {
  /// Обработчик ошибок, поставляется через конструктор.
  final ErrorHandler errorHandler;

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  ViewModel(this.errorHandler);

  /// Подписывает на изменения стрима некоторую функцию.
  /// Основный метод для отслеживания измнений внешних сервисов.
  /// Опционально можно установить колбек на ошибки.
  ///
  /// Function? - так как onError у Stream, может быть как `void Function(Object error)` так и
  /// `void Function(Object error, StackTrace)`
  void observe<T>(
    Stream<T> stream,
    void Function(T) onEvent, {
    Function? onError,
  }) {
    _compositeSubscription.add(
      stream.doOnError(
        (e, stacktrace) {
          errorHandler.handle(e);
        },
      ).listen(
        onEvent,
        onError: onError,
      ),
    );
  }

  /// Освобождает все подписки
  void dispose() {
    _compositeSubscription.dispose();
  }
}
