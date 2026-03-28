package struct ContentCaptureProtectionPreferenceKey: HostPreferenceKey {
    package static var defaultValue: Bool {
        return false
    }
    
    package static func reduce(value: inout Bool, nextValue: () -> Bool) {
        assertUnimplemented()
    }
}
