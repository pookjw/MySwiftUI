@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct CollisionGroup : OptionSet {
    public let rawValue: UInt32
    
    @safe public static let `default`: CollisionGroup = {
        assertUnimplemented()
    }()
    
    @available(iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
    @safe public static let sceneUnderstanding: CollisionGroup = {
        assertUnimplemented()
    }()
    
    @safe public static let all: CollisionGroup = {
        assertUnimplemented()
    }()
    
    public init(rawValue: UInt32) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias ArrayLiteralElement = CollisionGroup
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias Element = CollisionGroup
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias RawValue = UInt32
}
