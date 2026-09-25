internal import CoreFoundation
private import _CoreTextPrivate

public enum DynamicTypeSize : Hashable, Comparable, CaseIterable, Sendable {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    case xxxLarge
    case accessibility1
    case accessibility2
    case accessibility3
    case accessibility4
    case accessibility5
    
    public var isAccessibilitySize: Bool {
        assertUnimplemented()
    }
    
    static var systemDefault: DynamicTypeSize {
        fatalError()
    }
}

extension DynamicTypeSize {
    init(_ category: ContentSizeCategory) {
        switch category {
        case .extraSmall:
            self = .xSmall
        case .small:
            self = .small
        case .medium:
            self = .medium
        case .large:
            self = .large
        case .extraLarge:
            self = .xLarge
        case .extraExtraLarge:
            self = .xxLarge
        case .extraExtraExtraLarge:
            self = .xxxLarge
        case .accessibilityMedium:
            self = .accessibility1
        case .accessibilityLarge:
            self = .accessibility2
        case .accessibilityExtraLarge:
            self = .accessibility3
        case .accessibilityExtraExtraLarge:
            self = .accessibility4
        case .accessibilityExtraExtraExtraLarge:
            self = .accessibility5
        }
    }
    
    init?(_ textSize: CFString) {
        assertUnimplemented()
    }
    
    var ctTextSize: CFString {
        switch self {
        case .xSmall:
            return kCTFontContentSizeCategoryXS
        case .small:
            return kCTFontContentSizeCategoryS
        case .medium:
            return kCTFontContentSizeCategoryM
        case .large:
            return kCTFontContentSizeCategoryL
        case .xLarge:
            return kCTFontContentSizeCategoryXL
        case .xxLarge:
            return kCTFontContentSizeCategoryXXL
        case .xxxLarge:
            return kCTFontContentSizeCategoryXXXL
        case .accessibility1:
            return kCTFontContentSizeCategoryAccessibilityM
        case .accessibility2:
            return kCTFontContentSizeCategoryAccessibilityL
        case .accessibility3:
            return kCTFontContentSizeCategoryAccessibilityXL
        case .accessibility4:
            return kCTFontContentSizeCategoryAccessibilityXXL
        case .accessibility5:
            return kCTFontContentSizeCategoryAccessibilityXXXL
        }
    }
}

extension EnvironmentValues {
    public var dynamicTypeSize: DynamicTypeSize {
        get {
            return self[DynamicTypeSizeKey.self]
        }
        set {
            self[DynamicTypeSizeKey.self] = newValue
        }
    }
}

fileprivate struct DynamicTypeSizeKey : EnvironmentKey {
    static var defaultValue: DynamicTypeSize {
        return .large
    }
}
