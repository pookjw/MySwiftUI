@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct AnimationFillMode : OptionSet, Sendable {
    public let rawValue: Int8
    
    public static let none: AnimationFillMode = {
        assertUnimplemented()
    }()
    
    public static let forwards: AnimationFillMode = {
        assertUnimplemented()
    }()
    
    public static let backwards: AnimationFillMode = {
        assertUnimplemented()
    }()
    
    public static let both: AnimationFillMode = {
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
