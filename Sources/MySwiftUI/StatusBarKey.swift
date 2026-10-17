@_spi(Internal) internal import MySwiftUICore

struct StatusBarKey : HostPreferenceKey {
    typealias Value = StatusBar?
    
    static func reduce(value: inout StatusBar?, nextValue: () -> StatusBar?) {
        assertUnimplemented()
    }

    struct StatusBar : Equatable {
        private(set) var isHidden: Bool
        private(set) var isAnimated: Bool
    }
}
