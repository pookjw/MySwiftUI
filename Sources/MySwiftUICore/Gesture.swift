@preconcurrency @MainActor public protocol Gesture<Value> {
    associatedtype Value
    // TODO
}

extension Never : Gesture {
    public typealias Value = Never
}

package protocol PrimitiveGesture {
    // TODO
}

extension PrimitiveGesture {
    typealias Value = Never
}

package struct __MSUI_UnimplementedGesture<T> : Gesture<T> {
    package init() {
        assertUnimplemented()
    }
}
