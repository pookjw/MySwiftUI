public import MySwiftUICore

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct ScrollIndicatorVisibility {
    private var role: ScrollIndicatorVisibility.Role
    
    public static var automatic: ScrollIndicatorVisibility {
        assertUnimplemented()
    }
    
    public static var visible: ScrollIndicatorVisibility {
        assertUnimplemented()
    }
    
    public static var hidden: ScrollIndicatorVisibility {
        assertUnimplemented()
    }
    
    public static var never: ScrollIndicatorVisibility {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension ScrollIndicatorVisibility : Sendable {
}

extension ScrollIndicatorVisibility {
    enum Role : Hashable {
        case automatic
        case visible
        case hidden
        case never
    }
}

@available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
extension ScrollIndicatorVisibility : Equatable {
    public static func == (a: ScrollIndicatorVisibility, b: ScrollIndicatorVisibility) -> Bool {
        assertUnimplemented()
    }
}

extension View {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func scrollIndicators(_ visibility: ScrollIndicatorVisibility, axes: Axis.Set = [.vertical, .horizontal]) -> some View {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public var verticalScrollIndicatorVisibility: ScrollIndicatorVisibility {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public var horizontalScrollIndicatorVisibility: ScrollIndicatorVisibility {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

struct ScrollIndicatorConfiguration : Equatable {
    private var visibility: ScrollIndicatorVisibility
    private var options: ScrollIndicatorOptions
    private var style: ScrollIndicatorStyle
}

struct ScrollIndicatorOptions : OptionSet {
    let rawValue: Int
}

struct ScrollIndicatorStyle : Equatable {
    private var value: ScrollIndicatorStyle.Value
}

extension ScrollIndicatorStyle {
    enum Value : Hashable {
        case automatic
        case overlay
        case legacy
    }
}
