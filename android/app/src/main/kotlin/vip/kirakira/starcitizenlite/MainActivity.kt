package vip.kirakira.starcitizenlite

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "vip.kirakira.refuge_next/get_uuid"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
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
