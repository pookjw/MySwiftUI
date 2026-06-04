@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public enum TweenMode {
    case hold
    case linear
    
    public static func == (a: TweenMode, b: TweenMode) -> Bool {
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

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TweenMode : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TweenMode : Hashable {}
