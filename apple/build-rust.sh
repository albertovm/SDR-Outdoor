#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
CORE="$ROOT/core"
TARGET_DIR="${CARGO_TARGET_DIR:-$CORE/target}"
OUT="$ROOT/apple/Frameworks"
CARGO="${CARGO:-$HOME/.cargo/bin/cargo}"

cd "$CORE"
export IPHONEOS_DEPLOYMENT_TARGET="${IPHONEOS_DEPLOYMENT_TARGET:-18.0}"
export CFLAGS_aarch64_apple_ios="${CFLAGS_aarch64_apple_ios:--miphoneos-version-min=$IPHONEOS_DEPLOYMENT_TARGET}"
export CXXFLAGS_aarch64_apple_ios="${CXXFLAGS_aarch64_apple_ios:--miphoneos-version-min=$IPHONEOS_DEPLOYMENT_TARGET}"
export CFLAGS_aarch64_apple_ios_sim="${CFLAGS_aarch64_apple_ios_sim:--mios-simulator-version-min=$IPHONEOS_DEPLOYMENT_TARGET}"
export CXXFLAGS_aarch64_apple_ios_sim="${CXXFLAGS_aarch64_apple_ios_sim:--mios-simulator-version-min=$IPHONEOS_DEPLOYMENT_TARGET}"
"$CARGO" build --release --locked -p sh-apple --target aarch64-apple-ios
"$CARGO" build --release --locked -p sh-apple --target aarch64-apple-ios-sim

mkdir -p "$OUT"
rm -rf "$OUT/SDROutdoorCore.xcframework"
xcodebuild -create-xcframework \
  -library "$TARGET_DIR/aarch64-apple-ios/release/libsdr_outdoor_apple.a" \
  -headers "$CORE/crates/sh-apple/include" \
  -library "$TARGET_DIR/aarch64-apple-ios-sim/release/libsdr_outdoor_apple.a" \
  -headers "$CORE/crates/sh-apple/include" \
  -output "$OUT/SDROutdoorCore.xcframework"

echo "Created $OUT/SDROutdoorCore.xcframework"
