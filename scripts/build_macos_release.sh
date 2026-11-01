#!/bin/bash
# Build only: never quits/replaces the user's installed App or publishes a release.
set -euo pipefail
cd "$(dirname "$0")/.."
[[ "$(uname -s)" == Darwin ]] || { echo 'Build on macOS.' >&2; exit 1; }
: "${REFUGE_CODE_SIGN_IDENTITY:?Set the exact Developer ID Application certificate SHA-1}"
[[ "$REFUGE_CODE_SIGN_IDENTITY" =~ ^[A-Fa-f0-9]{40}$ ]] || exit 1
flutter_bin="${REFUGE_FLUTTER:-flutter}"
identity="$REFUGE_CODE_SIGN_IDENTITY"
security find-identity -v -p codesigning | grep -F "$identity" | grep -F 'Developer ID Application:' >/dev/null
# Keep architecture/signing overrides out of the tracked Xcode project.
config="$(mktemp -t refuge-standalone)"
trap 'rm -f "$config"' EXIT
printf 'EXCLUDED_ARCHS = x86_64\nCODE_SIGNING_ALLOWED = NO\n' > "$config"
XCODE_XCCONFIG_FILE="$config" "$flutter_bin" build macos --release
swift build -c release --arch arm64 --package-path macos/Packages/RefugeAppUpdate
helper_dir="$(swift build -c release --arch arm64 --package-path macos/Packages/RefugeAppUpdate --show-bin-path)"
output="${REFUGE_MAC_OUTPUT:-build/desktop-dist/macos-$(date +%Y%m%d-%H%M%S)}"
[[ ! -e "$output" ]] || { echo 'Use a new output directory.' >&2; exit 1; }
mkdir -p "$output"
app="$output/星河避难所.app"
ditto 'build/macos/Build/Products/Release/星河避难所.app' "$app"
mkdir -p "$app/Contents/Helpers"
cp "$helper_dir/refuge_updater" "$app/Contents/Helpers/refuge_updater"
python3 - "$app" <<'PY'
import json,plistlib,sys
from pathlib import Path
app=Path(sys.argv[1]);p=app/'Contents/Info.plist'
info=plistlib.loads(p.read_bytes())
assert info['CFBundleIdentifier']=='vip.kirakira.Refuge-ios', 'Unexpected Release bundle identity'
info['RefugeStandalone']=True;p.write_bytes(plistlib.dumps(info))
meta={'product':'refuge_next','platform':'macos','architecture':'arm64','version':info['CFBundleShortVersionString'],'buildNumber':int(info['CFBundleVersion'])}
(app/'Contents/Resources/refuge-release.json').write_text(json.dumps(meta))
PY
# Explicitly sign every nested code object before the outer bundle.
while IFS= read -r -d '' code; do
  if file "$code" | grep -q 'Mach-O'; then
    arches="$(lipo -archs "$code")"
    if [[ "$arches" != arm64 ]]; then
      [[ " $arches " == *" arm64 "* ]] || { echo "Missing ARM64: $code" >&2; exit 1; }
      lipo "$code" -thin arm64 -output "$code.arm64"
      mv "$code.arm64" "$code"
      chmod +x "$code"
    fi
    codesign --force --timestamp --options runtime --sign "$identity" "$code"
  fi
done < <(find "$app/Contents" -type f -print0)
while IFS= read -r code; do
  codesign --force --timestamp --options runtime --sign "$identity" "$code"
done < <(find "$app/Contents" -depth -type d -name '*.framework')
codesign --force --timestamp --options runtime --entitlements macos/Runner/Standalone.entitlements --sign "$identity" "$app"
codesign --verify --deep --strict "$app"
if [[ -n "${REFUGE_NOTARY_PROFILE:-}" ]]; then
  ditto -c -k --sequesterRsrc --keepParent "$app" "$output/notary.zip"
  xcrun notarytool submit "$output/notary.zip" --keychain-profile "$REFUGE_NOTARY_PROFILE" --wait
  xcrun stapler staple "$app"
  rm "$output/notary.zip"
fi
version="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$app/Contents/Info.plist")"
code="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' "$app/Contents/Info.plist")"
# No __MACOSX sidecar entries: updater accepts exactly one App root.
python3 scripts/package_macos_app.py "$app" "$output/refuge-$version-$code-macos-arm64.zip"
printf 'Built: %s\n' "$output/refuge-$version-$code-macos-arm64.zip"
