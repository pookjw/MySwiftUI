public import Foundation
package import CoreGraphics
private import os.log
private import CoreText

@frozen public struct Text: Equatable, Sendable {
    @usableFromInline
    @frozen package enum Storage : Equatable {
        case verbatim(String)
        case anyTextStorage(AnyTextStorage)
        
        @usableFromInline
        package static func == (lhs: Text.Storage, rhs: Text.Storage) -> Bool {
            fatalError("TODO")
        }
    }
    
    @usableFromInline
    @frozen package enum Modifier : Equatable {
//        case color(Color?)
//        case font(Font?)
//        case italic
//        case weight(Font.Weight?)
//        case kerning(CGFloat)
//        case tracking(CGFloat)
//        case baseline(CGFloat)
//        case rounded
//        case anyTextModifier(AnyTextModifier)
        
        @usableFromInline
        package static func == (lhs: Text.Modifier, rhs: Text.Modifier) -> Bool {
            fatalError("TODO")
        }
    }
    
    @usableFromInline
    package var storage: Text.Storage
    @usableFromInline
    package var modifiers: [Text.Modifier] = [Modifier]()
    
    @inlinable public init(verbatim content: String) {
        storage = .verbatim(content)
    }
    
    @_disfavoredOverload public init<S>(_ content: S) where S : StringProtocol {
        fatalError("TODO")
    }
    
    package func resolveString(in environment: EnvironmentValues, with options: Text.ResolveOptions = [], idiom: AnyInterfaceIdiom?) -> String {
        fatalError("TODO")
    }
    
    package func assertUnstyled(_ text: String, options: Text.ResolveOptions = []) {
        guard isDebuggerAttached else {
            return
        }
        
        guard isStyled(options: options) else {
            return
        }
        
        unsafe os_log(.fault, log: Log.runtimeIssuesLog, "Only unstyled text can be used with %s", text)
    }
    
    func isStyled(options: Text.ResolveOptions = []) -> Bool {
        switch storage {
        case .verbatim(_):
            guard !modifiers.isEmpty else {
                return false
            }
            
            fatalError("TODO")
        case .anyTextStorage(_):
            fatalError("TODO")
        }
    }
}

extension Text: View {
    public var body: Never {
        fatalError("TODO")
    }
}

extension Text {
    package struct ResolveOptions: OptionSet {
        static var includeAccessibility: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 0)
        }
        
        static var foregroundKeyColor: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 1)
        }
        
        static var writeAuxiliaryMetadata: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 2)
        }
        
        static var includeTransitions: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 3)
        }
        
        static var disableLinkColor: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 4)
        }
        
        static var allowsKeyColors: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 5)
        }
        
        static var allowsTextSuffix: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 6)
        }
        
        static var includeSupportForRepeatedResolution: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 7)
        }
        
        static var ignoreMarkdown: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 8)
        }
        
        package let rawValue: Int
        
        package init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text {
    public struct DateStyle : Sendable {
        public static let time: Text.DateStyle = {
            fatalError("TODO")
        }()
        
        public static let date: Text.DateStyle = {
            fatalError("TODO")
        }()
        
        public static let relative: Text.DateStyle = {
            fatalError("TODO")
        }()
        
        public static let offset: Text.DateStyle = {
            fatalError("TODO")
        }()
        
        public static let timer: Text.DateStyle = {
            fatalError("TODO")
        }()
    }
    
    public init(_ date: Date, style: Text.DateStyle) {
        fatalError("TODO")
    }
    
    public init(_ dates: ClosedRange<Date>) {
        fatalError("TODO")
    }
    
    public init(_ interval: DateInterval) {
        fatalError("TODO")
    }
}

@usableFromInline
package class AnyTextStorage {
    package init() {}
    
    package func resolve<C>(into container: inout C, in environment: EnvironmentValues, with options: Text.ResolveOptions) where C: ResolvedTextContainer {
        fatalError("TODO")
    }
    
    package func resolvesToEmpty(in environment: EnvironmentValues, with options: Text.ResolveOptions) -> Bool {
        fatalError("TODO")
    }
    
    package func isEqual(to other: AnyTextStorage) -> Bool {
        fatalError("TODO")
    }
    
    package func isStyled(options: Text.ResolveOptions) -> Bool {
        fatalError("TODO")
    }
    
    package func allowsTypesettingLanguage() -> Bool {
        fatalError("TODO")
    }
    
    package var localizationInfo: _LocalizationInfo {
        fatalError("TODO")
    }
}

extension AnyTextStorage : @unchecked Sendable {
}

package protocol ResolvedTextContainer {
    var style: Text.Style { get set }
    var properties: Text.ResolvedProperties { get set }
    var idiom: AnyInterfaceIdiom? { get }
    
    mutating func append<S>(_ string: S, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) where S: StringProtocol
    mutating func append(_ attributedString: NSAttributedString, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool)
    mutating func append(_ image: Image.Resolved, in environment: EnvironmentValues, with options: Text.ResolveOptions)
    mutating func append<T>(resolvable: T, in environment: EnvironmentValues, with options: Text.ResolveOptions, transition: ContentTransition?) where T: ResolvableStringAttribute
}

extension Text {
    package struct Style {
        private var baseFont: Text.Style.TextStyleFont
        private var fontModifiers: [AnyFontModifier]
        private var color: Text.Style.TextStyleColor
        private var backgroundColor: Color?
        private var baselineOffset: CGFloat?
        private var kerning: CGFloat?
        private var tracking: CGFloat?
        private var strikethrough: Text.Style.LineStyle
        private var underline: Text.Style.LineStyle
        private var encapsulation: Text.Encapsulation?
        private var speech: AccessibilitySpeechAttributes?
        private var accessibility: AccessibilityTextAttributes?
        private var glyphInfo: CTGlyphInfo?
        private var shadow: TextShadowModifier?
        private var transition: TextTransitionModifier?
        private var scale: Text.Scale?
        private var superscript: Text.Superscript?
        private var typesettingConfiguration: TypesettingConfiguration
        private var customAttributes: [TextAttributeModifierBase]
        private var adaptiveImageGlyph: AttributedString.AdaptiveImageGlyph?
        private var alignment: AttributedString.TextAlignment?
        private var writingDirection: AttributedString.WritingDirection?
        private var lineHeight: AttributedString.LineHeight?
        private var clearedFontModifiers: Set<ObjectIdentifier>
        
        init() {
            fatalError("TODO")
        }
    }
    
    package struct ResolvedProperties {
        // TODO
    }
    
    struct Encapsulation {
        // TODO
    }
    
    struct Scale {
        // TODO
    }
    
    struct Superscript {
        // TODO
    }
}

extension Text.Style {
    enum TextStyleFont {
        case explicit(Font)
        case implicit
        case `default`
    }
    
    enum TextStyleColor {
        case explicit(AnyShapeStyle)
        case foregroundKeyColor(base: AnyShapeStyle)
        case implicit
        case `default`
    }
    
    struct LineStyle {
        private var nsUnderlineStyleValue: Int
        private var color: Color?
    }
}

package protocol ResolvableStringAttribute {
    // TODO
}

struct AccessibilitySpeechAttributes {
    // TODO
}

struct AccessibilityTextAttributes {
    // TODO
}

struct TextShadowModifier {
    // TODO
}

struct TextTransitionModifier {
    // TODO
}

class TextAttributeModifierBase {
    // TODO
}
