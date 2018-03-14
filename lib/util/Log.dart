import 'package:flutter/material.dart';

class Log {
  static const bool isDebug = true;
  static const int traceCount = 1;
  static const int traceDepth = 2;

  static void d(String tag, String msg) {
    if (isDebug) {
      Iterable<String> lines = StackTrace.current.toString().trimRight().split(
          '\n');
      lines = lines.take(traceDepth).skip(traceDepth - traceCount);
      if (traceCount == 1) {
        debugPrint(
            FlutterError.defaultStackFilter(lines).toString().split('#1')[1]
                .trimLeft() + ': ' + tag + ': ' + msg);
      } else {
        debugPrint(
            tag + ': ' + msg + '\n' +
                FlutterError.defaultStackFilter(lines).join('\n'));
      }
    }
  }
}