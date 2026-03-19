internal import MySwiftUICore

struct PPTFeature: ViewGraphFeature {
    @safe static nonisolated(unsafe) var isEnabled: Bool = isAppleInternalBuild()
    // TODO
}
