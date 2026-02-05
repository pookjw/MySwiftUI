struct PPTFeature {
    @safe static nonisolated(unsafe) var isEnabled: Bool = isAppleInternalBuild()
    // TODO
}
