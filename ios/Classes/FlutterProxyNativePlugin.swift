import Flutter
import UIKit

public class FlutterProxyNativePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_proxy_native", binaryMessenger: registrar.messenger())
    let instance = FlutterProxyNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getSystemProxy":
          result(getSystemProxy())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  func getSystemProxy() -> String? {
              if let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
                 let url = URL(string: "http://www.baidu.com"),
                 let proxies = CFNetworkCopyProxiesForURL(url as CFURL, settings as CFDictionary).takeRetainedValue() as? [[String: Any]],
                 let proxy = proxies.first {
                  if let host = proxy[kCFProxyHostNameKey as String] as? String,
                     let portNumber = proxy[kCFProxyPortNumberKey as String] as? Int {
                      let port = String(portNumber)
                      print("Host: \(host), Port: \(port)")
                      return "\(host):\(port)"
                  }
              }
              return nil
          }

}
