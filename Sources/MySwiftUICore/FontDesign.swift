// 5603E46EFD6E0B67542F06407CC6DAD5
public import CoreGraphics
private import CoreFoundation
internal import CoreText

extension Font {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public static func system(size: CGFloat, weight: Font.Weight? = nil, design: Font.Design? = nil) -> Font {
        return Font(
            provider: FontBox(
                Font.SystemProvider(
                    size: size,
                    weight: weight,
                    design: design,
                    textStyle: nil,
                    maximumSize: nil
                )
            )
        )
    }
    
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @_disfavoredOverload public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        return Font(
            provider: FontBox(
                Font.SystemProvider(
                    size: size,
                    weight: weight,
                    design: design,
                    textStyle: nil,
                    maximumSize: nil
                )
            )
        )
    }
    
    public enum Design : Hashable, Sendable {
        case `default`
        @available(watchOS 7.0, *)
        case serif
        case rounded
        @available(watchOS 7.0, *)
        case monospaced
    }
}

extension Font {
    struct SystemProvider : CodableByProxy, FontProvider {
        fileprivate private(set) var size: CGFloat
        fileprivate private(set) var weight: Font.Weight?
        fileprivate private(set) var design: Font.Design?
        fileprivate private(set) var textStyle: Font.TextStyle?
        fileprivate private(set) var maximumSize: CGFloat?
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: any Decoder) throws -> Font.SystemProvider {
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
        
        var codingProxy: Font.SystemFontDefinition {
            assertUnimplemented()
        }
        
        static func unwrap(codingProxy: Font.SystemFontDefinition) -> Font.SystemProvider {
            assertUnimplemented()
        }
        
        static func == (lhs: Font.SystemProvider, rhs: Font.SystemProvider) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        fileprivate func effectiveSize(in context: Font.Context) -> CGFloat {
            assertUnimplemented()
        }
    }
    
    struct PrivateSystemDesignProvider {
        private var size: CGFloat
        private var weight: Font.Weight
        private var design: Font.PrivateDesign
    }
    
    struct PrivateDesign {
        private var value: CFString
    }
    
    struct SystemFontDefinition : Codable {
        // TODO
    }
}
