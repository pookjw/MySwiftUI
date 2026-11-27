// 2F4F6F37FC99B226E8F8E01317E236EE
public import CoreGraphics
public import CoreText

extension Font {
    public static func custom(_ name: String, size: CGFloat) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func custom(_ name: String, size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        return Font(
            provider: FontBox(
                Font.NamedProvider(
                    name: name,
                    size: size,
                    textStyle: textStyle
                )
            )
        )
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @available(*, deprecated, renamed: "custom(_:size:textStyle:)")
    public static func _custom(_ name: String, size: CGFloat, textStyle: Font.TextStyle) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func custom(_ name: String, fixedSize: CGFloat) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @available(*, deprecated, renamed: "custom(_:fixedSize:)")
    public static func _custom(_ name: String, verbatimSize: CGFloat) -> Font {
        assertUnimplemented()
    }
    
    public init(_ font: CTFont) {
        self.provider = FontBox(Font.PlatformFontProvider(font: font))
    }
}

extension Font {
    struct StyleDefinition : Codable {
        var style: Font.TextStyle
        var design: Font.Design?
        var weight: Font.Weight?
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    struct PrivateStyleDefinition : Codable {
        private var style: String
        private var design: String?
        @ProxyCodable private var weight: Font.Weight?
        
        fileprivate enum CodingKeys : String, CodingKey {
            case style
            case design
            case weight
        }
    }
    
    struct NamedProvider : CodableByProxy, FontProvider {
        fileprivate private(set) var name: String
        fileprivate private(set) var size: CGFloat
        fileprivate private(set) var textStyle: Font.TextStyle?
        
        var codingProxy: Font.NamedFontDefinition {
            assertUnimplemented()
        }
        
        static func unwrap(codingProxy: Font.NamedFontDefinition) -> Font.NamedProvider {
            assertUnimplemented()
        }
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: any Decoder) throws -> Font.NamedProvider {
            assertUnimplemented()
        }
        
        var tag: Font.ProviderTag {
            assertUnimplemented()
        }
        
        func resolveDescriptor(in context: Font.Context) -> CTFontDescriptor {
            assertUnimplemented()
        }
        
        func resolveTraits(in context: Font.Context) -> Font.ResolvedTraits {
            assertUnimplemented()
        }
        
        func removing<T : StaticFontModifier>(modifier: T.Type) -> any FontProvider {
            assertUnimplemented()
        }
        
        static func == (lhs: Font.NamedProvider, rhs: Font.NamedProvider) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    struct NamedFontDefinition : Codable {
        // TODO
    }
}
