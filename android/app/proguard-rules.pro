# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# Keep Gson / JSON serialization
-keepattributes Signature
-keepattributes *Annotation*

# OkHttp / Dio
-dontwarn okhttp3.**
-dontwarn okio.**

# SQLite
-keep class io.requery.android.database.** { *; }

# Syncfusion
-keep class com.syncfusion.** { *; }