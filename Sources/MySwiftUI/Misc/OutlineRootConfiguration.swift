#warning("TODO")
internal import MySwiftUICore

struct OutlineRootConfiguration {
    private var isRoot: Bool
    private var isExpanded: Bool
}

extension OutlineRootConfiguration {
    struct Key: HostPreferenceKey {
        typealias Value = Never? // TODO
    }
}
