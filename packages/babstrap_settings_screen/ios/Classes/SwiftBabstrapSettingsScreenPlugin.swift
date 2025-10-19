import Flutter
import UIKit

public class SwiftBabstrapSettingsScreenPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "babstrap_settings_screen", binaryMessenger: registrar.messenger())
    let instance = SwiftBabstrapSettingsScreenPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
