# flutter_proxy_native

一个 Flutter 插件，用于自动获取系统的代理（Proxy）设置，并方便地应用于 Dio 网络请求库。

## 功能

- **自动检测系统代理**: 自动获取 iOS 、 Android 或 MacOS 设备上的系统代理配置。
- **Dio 集成**: 简化 Dio 网络请求库的代理设置流程。

## 安装

要开始使用 `flutter_proxy_native`，请将以下依赖添加到你的 `pubspec.yaml` 文件中：

```yaml
dependencies:
  flutter_proxy_native: ^最新版本
```

然后运行以下命令来安装依赖：

```bash
flutter pub get
```

## 使用方法

在你的 Dart 代码中，首先导入插件：

```dart
import 'package:flutter_proxy_native/flutter_proxy_native.dart';
```

然后，使用 `flutter_proxy_native` 获取系统代理，并设置给 Dio：

```dart
var proxy = await FlutterProxyNative.getSystemProxy();
Dio dio = Dio();
dio.options = dio.options.copyWith(
  httpClientAdapter: ProxyHttpClientAdapter(proxy: proxy),
);
```

## 示例

查看 `example` 文件夹获取更多关于如何在你的项目中使用 `flutter_proxy_native` 的示例。

## 贡献

如果你想为 `flutter_proxy_native` 贡献代码，请阅读 `CONTRIBUTING.md` 文件了解如何开始。

## 许可证

本插件遵循 MIT 许可证。详情请查看 `LICENSE` 文件。
