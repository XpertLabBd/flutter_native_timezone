import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_native_timezone_method_channel.dart';

abstract class FlutterNativeTimezonePlatform extends PlatformInterface {
  /// Constructs a FlutterNativeTimezonePlatform.
  FlutterNativeTimezonePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNativeTimezonePlatform _instance = MethodChannelFlutterNativeTimezone();

  /// The default instance of [FlutterNativeTimezonePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNativeTimezone].
  static FlutterNativeTimezonePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNativeTimezonePlatform] when
  /// they register themselves.
  static set instance(FlutterNativeTimezonePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
