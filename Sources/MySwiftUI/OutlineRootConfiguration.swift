@_spi(Internal) internal import MySwiftUICore

struct OutlineRootConfiguration {
    private var isRoot: Bool
    private var isExpanded: Bool
}

extension OutlineRootConfiguration {
    struct Key : HostPreferenceKey {
        static var defaultValue: OutlineRootConfiguration {
            assertUnimplemented()
        }
        
        static func reduce(value: inout OutlineRootConfiguration, nextValue: () -> OutlineRootConfiguration) {
            assertUnimplemented()
        }
    }
}
