@_spi(Internal) internal import MySwiftUICore

extension GraphHost {
    @inline(always)
    var extendedLaunchTestName: String? {
        return self.preferenceValue(ExtendedLaunchTestNameKey.self)
    }
}

fileprivate struct ExtendedLaunchTestNameKey : HostPreferenceKey {
    static var defaultValue: String? {
        return nil
    }
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        assertUnimplemented()
    }
}
