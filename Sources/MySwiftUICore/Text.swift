// 7AFAB46D18FA6D189589CFA78D8B2B2E
public import Foundation
package import CoreGraphics
private import os.log
private import CoreText
private import UIFoundation

@frozen public struct Text: Equatable, Sendable {
    @usableFromInline
    @frozen package enum Storage : Equatable {
        case verbatim(String)
        case anyTextStorage(AnyTextStorage)
        
        @usableFromInline
        package static func == (lhs: Text.Storage, rhs: Text.Storage) -> Bool {
            assertUnimplemented()
        }
        
        func resolve<T: ResolvedTextContainer>(into container: inout T, in environmentValues: EnvironmentValues, with options: Text.ResolveOptions) {
            switch self {
            case .verbatim(_):
                assertUnimplemented()
            case .anyTextStorage(let storage):
                storage.resolve(into: &container, in: environmentValues, with: options)
            }
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
            assertUnimplemented()
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
        assertUnimplemented()
    }
    
    package func resolveString(in environment: EnvironmentValues, with options: Text.ResolveOptions = [], idiom: AnyInterfaceIdiom?) -> String {
        switch storage {
        case .verbatim(let string):
            return string
        case .anyTextStorage(let textStorage):
            var resolved = Text.ResolvedString(
                style: Text.Style(),
                idiom: nil,
                string: "",
                hasResolvableAttributes: false
            )
            
            self.resolve(into: &resolved, in: environment, with: options)
            return resolved.string
        }
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
            
            assertUnimplemented()
        case .anyTextStorage(_):
            assertUnimplemented()
        }
    }
    
    func resolve<T: ResolvedTextContainer>(into container: inout T, in environmentValues: EnvironmentValues, with options: Text.ResolveOptions) {
        let style = container.style
        
        if modifiers.isEmpty {
            storage.resolve(into: &container, in: environmentValues, with: options)
        } else {
            assertUnimplemented()
        }
    }
}

extension Text: View {
    public var body: Never {
        assertUnimplemented()
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
    
    struct Resolved: ResolvedTextContainer {
        init() {
            assertUnimplemented()
        }
        
        var style: Text.Style
        private var attributedString: NSMutableAttributedString?
        var includeDefaultAttributes: Bool
        var idiom: AnyInterfaceIdiom?
        var properties: Text.ResolvedProperties
        
        mutating func append<S>(_ string: S, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) where S : StringProtocol {
            assertUnimplemented()
        }
        
        mutating func append(_ attributedString: NSAttributedString, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) {
            assertUnimplemented()
        }
        
        mutating func append(_ image: Image.Resolved, in environment: EnvironmentValues, with options: Text.ResolveOptions) {
            assertUnimplemented()
        }
        
        mutating func append<T>(resolvable: T, in environment: EnvironmentValues, with options: Text.ResolveOptions, transition: ContentTransition?) where T : ResolvableStringAttribute {
            assertUnimplemented()
        }
    }
    
    struct ResolvedString: ResolvedTextContainer {
        var style: Text.Style
        var idiom: AnyInterfaceIdiom?
        var string: String
        var hasResolvableAttributes: Bool
        
        var properties: Text.ResolvedProperties {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        mutating func append<S>(_ string: S, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) where S : StringProtocol {
            let str = String(string)
            let converted = str.caseConvertedIfNeeded(environment)
            
            if environment.shouldRedactContent {
                self.string.append(String(repeating: "\u{100BB7}", count: converted.count))
            } else {
                self.string.append(converted)
            }
        }
        
        mutating func append(_ attributedString: NSAttributedString, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) {
            append(attributedString.string, in: environment, with: options)
        }
        
        func append(_ image: Image.Resolved, in environment: EnvironmentValues, with options: Text.ResolveOptions) {
            assertUnimplemented()
        }
        
        func append<T>(resolvable: T, in environment: EnvironmentValues, with options: Text.ResolveOptions, transition: ContentTransition?) where T : ResolvableStringAttribute {
            assertUnimplemented()
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text {
    public struct DateStyle : Sendable {
        public static let time: Text.DateStyle = {
            assertUnimplemented()
        }()
        
        public static let date: Text.DateStyle = {
            assertUnimplemented()
        }()
        
        public static let relative: Text.DateStyle = {
            assertUnimplemented()
        }()
        
        public static let offset: Text.DateStyle = {
            assertUnimplemented()
        }()
        
        public static let timer: Text.DateStyle = {
            assertUnimplemented()
        }()
    }
    
    public init(_ date: Date, style: Text.DateStyle) {
        assertUnimplemented()
    }
    
    public init(_ dates: ClosedRange<Date>) {
        assertUnimplemented()
    }
    
    public init(_ interval: DateInterval) {
        assertUnimplemented()
    }
}

@usableFromInline
package class AnyTextStorage {
    package init() {}
    
    package func resolve<C>(into container: inout C, in environment: EnvironmentValues, with options: Text.ResolveOptions) where C: ResolvedTextContainer {
        assertUnimplemented()
    }
    
    package func resolvesToEmpty(in environment: EnvironmentValues, with options: Text.ResolveOptions) -> Bool {
        assertUnimplemented()
    }
    
    package func isEqual(to other: AnyTextStorage) -> Bool {
        assertUnimplemented()
    }
    
    package func isStyled(options: Text.ResolveOptions) -> Bool {
        assertUnimplemented()
    }
    
    package func allowsTypesettingLanguage() -> Bool {
        assertUnimplemented()
    }
    
    package var localizationInfo: _LocalizationInfo {
        assertUnimplemented()
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

extension ResolvedTextContainer {
    mutating func append(_ attributedString: NSAttributedString, in environment: EnvironmentValues, with options: Text.ResolveOptions) {
        let isUniqueSizeVariant = environment.textSizeVariant == .regular
        append(attributedString, in: environment, with: options, isUniqueSizeVariant: isUniqueSizeVariant)
    }
    
    mutating func append<S>(_ string: S, in environment: EnvironmentValues, with options: Text.ResolveOptions) where S: StringProtocol {
        let isUniqueSizeVariant = environment.textSizeVariant == .regular
        append(string, in: environment, with: options, isUniqueSizeVariant: isUniqueSizeVariant)
    }
}

extension Text {
    package struct Style {
        private var baseFont: Text.Style.TextStyleFont = .implicit
        private var fontModifiers: [AnyFontModifier] = []
        private var color: Text.Style.TextStyleColor = .default
        private var backgroundColor: Color? = nil
        private var baselineOffset: CGFloat? = nil
        private var kerning: CGFloat? = nil
        private var tracking: CGFloat? = nil
        private var strikethrough: Text.Style.LineStyle = .implicit
        private var underline: Text.Style.LineStyle = .implicit
        private var encapsulation: Text.Encapsulation? = nil
        private var speech: AccessibilitySpeechAttributes? = nil
        private var accessibility: AccessibilityTextAttributes? = nil
        private var glyphInfo: CTGlyphInfo? = nil
        private var shadow: TextShadowModifier? = nil
        private var transition: TextTransitionModifier?
        private var scale: Text.Scale? = nil
        private var superscript: Text.Superscript? = nil
        private var typesettingConfiguration = TypesettingConfiguration(languageAwareLineHeightRatio: .automatic)
        private var customAttributes: [TextAttributeModifierBase] = []
        private var adaptiveImageGlyph: AttributedString.AdaptiveImageGlyph? = nil
        private var alignment: AttributedString.TextAlignment? = nil
        private var writingDirection: AttributedString.WritingDirection? = nil
        private var lineHeight: AttributedString.LineHeight? = nil
        private var clearedFontModifiers: Set<ObjectIdentifier> = []
        
        init() {}
    }
    
    package struct ResolvedProperties {
        // TODO
    }
    
    struct Encapsulation {
        private var scale: Text.Encapsulation.Scale?
        private var shape: Text.Encapsulation.Shape?
        private var style: Text.Encapsulation.Style?
        private var lineWeight: CGFloat?
        private var color: Color?
        private var minimumWidth: CGFloat?
        private var platterSize: Text.Encapsulation.PlatterSize?
    }
    
    public struct Scale {
        // TODO
    }
    
    struct Superscript {
        // TODO
    }
    
    public struct LineStyle {
        private var nsUnderlineStyleValue: Int
        private var color: Color?
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
    
    enum LineStyle {
        case explicit(Text.LineStyle)
        case implicit
        case `default`
    }
}

extension Text.Encapsulation {
    struct Scale {
        private let nsScale: NSTextEncapsulationScale
    }
    
    struct Shape {
        private let nsShape: NSTextEncapsulationShape
    }
    
    struct Style {
        private let nsStyle: NSTextEncapsulationStyle
    }
    
    struct PlatterSize {
        private let nsPlatterSize: NSTextEncapsulationPlatterSize
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

extension String {
    func caseConvertedIfNeeded(_ environment: EnvironmentValues) -> String {
        guard let textCase = environment.textCase else {
            return self
        }
        
        let locale = environment.locale
        
        switch textCase {
        case .uppercase:
            return self.uppercased(with: locale)
        case .lowercase:
            return self.lowercased(with: locale)
        }
    }
}
