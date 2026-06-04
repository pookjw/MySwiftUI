@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ActionEventType : OptionSet, Hashable {
    public static var started: ActionEventType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var updated: ActionEventType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var ended: ActionEventType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var skipped: ActionEventType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var paused: ActionEventType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var resumed: ActionEventType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var terminated: ActionEventType {
        get {
            assertUnimplemented()
        }
    }
    
    public init(rawValue: UInt) {
        assertUnimplemented()
    }
    
    public let rawValue: UInt
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias ArrayLiteralElement = ActionEventType
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Element = ActionEventType
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias RawValue = UInt
}
