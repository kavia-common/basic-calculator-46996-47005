# CI/Docker Build Notes (Performance-Oriented)

This project has been tuned to reduce build/analyze time in CI and Docker.

Key points:
- Run dependency resolution before builds:
  - flutter pub get
- Skip analyzer-heavy paths (configured in analysis_options.yaml):
  - Excludes .dart_tool, build, platform builds (android/**/build, etc.), and generated files (*.g.dart).
- Tests:
  - No tests are auto-run by default during flutter build. If your CI runs `flutter test`, consider skipping unit tests to save time, or run only a smoke test.
  - Example to skip tests in CI: Only call `flutter build <platform>` without `flutter test`.
- SDK version pinning:
  - Dart SDK: ">=3.7.0 <4.0.0"
  - Flutter SDK: ">=3.29.0 <4.0.0"
  - This aligns with pubspec.lock to shorten resolution time.
- Android/Gradle tips:
  - Gradle caching is enabled (android/gradle.properties).
  - Daemon is off for reproducibility in ephemeral CI runners; enable if your CI benefits from it.

Recommended CI steps:
1) flutter --version
2) flutter pub get
3) flutter analyze --no-fatal-infos --no-fatal-warnings
4) flutter build apk --release (or appropriate target)
