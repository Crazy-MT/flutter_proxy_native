import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_proxy_native_method_channel.dart';

abstract class FlutterProxyNativePlatform extends PlatformInterface {
  /// Constructs a FlutterProxyNativePlatform.
  FlutterProxyNativePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterProxyNativePlatform _instance = MethodChannelFlutterProxyNative();

  /// The default instance of [FlutterProxyNativePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterProxyNative].
  static FlutterProxyNativePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterProxyNativePlatform] when
  /// they register themselves.
  static set instance(FlutterProxyNativePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getSystemProxy() {
    throw UnimplementedError('systemProxy() has not been implemented.');
  }
}
