import 'package:flutter_test/flutter_test.dart';
import 'package:app_install_checker/app_install_checker.dart';
import 'package:app_install_checker/app_install_checker_platform_interface.dart';
import 'package:app_install_checker/app_install_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppInstallCheckerPlatform
    with MockPlatformInterfaceMixin
    implements AppInstallCheckerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppInstallCheckerPlatform initialPlatform =
      AppInstallCheckerPlatform.instance;
}
