public import MySwiftUICore

@available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
public struct ScrollBounceBehavior : Sendable {
    private var role: ScrollBounceBehavior.Role
    
    public static var automatic: ScrollBounceBehavior {
        assertUnimplemented()
    }
    
    public static var always: ScrollBounceBehavior {
        assertUnimplemented()
    }
    
    public static var basedOnSize: ScrollBounceBehavior {
        assertUnimplemented()
    }
}

extension ScrollBounceBehavior {
    enum Role : Hashable {
        case automatic
        case always
        case basedOnSize
    }
}

extension View {
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
    nonisolated public func scrollBounceBehavior(_ behavior: ScrollBounceBehavior, axes: Axis.Set = [.vertical]) -> some View {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
    public var verticalScrollBounceBehavior: ScrollBounceBehavior {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
    public var horizontalScrollBounceBehavior: ScrollBounceBehavior {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
