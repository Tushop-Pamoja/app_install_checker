import Flutter
import UIKit

public class AppInstallCheckerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_install_checker", binaryMessenger: registrar.messenger())
        let instance = AppInstallCheckerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "checkInstallAndLaunch" {
            let userDefaults = UserDefaults.standard
            let firstInstallKey = "first_install"
            let firstLaunchKey = "first_launch"

            let isFirstInstall = !userDefaults.bool(forKey: firstInstallKey)
            let isFirstLaunch = !userDefaults.bool(forKey: firstLaunchKey)

            if isFirstInstall {
                userDefaults.set(true, forKey: firstInstallKey)
            }

            if isFirstLaunch {
                userDefaults.set(true, forKey: firstLaunchKey)
            }

            userDefaults.synchronize()

            result([isFirstInstall, isFirstLaunch])
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}