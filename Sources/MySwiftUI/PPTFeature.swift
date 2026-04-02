internal import MySwiftUICore

struct PPTFeature : ViewGraphFeature {
    @safe nonisolated(unsafe) static var isEnabled: Bool = isAppleInternalBuild()
    // TODO
}
