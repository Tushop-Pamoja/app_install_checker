import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_install_checker_method_channel.dart';

abstract class AppInstallCheckerPlatform extends PlatformInterface {
  /// Constructs a AppInstallCheckerPlatform.
  AppInstallCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppInstallCheckerPlatform _instance = MethodChannelAppInstallChecker();

  /// The default instance of [AppInstallCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppInstallChecker].
  static AppInstallCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppInstallCheckerPlatform] when
  /// they register themselves.
  static set instance(AppInstallCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
