package vip.kirakira.starcitizenlite

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugin.common.MethodChannel
import java.io.File

class UpdateFileProvider : FileProvider()

class AppUpdateBridge(private val activity: FlutterFragmentActivity) {
    private val directory: File
        get() = File(activity.filesDir, "app_updates").apply {
            if (!exists() && !mkdirs()) throw IllegalStateException("Update storage unavailable")
        }

    private fun apkPath(call: io.flutter.plugin.common.MethodCall): File {
        val file = File(requireNotNull(call.argument<String>("path"))).canonicalFile
        require(file.parentFile == directory.canonicalFile &&
            file.name.matches(Regex("refuge-[0-9]+\\.apk")) && file.isFile) {
            "Invalid update file"
        }
        return file
    }

    @Suppress("DEPRECATION")
    fun handle(call: io.flutter.plugin.common.MethodCall, result: MethodChannel.Result) {
        try {
            when (call.method) {
                "directory" -> result.success(directory.absolutePath)
                "canInstall" -> result.success(Build.VERSION.SDK_INT < 26 ||
                    activity.packageManager.canRequestPackageInstalls())
                "openPermissionSettings" -> {
                    if (Build.VERSION.SDK_INT >= 26) {
                        activity.startActivity(Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,
                            Uri.parse("package:${activity.packageName}")))
                    }
                    result.success(null)
                }
                "inspect" -> {
                    val file = apkPath(call)
                    val info = activity.packageManager.getPackageArchiveInfo(file.path, 0)
                        ?: throw IllegalArgumentException("Invalid APK archive")
                    val code = if (Build.VERSION.SDK_INT >= 28) info.longVersionCode else info.versionCode.toLong()
                    result.success(mapOf("packageName" to info.packageName, "versionCode" to code))
                }
                "install" -> {
                    val file = apkPath(call)
                    val info = activity.packageManager.getPackageArchiveInfo(file.path, 0)
                        ?: throw IllegalArgumentException("Invalid APK archive")
                    require(info.packageName == activity.packageName) { "Package mismatch" }
                    val uri = FileProvider.getUriForFile(activity,
                        "${activity.packageName}.app_update_provider", file)
                    activity.startActivity(Intent(Intent.ACTION_VIEW).apply {
                        setDataAndType(uri, "application/vnd.android.package-archive")
                        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    })
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        } catch (error: Exception) {
            result.error("update_${call.method}_failed", error.javaClass.simpleName, null)
        }
    }
}
