import Flutter
import UIKit
import WebKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "RsiCookieBridge") else { return }
    let bridge = RsiCookieBridge()
    let channel = FlutterMethodChannel(name: "vip.kirakira.refuge_next/rsi_cookies",
                                      binaryMessenger: registrar.messenger())
    channel.setMethodCallHandler { call, result in bridge.handle(call, result: result) }
  }
}

private final class RsiCookieBridge {
  private let store = WKWebsiteDataStore.default().httpCookieStore

  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "clear" {
      store.getAllCookies { cookies in
        let group = DispatchGroup()
        for cookie in cookies {
          group.enter()
          self.store.delete(cookie) { group.leave() }
        }
        group.notify(queue: .main) { result(nil) }
      }
      return
    }
    guard let args = call.arguments as? [String: Any],
          let rawURL = args["url"] as? String,
          let url = URL(string: rawURL), url.scheme == "https",
          url.host == "robertsspaceindustries.com" else {
      result(FlutterError(code: "invalid_url", message: "Unsupported cookie origin", details: nil))
      return
    }
    switch call.method {
    case "read":
      store.getAllCookies { cookies in
        let requestPath = url.path.isEmpty ? "/" : url.path
        let valid = cookies.filter { cookie in
          let domain = cookie.domain.hasPrefix(".") ? String(cookie.domain.dropFirst()) : cookie.domain
          let path = cookie.path
          let matchesPath = requestPath == path ||
            (requestPath.hasPrefix(path) && (path.hasSuffix("/") || requestPath.dropFirst(path.count).hasPrefix("/")))
          return domain == url.host && matchesPath &&
            (cookie.expiresDate == nil || cookie.expiresDate! > Date())
        }.sorted { $0.path.count > $1.path.count }
        result(valid.map { "\($0.name)=\($0.value)" }.joined(separator: "; "))
      }
    case "write":
      let rawCookies = args["cookies"] as? [String] ?? []
      var cookies: [HTTPCookie] = []
      for raw in rawCookies {
        let parsed = HTTPCookie.cookies(withResponseHeaderFields: ["Set-Cookie": raw], for: url)
        guard !parsed.isEmpty else {
          result(FlutterError(code: "cookie_write_failed", message: "Cookie write failed", details: nil))
          return
        }
        cookies.append(contentsOf: parsed)
      }
      func writeNext(_ index: Int) {
        if index == cookies.count { result(nil); return }
        self.store.setCookie(cookies[index]) { writeNext(index + 1) }
      }
      writeNext(0)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
