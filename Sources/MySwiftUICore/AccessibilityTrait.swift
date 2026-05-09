package enum AccessibilityTrait : UInt64, Hashable, CaseIterable {
    case isButton
    case isHeader
    case isSelected
    case isLink
    case isSearchField
    case isImage
    case playsSound
    case isKeyboardKey
    case isStaticText
    case isSummaryElement
    case updatesFrequently
    case startsMediaSession
    case allowsDirectInteraction
    case causesPageTurn
    case isModal
    case isCheckbox
    case isSwitch
    case isRadioButton
    case isRadioGroup
    case isLabel
    case isSingleSiblingWithGesture
    case isInteractive
    case isTabBar
    case isTabButton
    case isBackButton
    case excludeFromItemChooser
    case isControlGroup
    case isPopupButton
    case isMenuButton
    case isToggle
    case isMathEquation
    case isAccessory
    
    var displayDescription: String? {
        assertUnimplemented()
    }
    
//    var uiTrait: AXSwiftUITraits? {
//        assertUnimplemented()
//    }
    
    var isElementUITrait: Bool {
        assertUnimplemented()
    }
    
    var isContainerUITrait: Bool {
        assertUnimplemented()
    }
    
    var isInteractionUITrait: Bool {
        assertUnimplemented()
    }
}

public struct AccessibilityTraits : SetAlgebra, Sendable {
    public static let isButton = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isButton))
    public static let isHeader = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isHeader))
    public static let isSelected = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isSelected))
    public static let isLink = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isLink))
    public static let isSearchField = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isSearchField))
    public static let isImage = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isImage))
    public static let playsSound = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .playsSound))
    public static let isKeyboardKey = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isKeyboardKey))
    public static let isStaticText = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isStaticText))
    public static let isSummaryElement = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isSummaryElement))
    public static let updatesFrequently = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .updatesFrequently))
    public static let startsMediaSession = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .startsMediaSession))
    public static let allowsDirectInteraction = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .allowsDirectInteraction))
    public static let causesPageTurn = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .causesPageTurn))
    public static let isModal = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isModal))
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    public static let isToggle = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isToggle))
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public static let isTabBar = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isTabBar))
    static let isTabButton = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isTabButton))
    static let isBackButton = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isBackButton))
    static let excludeFromItemChooser = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .excludeFromItemChooser))
    static let isSwitch = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isSwitch))
    static let isMathEquation = AccessibilityTraits(traitSet: AccessibilityTraitSet(trait: .isMathEquation))
    
    private var traitSet: AccessibilityTraitSet
    
    public init() {
        self.traitSet = []
    }
    
    @inline(always)
    fileprivate init(traitSet: AccessibilityTraitSet) {
        self.traitSet = traitSet
    }
    
    public func union(_ other: AccessibilityTraits) -> AccessibilityTraits {
        return AccessibilityTraits(traitSet: self.traitSet.union(other.traitSet))
    }
    
    public mutating func formUnion(_ other: AccessibilityTraits) {
        self.traitSet.formUnion(other.traitSet)
    }
    
    public func intersection(_ other: AccessibilityTraits) -> AccessibilityTraits {
        return AccessibilityTraits(traitSet: self.traitSet.intersection(other.traitSet))
    }
    
    public mutating func formIntersection(_ other: AccessibilityTraits) {
        self.traitSet.formIntersection(other.traitSet)
    }
    
    public func symmetricDifference(_ other: AccessibilityTraits) -> AccessibilityTraits {
        return AccessibilityTraits(traitSet: self.traitSet.symmetricDifference(other.traitSet))
    }
    
    public mutating func formSymmetricDifference(_ other: AccessibilityTraits) {
        self.traitSet.formSymmetricDifference(other.traitSet)
    }
    
    public func contains(_ member: AccessibilityTraits) -> Bool {
        return self.traitSet.contains(member.traitSet)
    }
    
    public mutating func insert(_ newMember: AccessibilityTraits) -> (inserted: Bool, memberAfterInsert: AccessibilityTraits) {
        let value = self.traitSet.insert(newMember.traitSet)
        return (inserted: value.inserted, memberAfterInsert: AccessibilityTraits(traitSet: value.memberAfterInsert))
    }
    
    public mutating func remove(_ member: AccessibilityTraits) -> AccessibilityTraits? {
        if let value = self.traitSet.remove(member.traitSet) {
            return AccessibilityTraits(traitSet: value)
        } else {
            return nil
        }
    }
    
    public mutating func update(with newMember: AccessibilityTraits) -> AccessibilityTraits? {
        if let value = self.traitSet.update(with: newMember.traitSet) {
            return AccessibilityTraits(traitSet: value)
        } else {
            return nil
        }
    }
    
    public typealias ArrayLiteralElement = AccessibilityTraits
    public typealias Element = AccessibilityTraits
}

package struct AccessibilityTraitSet : OptionSet, Hashable, Codable {
    package let rawValue: UInt64
    
    package init(trait: AccessibilityTrait) {
        self.rawValue = trait.rawValue &<< 1
    }
    
    package init(rawValue: UInt64) {
        self.rawValue = rawValue
    }
    
    init(traits: [AccessibilityTrait]) {
        var rawValue: UInt64 = 0
        
        for trait in traits {
            rawValue += trait.rawValue &<< 1
        }
        
        self.rawValue = rawValue
    }
}
