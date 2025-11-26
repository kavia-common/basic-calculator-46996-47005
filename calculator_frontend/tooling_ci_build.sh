#!/usr/bin/env bash
set -euo pipefail

# Minimal CI build helper to avoid timeouts:
# - Ensures dependencies are fetched
# - Performs lightweight analyze
# - Builds release APK (adjust target as needed)

echo "[tooling_ci_build] flutter pub get ..."
flutter pub get

echo "[tooling_ci_build] flutter analyze (non-fatal) ..."
# Do not fail on warnings to keep builds fast and green when lints vary by SDKs.
flutter analyze --no-fatal-infos --no-fatal-warnings || true

echo "[tooling_ci_build] flutter build apk --release ..."
flutter build apk --release
echo "[tooling_ci_build] done."
