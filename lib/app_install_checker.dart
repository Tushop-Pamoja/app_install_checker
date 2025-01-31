import 'dart:async';
import 'package:flutter/services.dart';

class AppInstallResult {
  bool isFirstInstall;
  bool isFirstLaunch;

  AppInstallResult({
    required this.isFirstInstall,
    required this.isFirstLaunch,
  });
}

class AppInstallChecker {
  static const MethodChannel _channel = MethodChannel('app_install_checker');

  /// Checks if this is the first installation and the first launch.
  /// Returns a map with `isFirstInstall` and `isFirstLaunch` flags.
  static Future<AppInstallResult> checkInstallAndLaunch() async {
    final List<dynamic>? result =
        await _channel.invokeMethod<List<dynamic>>('checkInstallAndLaunch');

    return AppInstallResult(
      isFirstInstall: result?[0],
      isFirstLaunch: result?[1],
    );
  }
}
