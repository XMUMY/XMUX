import 'package:logger/logger.dart' as l;

import 'logger.dart';

final Logger log = _Logger();

class _Logger implements Logger {
  final loggerImpl = l.Logger();

  /// Log a message at trace level.
  @override
  void t(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      loggerImpl.t(message, time: time, error: error, stackTrace: stackTrace);

  /// Log a message at debug level.
  @override
  void d(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      loggerImpl.d(message, time: time, error: error, stackTrace: stackTrace);

  /// Log a message at info level.
  @override
  void i(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      loggerImpl.i(message, time: time, error: error, stackTrace: stackTrace);

  /// Log a message at warning level.
  @override
  void w(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      loggerImpl.w(message, time: time, error: error, stackTrace: stackTrace);

  /// Log a message at error level.
  @override
  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      loggerImpl.e(message, time: time, error: error, stackTrace: stackTrace);

  /// Log a message at fatal level.
  @override
  void f(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      loggerImpl.f(message, time: time, error: error, stackTrace: stackTrace);
}
