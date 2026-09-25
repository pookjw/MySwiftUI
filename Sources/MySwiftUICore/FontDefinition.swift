// C17A136ED11B3E0D21D21D182F3B80B2
internal import CoreText
private import _CoreTextPrivate

struct FontDefinitionType : Hashable, CustomDebugStringConvertible, @unchecked Sendable {
    private(set) var base: (any FontDefinition.Type)
    
    static func == (lhs: borrowing FontDefinitionType, rhs: borrowing FontDefinitionType) -> Bool {
        return lhs.base == rhs.base
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(UInt(bitPattern: ObjectIdentifier(self.base)))
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
}

protocol FontDefinition {
    static func resolveTextStyleFont(textStyle: Font.TextStyle, design: Font.Design?, weight: Font.Weight?, in context: Font.Context) -> CTFontDescriptor
    static func resolveTextStyleFontInfo(textStyle: Font.TextStyle, design: Font.Design?, weight: Font.Weight?, in context: Font.Context) -> Font.ResolvedTraits
    static func resolveSystemFont(size: CGFloat, design: Font.Design?, weight: Font.Weight?, in context: Font.Context) -> CTFontDescriptor
    static func resolveCustomFont(name: String, size: CGFloat, textStyle: Font.TextStyle?, in: Font.Context) -> CTFontDescriptor
    static func resolvePrivateTextStyleFont(textStyle: CFString, design: CFString?, weight: Font.Weight?, in context: Font.Context) -> CTFontDescriptor
    static func resolvePrivateTextStyleFontInfo(textStyle: CFString, design: CFString?, weight: Font.Weight?, in context: Font.Context) -> Font.ResolvedTraits
    static func resolvePrivateSystemDesignFont(size: CGFloat, design: CFString, weight: Font.Weight, in context: Font.Context) -> CTFontDescriptor
    static func resolvePrivateSystemDesignFontInfo(size: CGFloat, design: CFString, weight: Font.Weight, in context: Font.Context) -> Font.ResolvedTraits
    static func resolveFont(_ font: CTFont) -> CTFontDescriptor
    static func resolveFontInfo(_ font: CTFont) -> Font.ResolvedTraits
}

enum DefaultFontDefinition : FontDefinition {
    static func resolveTextStyleFont(textStyle: Font.TextStyle, design: Font.Design?, weight: Font.Weight?, in context: Font.Context) -> CTFontDescriptor {
        /*
         textStyle -> x0 -> x29 - 0x51
         design -> x1 -> w24
         weight -> x2/x3 -> x22/x23
         context -> x4
         */
        // w26
        let sizeCategory = context.sizeCategory
        // w27
        let legibilityWeight = context.legibilityWeight
        // x19
        let cfTextStyle = textStyle.cfTextStyle
        var attributes_1: [CFString: Any] = [:]
        var attributes_2: [CFString: Any] = [:]
        
        switch design {
        case .default:
            // <+128>
            attributes_1[kCTFontUIFontDesignTrait] = kCTFontUIFontDesignDefault
        case .serif:
            // <+184>
            attributes_1[kCTFontUIFontDesignTrait] = kCTFontUIFontDesignSerif
        case .rounded:
            // <+148>
            attributes_1[kCTFontUIFontDesignTrait] = kCTFontUIFontDesignRounded
        case .monospaced:
            // <+104>
            attributes_1[kCTFontUIFontDesignTrait] = kCTFontUIFontDesignMonospaced
        case nil:
            // <+168>
            break
        }
        
        // <+376>
        if let weight {
            // <+396>
            attributes_1[kCTFontWeightTrait] = weight.value
        }
        
        // <+488>
        if !attributes_1.isEmpty {
            attributes_2[kCTFontTraitsAttribute] = attributes_1
        }
        
        if let legibilityWeight {
            // <+680>
            switch legibilityWeight {
            case .regular:
                attributes_2[kCTFontLegibilityWeightAttribute] = CTFontLegibilityWeight.regular.rawValue
            case .bold:
                attributes_2[kCTFontLegibilityWeightAttribute] = CTFontLegibilityWeight.bold.rawValue
            }
        }
        
        // <+780>
        attributes_2[kCTFontTargetEnvironmentAttribute] = CTFontTargetEnvironment.unknown3.rawValue
        
        // <+868>
        let dynamicTypeSize = DynamicTypeSize(sizeCategory)
        let ctTextSize = dynamicTypeSize.ctTextSize
        
        let fontDescriptor = CTFontDescriptorCreateWithTextStyleAndAttributes(
            cfTextStyle,
            ctTextSize,
            attributes_2 as CFDictionary
        )
        
        return fontDescriptor
    }
    
    static func resolveTextStyleFontInfo(textStyle: Font.TextStyle, design: Font.Design?, weight: Font.Weight?, in context: Font.Context) -> Font.ResolvedTraits {
        assertUnimplemented()
    }
    
    static func resolveSystemFont(size: CGFloat, design: Font.Design?, weight: Font.Weight?, in context: Font.Context) -> CTFontDescriptor {
        assertUnimplemented()
    }
    
    static func resolveCustomFont(name: String, size: CGFloat, textStyle: Font.TextStyle?, in: Font.Context) -> CTFontDescriptor {
        assertUnimplemented()
    }
    
    static func resolvePrivateTextStyleFont(textStyle: CFString, design: CFString?, weight: Font.Weight?, in context: Font.Context) -> CTFontDescriptor {
        assertUnimplemented()
    }
    
    static func resolvePrivateTextStyleFontInfo(textStyle: CFString, design: CFString?, weight: Font.Weight?, in context: Font.Context) -> Font.ResolvedTraits {
        assertUnimplemented()
    }
    
    static func resolvePrivateSystemDesignFont(size: CGFloat, design: CFString, weight: Font.Weight, in context: Font.Context) -> CTFontDescriptor {
        assertUnimplemented()
    }
    
    static func resolvePrivateSystemDesignFontInfo(size: CGFloat, design: CFString, weight: Font.Weight, in context: Font.Context) -> Font.ResolvedTraits {
        assertUnimplemented()
    }
    
    static func resolveFont(_ font: CTFont) -> CTFontDescriptor {
        assertUnimplemented()
    }
    
    static func resolveFontInfo(_ font: CTFont) -> Font.ResolvedTraits {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    var fontDefinition: (any FontDefinition.Type) {
        get {
            return self[FontDefinitionKey.self].base
        }
        set {
            self[FontDefinitionKey.self] = FontDefinitionType(base: newValue)
        }
    }
}

fileprivate struct FontDefinitionKey : EnvironmentKey {
    static let defaultValue = FontDefinitionType(base: DefaultFontDefinition.self)
}
