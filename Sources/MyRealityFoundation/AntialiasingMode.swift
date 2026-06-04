@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, tvOS 26.0, *)
public enum AntialiasingMode : Hashable, Sendable {
    case none
    case multisample4X
    
    public static func == (a: AntialiasingMode, b: AntialiasingMode) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}
