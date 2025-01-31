import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_install_checker_platform_interface.dart';

/// An implementation of [AppInstallCheckerPlatform] that uses method channels.
class MethodChannelAppInstallChecker extends AppInstallCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_install_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
