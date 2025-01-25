#!/usr/bin/env bash

TARGETS=(
#   "ios-arm64"
#   "ios-arm64-arm64e"
  "ios-arm64-x86_64-simulator"
#   "macos-arm64e-arm64-x86_64"
#   "tvos-arm64_arm64e"
#   "tvos-arm64_x86_64-simulator"
#   "watchos-arm64_arm64_32_arm64e_armv7k"
#   "watchos-arm64_i386_x86_64-simulator"
#   "xros-arm64_arm64e"
#   "xros-arm64_x86_64-simulator"
)

if [[ ! -f "Info.plist" ]]; then
    echo "No Info.plist"
    exit 1;
fi;

if [[ -d "AttributeGraph.xcframework" ]]; then
    rm -rf "AttributeGraph.xcframework"
fi;

mkdir "AttributeGraph.xcframework"

for TARGET in "${TARGETS[@]}"; do
    if [[ ! -d "AttributeGraph.xcframework/${TARGET}" ]]; then
        rm -rf "AttributeGraph.xcframework/${TARGET}"
        mkdir "AttributeGraph.xcframework/${TARGET}"
    fi;
done

cp -f "Info.plist" "AttributeGraph.xcframework/Info.plist"