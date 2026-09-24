// C17A136ED11B3E0D21D21D182F3B80B2
internal import CoreText

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
        assertUnimplemented()
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
