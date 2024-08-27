import 'dart:async';
import 'package:flutter/services.dart';


class FlutterNativeTimezone {
  static const MethodChannel _channel = MethodChannel('flutter_native_timezone');
  static Future<String> getLocalTimezone() async {
    final String? localTimezone = await _channel.invokeMethod("getLocalTimezone");
    print(localTimezone);
    if (localTimezone == null) {
      throw ArgumentError("Invalid return from platform getLocalTimezone()");
    }
    return localTimezone;
  }

  static Future<List<String>> getAvailableTimezones() async {
    final List<String>? availableTimezones =
    await _channel.invokeListMethod<String>("getAvailableTimezones");
    if (availableTimezones == null) {
      throw ArgumentError(
          "Invalid return from platform getAvailableTimezones()");
    }
    return availableTimezones;
  }
}