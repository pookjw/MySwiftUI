// 9E031884FB9C9CDFD774AD0758E0F537
public import Foundation
public import CoreGraphics
public import CoreText
public import Accessibility

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes {
    public var mySwiftUI: MySwiftUIAttributes.Type { assertUnimplemented() }

    public struct MySwiftUIAttributes : AttributeScope {
        public let font: FontAttribute
        public let foregroundColor: ForegroundColorAttribute
        public let backgroundColor: BackgroundColorAttribute
        public let strikethroughStyle: StrikethroughStyleAttribute
        public let underlineStyle: UnderlineStyleAttribute
        public let kern: KerningAttribute
        public let tracking: TrackingAttribute
        public let baselineOffset: BaselineOffsetAttribute
        @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
        public let alignment: AttributeScopes.CoreTextAttributes.TextAlignmentAttribute
        @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
        public let lineHeight: AttributeScopes.CoreTextAttributes.LineHeightAttribute
        @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public let adaptiveImageGlyph: AdaptiveImageGlyphAttribute
        public let accessibility: AttributeScopes.AccessibilityAttributes
        public let foundation: AttributeScopes.FoundationAttributes
        public typealias DecodingConfiguration = AttributeScopeCodableConfiguration
        public typealias EncodingConfiguration = AttributeScopeCodableConfiguration
    }
}

@available(*, unavailable)
extension AttributeScopes.MySwiftUIAttributes : Sendable {}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes {
    @frozen public enum FontAttribute : AttributedStringKey {
        public typealias Value = Font
        public static let name: String = "SwiftUI.Font"
    }
    
    @frozen public enum ForegroundColorAttribute : AttributedStringKey {
        public typealias Value = Color
        public static let name: String = "SwiftUI.ForegroundColor"
    }
    
    @frozen public enum BackgroundColorAttribute : AttributedStringKey {
        public typealias Value = Color
        public static let name: String = "SwiftUI.BackgroundColor"
    }
    
    @frozen public enum StrikethroughStyleAttribute : AttributedStringKey {
        public typealias Value = Text.LineStyle
        public static let name: String = "SwiftUI.StrikethroughStyle"
    }
    
    @frozen public enum UnderlineStyleAttribute : AttributedStringKey {
        public typealias Value = Text.LineStyle
        public static let name: String = "SwiftUI.UnderlineStyle"
    }
    
    enum EncapsulationAttribute : CodableAttributedStringKey {
        public typealias Value = Text.Encapsulation
        public static let name: String = "SwiftUI.Encapsulation"
        
        static func decode(from decoder: any Decoder) throws -> Value {
            assertUnimplemented()
        }
        
        static func encode(_ value: Value, to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
    
    @frozen public enum KerningAttribute : CodableAttributedStringKey {
        public typealias Value = CGFloat
        public static let name: String = "SwiftUI.Kern"
    }
    
    @frozen public enum TrackingAttribute : CodableAttributedStringKey {
        public typealias Value = CGFloat
        public static let name: String = "SwiftUI.Tracking"
    }
    
    @frozen public enum BaselineOffsetAttribute : CodableAttributedStringKey {
        public typealias Value = CGFloat
        public static let name: String = "SwiftUI.BaselineOffset"
    }
    
    enum GlyphInfoAttribute : AttributedStringKey {
        typealias Value = CTGlyphInfo
        static let name: String = "SwiftUI.GlyphInfo"
    }
    
    enum TextScaleAttribute : CodableAttributedStringKey {
        typealias Value = Text.Scale.Storage
        static let name: String = "SwiftUI.TextScale"
        
        static func decode(from decoder: any Decoder) throws -> Value {
            assertUnimplemented()
        }
        
        static func encode(_ value: Value, to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
    
    enum TextJustificationAttribute : CodableAttributedStringKey {
        typealias Value = TextJustification.Storage
        
        static let name: String = "SwiftUI.TextJustification"
        
        static let runBoundaries: AttributedString.AttributeRunBoundaries? = {
            assertUnimplemented()
        }()
        
        static func decode(from decoder: any Decoder) throws -> Value {
            assertUnimplemented()
        }
        
        static func encode(_ value: Value, to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
    
    enum SuperscriptAttribute : AttributedStringKey {
        typealias Value = Text.Superscript
        static let name: String = "SwiftUI.Superscript"
    }
    
    enum CustomContainerAttribute : AttributedStringKey {
        typealias Value = Text.CustomAttributes
        static let name: String = "SwiftUI.CustomAttributes"
    }
    
    enum FontModifiersAttribute : AttributedStringKey {
        typealias Value = [AnyFontModifier]
        static let name: String = "SwiftUI.FontModifiers"
    }
    
    @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @frozen public enum AdaptiveImageGlyphAttribute : AttributedStringKey {
        public typealias Value = AttributedString.AdaptiveImageGlyph
        public static let name: String = "SwiftUI.AdaptiveImageGlyph"
        nonisolated(unsafe) public static var inheritedByAddedText: Bool = false
        public static var runBoundaries: AttributedString.AttributeRunBoundaries? { assertUnimplemented() }
    }
    
    enum InterpolationStrategy : CodableAttributedStringKey, Codable {
        case animated
        case unanimated
        
        typealias Value = Self
        static let name: String = "SwiftUI.InterpolationStrategy"
    }
    
    enum PrivateStrikethroughColorAttribute : AttributedStringKey {
        typealias Value = Color
        
        static var name: String {
            return "SwiftUI.StrikethroughColor"
        }
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributeScopes.MySwiftUIAttributes.FontAttribute : CodableAttributedStringKey {
    public static func decode(from decoder: any Decoder) throws -> Font { assertUnimplemented() }
    public static func encode(_ value: Font, to encoder: any Encoder) throws { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributeScopes.MySwiftUIAttributes.ForegroundColorAttribute : CodableAttributedStringKey {
    public static func decode(from decoder: any Decoder) throws -> Value { assertUnimplemented() }
    public static func encode(_ value: Value, to encoder: any Encoder) throws { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributeScopes.MySwiftUIAttributes.BackgroundColorAttribute : CodableAttributedStringKey {
    public static func decode(from decoder: any Decoder) throws -> Value { assertUnimplemented() }
    public static func encode(_ value: Value, to encoder: any Encoder) throws { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributeScopes.MySwiftUIAttributes.StrikethroughStyleAttribute : CodableAttributedStringKey {
    public static func decode(from decoder: any Decoder) throws -> Value { assertUnimplemented() }
    public static func encode(_ value: Value, to encoder: any Encoder) throws { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributeScopes.MySwiftUIAttributes.UnderlineStyleAttribute : CodableAttributedStringKey {
    public static func decode(from decoder: any Decoder) throws -> Value { assertUnimplemented() }
    public static func encode(_ value: Value, to encoder: any Encoder) throws { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributeScopes.MySwiftUIAttributes.AdaptiveImageGlyphAttribute : CodableAttributedStringKey {}

// ResolvableTextSegmentAttribute

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeDynamicLookup {
    public subscript<T>(dynamicMember keyPath: KeyPath<AttributeScopes.MySwiftUIAttributes, T>) -> T where T : AttributedStringKey {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.FontAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.FontAttribute : BitwiseCopyable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.ForegroundColorAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.ForegroundColorAttribute : BitwiseCopyable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.BackgroundColorAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.BackgroundColorAttribute : BitwiseCopyable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.StrikethroughStyleAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.StrikethroughStyleAttribute : BitwiseCopyable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.UnderlineStyleAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.UnderlineStyleAttribute : BitwiseCopyable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.KerningAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.KerningAttribute : BitwiseCopyable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.TrackingAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.TrackingAttribute : BitwiseCopyable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.BaselineOffsetAttribute : Sendable {}
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AttributeScopes.MySwiftUIAttributes.BaselineOffsetAttribute : BitwiseCopyable {}
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension AttributeScopes.MySwiftUIAttributes.AdaptiveImageGlyphAttribute : Sendable {}
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension AttributeScopes.MySwiftUIAttributes.AdaptiveImageGlyphAttribute : BitwiseCopyable {}
