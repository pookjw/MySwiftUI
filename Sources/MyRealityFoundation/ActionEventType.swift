@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ActionEventType : OptionSet, Hashable {
    public static var started: ActionEventType {
        return ActionEventType(rawValue: 1 << 0)
    }
    
    public static var updated: ActionEventType {
        return ActionEventType(rawValue: 1 << 1)
    }
    
    public static var ended: ActionEventType {
        return ActionEventType(rawValue: 1 << 2)
    }
    
    public static var skipped: ActionEventType {
        return ActionEventType(rawValue: 1 << 3)
    }
    
    public static var paused: ActionEventType {
        return ActionEventType(rawValue: 1 << 4)
    }
    
    public static var resumed: ActionEventType {
        return ActionEventType(rawValue: 1 << 5)
    }
    
    public static var terminated: ActionEventType {
        return ActionEventType(rawValue: 1 << 6)
    }
    
    static var created: ActionEventType {
        return ActionEventType(rawValue: 1 << 7)
    }
    
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    public let rawValue: UInt
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias ArrayLiteralElement = ActionEventType
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Element = ActionEventType
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias RawValue = UInt
}
