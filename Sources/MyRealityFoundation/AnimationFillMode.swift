@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct AnimationFillMode : OptionSet {
    public let rawValue: Int8
    
    @safe public static nonisolated(unsafe) let none: AnimationFillMode = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let forwards: AnimationFillMode = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let backwards: AnimationFillMode = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let both: AnimationFillMode = {
        assertUnimplemented()
    }()
    
    public init(rawValue: Int8) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias ArrayLiteralElement = AnimationFillMode
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias Element = AnimationFillMode
    
    @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
    public typealias RawValue = Int8
}
