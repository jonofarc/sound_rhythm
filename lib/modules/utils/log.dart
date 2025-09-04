import 'package:logger/logger.dart';

class Log {
  static Logger logger = Logger();

  static void verbose(String message) {
    logger.t(message);
  }

  static void debug(String message) {
    logger.d(message);
  }

  static void info(String message) {
    logger.i(message);
  }

  static void warning(String message) {
    logger.w(message);
  }

  static void error(String message) {
    logger.e(message);
  }

  static void failure(String message) {
    logger.f(message);
  }
}
