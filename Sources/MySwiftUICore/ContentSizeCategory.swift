@available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
@available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "DynamicTypeSize")
@available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
@available(visionOS, introduced: 1.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
public enum ContentSizeCategory : Hashable, CaseIterable, Sendable {
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case extraExtraLarge
    case extraExtraExtraLarge
    case accessibilityMedium
    case accessibilityLarge
    case accessibilityExtraLarge
    case accessibilityExtraExtraLarge
    case accessibilityExtraExtraExtraLarge
    
    @available(iOS 13.4, macOS 10.15.4, tvOS 13.4, watchOS 6.2, *)
    public var isAccessibilityCategory: Bool {
        assertUnimplemented()
    }
    
    public static func == (a: ContentSizeCategory, b: ContentSizeCategory) -> Bool {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, renamed: "DynamicTypeSize")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "DynamicTypeSize")
    public typealias AllCases = [ContentSizeCategory]
    
    nonisolated public static var allCases: [ContentSizeCategory] {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ContentSizeCategory {
    @_alwaysEmitIntoClient public static func < (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        func comparisonValue(for sizeCategory: Self) -> Int {
            switch sizeCategory {
            case .extraSmall: return 0
            case .small: return 1
            case .medium: return 2
            case .large: return 3
            case .extraLarge: return 4
            case .extraExtraLarge: return 5
            case .extraExtraExtraLarge: return 6
            case .accessibilityMedium: return 7
            case .accessibilityLarge: return 8
            case .accessibilityExtraLarge: return 9
            case .accessibilityExtraExtraLarge: return 10
            case .accessibilityExtraExtraExtraLarge: return 11
            @unknown default: return 3
            }
        }
        
        return comparisonValue(for: lhs) < comparisonValue(for: rhs)
    }
    
    @_alwaysEmitIntoClient public static func <= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        !(rhs < lhs)
    }
    
    @_alwaysEmitIntoClient public static func > (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        rhs < lhs
    }
    
    @_alwaysEmitIntoClient public static func >= (lhs: ContentSizeCategory, rhs: ContentSizeCategory) -> Bool {
        !(lhs < rhs)
    }
}

extension EnvironmentValues {
    @available(iOS, introduced: 13.0, deprecated: 100000.0, renamed: "dynamicTypeSize")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, renamed: "dynamicTypeSize")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, renamed: "dynamicTypeSize")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, renamed: "dynamicTypeSize")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, renamed: "dynamicTypeSize")
    public var sizeCategory: ContentSizeCategory {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
