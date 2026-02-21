// F840B77C606916DB63BC34AAC88EE4F6
internal import MySwiftUICore

protocol SafeAreaTransitionState: AnyObject {
    var isActive: Bool { get }
}

extension EnvironmentValues {
    @inline(__always)
    var safeAreaTransitionState: (any SafeAreaTransitionState)? {
        get {
            return self[SafeAreaTransitionStateKey.self].base
        }
        set {
            self[SafeAreaTransitionStateKey.self] = SafeAreaTransitionStateKey.Value(base: newValue)
        }
    }
}

fileprivate struct SafeAreaTransitionStateKey: EnvironmentKey {
    @safe static nonisolated(unsafe) let defaultValue = Value(base: nil)
    
    fileprivate struct Value {
        weak var base: (any SafeAreaTransitionState)?
    }
}
