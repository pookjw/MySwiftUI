#warning("TODO")
internal import MySwiftUICore

struct InteractiveDismissAttemptKey: HostPreferenceKey {
    static var defaultValue: (() -> Void)? {
        return nil
    }
}
