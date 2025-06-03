# Keep Dio classes
-keep class com.dio.** { *; }

# Keep Get_it classes
-keep class io.flutter.** { *; }

# Keep Easy Localization files (if needed)
-keep class io.flutter.plugins.easy_localization.** { *; }

# Keep other common libraries
-keep class com.squareup.okhttp3.** { *; }
-keep class retrofit2.** { *; }

# Flutter deferred components workaround
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**