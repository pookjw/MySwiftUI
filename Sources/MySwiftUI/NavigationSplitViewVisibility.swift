internal import MySwiftUICore

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct NavigationSplitViewVisibility : Equatable, Codable, Sendable {
    public static var detailOnly: NavigationSplitViewVisibility {
        assertUnimplemented()
    }
    
    public static var doubleColumn: NavigationSplitViewVisibility {
        assertUnimplemented()
    }
    
    public static var all: NavigationSplitViewVisibility {
        assertUnimplemented()
    }
    
    public static var automatic: NavigationSplitViewVisibility {
        assertUnimplemented()
    }
    
    public static func == (lhs: NavigationSplitViewVisibility, rhs: NavigationSplitViewVisibility) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

struct AnyNavigationSplitVisibility {
    private var kind: AnyNavigationSplitVisibility.Kind
}

extension AnyNavigationSplitVisibility {
    enum Kind {
        case deprecatedTwoColumn(visibility: Visibility)
        case twoColumn(visibility: NavigationSplitViewVisibility)
        case threeColumn(visibility: NavigationSplitViewVisibility)
        case twoUnboundColumns
        case threeUnboundColumns
    }
    
    struct ToTwoColumns {
        // TODO
    }
    
    struct ToThreeColumns {
        // TODO
    }
    
    struct ToDeprecatedTwoColumns {
        // TODO
    }
}

struct CompositeNavigationSplitViewVisibility {
    private var readWrite: Binding<AnyNavigationSplitVisibility>
    private var readOnly: NavigationSplitViewVisibility?
}

extension CompositeNavigationSplitViewVisibility {
    struct Key : HostPreferenceKey {
        static var defaultValue: Int {
            return 0
        }
        
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value = max(nextValue(), value)
        }
    }
}
