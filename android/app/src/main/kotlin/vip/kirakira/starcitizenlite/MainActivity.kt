package vip.kirakira.starcitizenlite

import android.webkit.CookieManager
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "vip.kirakira.refuge_next/get_uuid"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
            "vip.kirakira.refuge_next/rsi_cookies").setMethodCallHandler { call, result ->
            val manager = CookieManager.getInstance()
            if (call.method == "clear") {
                manager.removeAllCookies { result.success(null) }
                return@setMethodCallHandler
            }
            val url = call.argument<String>("url") ?: ""
            val uri = Uri.parse(url)
            if (uri.scheme != "https" || uri.host != "robertsspaceindustries.com") {
                result.error("invalid_url", "Unsupported cookie origin", null)
                return@setMethodCallHandler
            }
            when (call.method) {
                "read" -> result.success(manager.getCookie(url) ?: "")
                "write" -> {
                    val cookies = call.argument<List<String>>("cookies") ?: emptyList()
                    fun writeNext(index: Int) {
                        if (index == cookies.size) {
                            result.success(null)
                            return
                        }
                        manager.setCookie(url, cookies[index]) { accepted ->
                            if (accepted) writeNext(index + 1)
                            else result.error("cookie_write_failed", "Cookie write failed", null)
                        }
                    }
                    writeNext(0)
                }
                else -> result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getValue") {
//                val key = call.argument<String>("key")
                val value = getUUID()
                result.success(value)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getUUID(): String? {
        val sharedPreferences = applicationContext.getSharedPreferences("vip.kirakira.starcitizenlite.kirakira", MODE_PRIVATE);
        return sharedPreferences.getString("unique_id", null)
    }
}
