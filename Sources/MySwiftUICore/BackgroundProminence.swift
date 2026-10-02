@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct BackgroundProminence : Hashable, Sendable {
    public static let standard: BackgroundProminence = {
        assertUnimplemented()
    }()
    
    public static let increased: BackgroundProminence = {
        assertUnimplemented()
    }()
    
    public static func == (a: BackgroundProminence, b: BackgroundProminence) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension EnvironmentValues {
    public var backgroundProminence: BackgroundProminence {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
