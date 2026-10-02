package struct AccessibilityProperties {
    private var identifier: AccessibilityIdentifierStorage? // 0x0
    private var label: AccessibilityLabelStorage? // 0x18
    package var traits: AccessibilityNullableOptionSet<AccessibilityTraitSet>? // 0x28
    private var value: AccessibilityValueStorage? // 0x40
    private var visibility: AccessibilityNullableOptionSet<AccessibilityVisibility>? // 0x70
    private var textLayoutProperties: AccessibilityTextLayoutProperties? // 0x80
    private var storage: AccessibilityProperties.CustomPropertyStorage // 0x118
    
    package init() {
        self.identifier = nil
        self.label = nil
        self.traits = nil
        self.value = nil
        self.visibility = nil
        self.textLayoutProperties = nil
        self.storage = AccessibilityProperties.CustomPropertyStorage(storage: [:])
    }
}

extension AccessibilityProperties {
    struct CustomPropertyStorage {
        fileprivate private(set) var storage: [ObjectIdentifier : any AnyAccessibilityPropertiesEntry]
    }
}

protocol AnyAccessibilityPropertiesEntry {
    // TODO
}

struct AccessibilityIdentifierStorage {
    private let rawValue: String
    private let placement: AccessibilityIdentifierStorage.Placement
}

extension AccessibilityIdentifierStorage {
    enum Placement {
        case assign
        case optional
        case suffix
    }
}

struct AccessibilityLabelStorage {
    private var texts: [Text]
    private var placement: AccessibilityLabelStorage.Placement
}

extension AccessibilityLabelStorage {
    enum Placement {
        case prefix
        case suffix
        case assign
        case optional
    }
}

struct AccessibilityValueStorage {
    private var value: AnyAccessibilityValue?
    private var description: AccessibilityValueStorage.Description
}

extension AccessibilityValueStorage {
    enum Description {
        case text([Text])
        case empty
    }
}

enum AccessibilityTextLayoutProperties {
    case custom(TextLayoutProperties)
    case automatic
}
