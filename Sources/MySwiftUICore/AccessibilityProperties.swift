internal import Foundation

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
    
    init(identifier: AccessibilityIdentifierStorage?, label: AccessibilityLabelStorage?, traits: AccessibilityNullableOptionSet<AccessibilityTraitSet>?, value: AccessibilityValueStorage?, visibility: AccessibilityNullableOptionSet<AccessibilityVisibility>?, textLayoutProperties: AccessibilityTextLayoutProperties?) {
        assertUnimplemented()
    }
    
    init(reserving capacity: Int = 0) {
        assertUnimplemented()
    }
    
    var isEmpty: Bool {
        assertUnimplemented()
    }
    
    subscript(_ trait: AccessibilityTrait) -> Bool? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    subscript(_ trait: AccessibilityTrait, default defaultValue: Bool) -> Bool {
        get {
            assertUnimplemented()
        }
    }
    
    var inputLabels: [Text]? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var isTabButton: Bool? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var isBackButton: Bool? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var isTabBar: Bool? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var excludeFromItemChooser: Bool? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var sortPriority: Double? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var roleDescription: Text? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var locale: Locale? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var hints: [Text] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var images: [Image] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
}

extension AccessibilityProperties {
    struct CustomPropertyStorage : Equatable {
        fileprivate private(set) var storage: [ObjectIdentifier : any AnyAccessibilityPropertiesEntry]
        
        static func == (lhs: AccessibilityProperties.CustomPropertyStorage, rhs: AccessibilityProperties.CustomPropertyStorage) -> Bool {
            assertUnimplemented()
        }
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
    enum Placement : Hashable {
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
    enum Placement : Hashable {
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
    enum Description : Equatable {
        case text([Text])
        case empty
    }
}

enum AccessibilityTextLayoutProperties {
    case custom(TextLayoutProperties)
    case automatic
}

extension AccessibilityIdentifierStorage : Equatable {
    static func == (lhs: AccessibilityIdentifierStorage, rhs: AccessibilityIdentifierStorage) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityIdentifierStorage : AccessibilityCombinable {
    func merge(with other: AccessibilityIdentifierStorage) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityLabelStorage : Equatable {
    static func == (lhs: AccessibilityLabelStorage, rhs: AccessibilityLabelStorage) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityLabelStorage : AccessibilityCombinable {
    func merge(with other: AccessibilityLabelStorage) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityValueStorage : Equatable {
    static func == (lhs: AccessibilityValueStorage, rhs: AccessibilityValueStorage) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityValueStorage : AccessibilityCombinable {
    func merge(with other: AccessibilityValueStorage) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityTextLayoutProperties : Equatable {
    static func == (lhs: AccessibilityTextLayoutProperties, rhs: AccessibilityTextLayoutProperties) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityProperties : Equatable {
    package static func == (lhs: AccessibilityProperties, rhs: AccessibilityProperties) -> Bool {
        assertUnimplemented()
    }
}
