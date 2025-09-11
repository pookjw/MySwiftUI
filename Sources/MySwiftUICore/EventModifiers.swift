public struct EventModifiers: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static nonisolated(unsafe) let capsLock = EventModifiers(rawValue: 1 << 0)
    public static nonisolated(unsafe) let shift = EventModifiers(rawValue: 1 << 1)
    public static nonisolated(unsafe) let control = EventModifiers(rawValue: 1 << 2)
    public static nonisolated(unsafe) let option = EventModifiers(rawValue: 1 << 3)
    public static nonisolated(unsafe) let command = EventModifiers(rawValue: 1 << 4)
    public static nonisolated(unsafe) let numericPad = EventModifiers(rawValue: 1 << 5)
    
    @available(iOS, deprecated: 15.0, message: "Function modifier is reserved for system applications")
    @available(macOS, deprecated: 12.0, message: "Function modifier is reserved for system applications")
    @available(tvOS, deprecated: 15.0, message: "Function modifier is reserved for system applications")
    @available(watchOS, deprecated: 8.0, message: "Function modifier is reserved for system applications")
    @available(visionOS, deprecated: 1.0, message: "Function modifier is reserved for system applications")
    public static nonisolated(unsafe) let function = EventModifiers(rawValue: 1 << 6)
    
    package static nonisolated(unsafe) let _function = EventModifiers(rawValue: 1 << 6)
    
    public static nonisolated(unsafe) let all: EventModifiers = [.capsLock, .shift, .control, .option, .command, .numericPad, ._function]
}
