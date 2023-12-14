import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_proxy_native/flutter_proxy_native.dart';
import 'package:flutter_proxy_native/flutter_proxy_native_platform_interface.dart';
import 'package:flutter_proxy_native/flutter_proxy_native_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterProxyNativePlatform
    with MockPlatformInterfaceMixin
    implements FlutterProxyNativePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterProxyNativePlatform initialPlatform = FlutterProxyNativePlatform.instance;

  test('$MethodChannelFlutterProxyNative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterProxyNative>());
  });

  test('getPlatformVersion', () async {
    FlutterProxyNative flutterProxyNativePlugin = FlutterProxyNative();
    MockFlutterProxyNativePlatform fakePlatform = MockFlutterProxyNativePlatform();
    FlutterProxyNativePlatform.instance = fakePlatform;

    expect(await flutterProxyNativePlugin.getPlatformVersion(), '42');
  });
}
