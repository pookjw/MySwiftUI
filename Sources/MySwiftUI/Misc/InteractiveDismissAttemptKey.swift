internal import MySwiftUICore

struct InteractiveDismissAttemptKey: HostPreferenceKey {
    static var defaultValue: (() -> Void)? {
        return nil
    }
    
    static func reduce(value: inout (() -> Void)?, nextValue: () -> (() -> Void)?) {
        fatalError("TODO")
    }
}
