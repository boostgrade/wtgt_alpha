import 'package:flutter/material.dart';
import 'message_controller.dart';
import 'types/message_type.dart';

/// Эта сущность отвечает только за показ сообщений.
/// Для этого ей в конструкторое передается [BuildContext],
/// чтобы получить из этого контекста [ScaffoldMessenger].
class DefaultMessageController implements MessageController {
  DefaultMessageController(BuildContext context) : _context = context;

  final BuildContext _context;

  @override
  void show(MessageType messageType) {
    ScaffoldMessenger.of(_context)
        .showSnackBar(messageType.create() as SnackBar);
  }
}
