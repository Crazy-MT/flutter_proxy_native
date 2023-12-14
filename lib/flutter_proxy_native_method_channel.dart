import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_proxy_native_platform_interface.dart';

/// An implementation of [FlutterProxyNativePlatform] that uses method channels.
class MethodChannelFlutterProxyNative extends FlutterProxyNativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_proxy_native');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getSystemProxy() async {
    final version = await methodChannel.invokeMethod<String>('getSystemProxy');
    return version;
  }
}
