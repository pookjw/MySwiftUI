public struct _EventDebugTriggers: OptionSet, Sendable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let responders = _EventDebugTriggers(rawValue: 1 << 1)
    public static let sendEvents = _EventDebugTriggers(rawValue: 1 << 2)
    public static let eventBindings = _EventDebugTriggers(rawValue: 1 << 3)
    public static let eventPhases = _EventDebugTriggers(rawValue: 1 << 4)
    public static let gestures = _EventDebugTriggers(rawValue: 1 << 5)
    public static let hitTest = _EventDebugTriggers(rawValue: 1 << 6)
    public static let all = _EventDebugTriggers(rawValue: -1)
    
    init(environmentString: String) {
        fatalError("TODO")
    }
}

@safe public nonisolated(unsafe) var _eventDebugTriggers = _EventDebugTriggers(rawValue: 1 << 1)
