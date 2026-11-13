// 25811D44B7BE5E768C1CBA33158F398B
internal import CoreText

extension View {
    nonisolated public func fontDesign(_ design: Font.Design?) -> some View {
        return self.transformEnvironment(\.fontModifiers) { modifiers in
            // $s7SwiftUI4ViewPAAE10fontDesignyQrAA4FontV0E0OSgFySayAA03AnyF8ModifierCGzcfU_TA
            if let design {
                // <+240>
                let modifier = AnyDynamicFontModifier(Font.DesignModifier(design: design))
                modifiers.append(modifier)
            } else {
                // <+48>
                modifiers.removeAll { $0 is AnyDynamicFontModifier<Font.DesignModifier> }
            }
        }
    }

    nonisolated public func fontWeight(_ weight: Font.Weight?) -> some View {
        return self.transformEnvironment(\.fontModifiers) { modifiers in
            // $s7SwiftUI4ViewPAAE10fontWeightyQrAA4FontV0E0VSgFySayAA03AnyF8ModifierCGzcfU_TA
            if let weight {
                // <+460>
                let modifier = AnyDynamicFontModifier(Font.WeightModifier(weight: weight))
                modifiers.append(modifier)
            } else {
                // <+48>
                modifiers.removeAll { modifier in
                    if modifier is AnyDynamicFontModifier<Font.WeightModifier> {
                        return true
                    } else if modifier is AnyStaticFontModifier<Font.ItalicModifier> {
                        return isLinkedOnOrAfter(.v7)
                    } else {
                        return false
                    }
                }
            }
        }
    }
}

class AnyFontModifier : Hashable, @unchecked Sendable {
    static func == (lhs: AnyFontModifier, rhs: AnyFontModifier) -> Bool {
        return lhs.isEqual(to: rhs)
    }
    
    func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
        // noop
    }
    
    func modify(traits: inout Font.ResolvedTraits) {
        // noop
    }
    
    func isEqual(to other: AnyFontModifier) -> Bool {
        return false
    }
    
    func hash(into hasher: inout Hasher) {
        // noop
    }
    
    var typeID: ObjectIdentifier {
        fatalError() // abtract
    }
    
    var hashValue: Int {
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }
    
    init() {}
}

final class AnyDynamicFontModifier<T : FontModifier> : AnyFontModifier, @unchecked Sendable {
    let modifier: T
    
    init(_ modifier: T) {
        self.modifier = modifier
    }
    
    override func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
        assertUnimplemented()
    }
    
    override func modify(traits: inout Font.ResolvedTraits) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyFontModifier) -> Bool {
        assertUnimplemented()
    }
    
    override func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    override var typeID: ObjectIdentifier {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    var fontModifiers: [AnyFontModifier] {
        get {
            return self[FontModifiersKey.self]
        }
        set {
            self[FontModifiersKey.self] = newValue
        }
    }
}

fileprivate struct FontModifiersKey : EnvironmentKey {
    static var defaultValue: [AnyFontModifier] {
        return []
    }
}

extension Font {
    struct DesignModifier : FontModifier {
        fileprivate let design: Font.Design
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: Decoder) throws -> Font.DesignModifier {
            assertUnimplemented()
        }
        
        var tag: Font.DynamicModifierTag {
            assertUnimplemented()
        }
        
        func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
            assertUnimplemented()
        }
        
        func modify(traits: inout Font.ResolvedTraits) {
            assertUnimplemented()
        }
        
        var codingProxy: String {
            assertUnimplemented()
        }
        
        static func unwrap(codingProxy: String) -> Font.DesignModifier {
            assertUnimplemented()
        }
    }
    
    enum DynamicModifierTag {
        case weight
        case width
        case grade
        case design
        case _stylisticAlternative
        case leading
        case variation
        case _featureSettings
        case _openTypeFeatureSettings
        case _dictionaryFeatureSettings
        case language
        case lineHeightRatio
        case scalePointSize
        case setPointSize
    }
    
    struct WeightModifier: FontModifier {
        fileprivate private(set) var weight: Font.Weight
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: Decoder) throws -> Font.WeightModifier {
            assertUnimplemented()
        }
        
        var tag: Font.DynamicModifierTag {
            assertUnimplemented()
        }
        
        func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
            assertUnimplemented()
        }
        
        func modify(traits: inout Font.ResolvedTraits) {
            assertUnimplemented()
        }
        
        var codingProxy: CodableFontWeight {
            assertUnimplemented()
        }
        
        static func unwrap(codingProxy: CodableFontWeight) -> Font.WeightModifier {
            assertUnimplemented()
        }
    }
}

protocol FontModifier : Hashable, CodableByProxy {
    var tag: Font.DynamicModifierTag { get }
    func modify(descriptor: inout CTFontDescriptor, in context: Font.Context)
    func modify(traits: inout Font.ResolvedTraits)
}

extension FontModifier {
    func modify(traits: inout Font.ResolvedTraits) {
        assertUnimplemented()
    }
}

struct CodableFontWeight : CodableProxy {
    private(set) var base: Font.Weight
    
    init(_ base: Font.Weight) {
        self.base = base
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
