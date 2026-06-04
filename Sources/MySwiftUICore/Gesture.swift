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
