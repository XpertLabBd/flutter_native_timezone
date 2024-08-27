import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_native_timezone/flutter_native_timezone_platform_interface.dart';
import 'package:flutter_native_timezone/flutter_native_timezone_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNativeTimezonePlatform
    with MockPlatformInterfaceMixin
    implements FlutterNativeTimezonePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterNativeTimezonePlatform initialPlatform = FlutterNativeTimezonePlatform.instance;

  test('$MethodChannelFlutterNativeTimezone is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNativeTimezone>());
  });

  test('getPlatformVersion', () async {
    MockFlutterNativeTimezonePlatform fakePlatform = MockFlutterNativeTimezonePlatform();
    FlutterNativeTimezonePlatform.instance = fakePlatform;
    expect(await FlutterNativeTimezone.getLocalTimezone(), '42');
  });
}
