@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct BindableValue<T> where T : BindableData {
    public init(_ value: T, animatedValue: T? = nil) {
        assertUnimplemented()
    }
    
    public var value: T {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var baseValue: T
    
    public var animatedValue: T?
}
