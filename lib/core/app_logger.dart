import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _log('DEBUG', message, error, stackTrace);
    }
  }

  static void info(String message) {
    _log('INFO', message);
  }

  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _log('WARNING', message, error, stackTrace);
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log('ERROR', message, error, stackTrace);
  }

  static void _log(
    String level,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final logMessage = '[$level] ${DateTime.now()}: $message';
    debugPrint(logMessage);
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('Stacktrace: $stackTrace');
    }
  }
}
