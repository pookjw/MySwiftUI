// 641995D812913A47B866B20B88782376
public import Foundation
package import CoreGraphics
private import os.log
private import CoreText
internal import UIFoundation
internal import AttributeGraph

@frozen public struct Text : Equatable, Sendable {
    @usableFromInline
    @frozen package enum Storage : Equatable {
        case verbatim(String)
        case anyTextStorage(AnyTextStorage)
        
        @usableFromInline
        package static func == (lhs: Text.Storage, rhs: Text.Storage) -> Bool {
            assertUnimplemented()
        }
        
        func resolve<T : ResolvedTextContainer>(into container: inout T, in environmentValues: EnvironmentValues, with options: Text.ResolveOptions) {
            switch self {
            case .verbatim(_):
                assertUnimplemented()
            case .anyTextStorage(let storage):
                storage.resolve(into: &container, in: environmentValues, with: options)
            }
        }
        
        func resolvesToEmpty(in environment: EnvironmentValues, with options: Text.ResolveOptions) -> Bool {
            assertUnimplemented()
        }
        
        func isStyled(options: Text.ResolveOptions) -> Bool {
            assertUnimplemented()
        }
        
        func allowsTypesettingLanguage() -> Bool {
            assertUnimplemented()
        }
    }
    
    @usableFromInline
    @frozen package enum Modifier : Equatable {
        case color(Color?) // 0x0
        case font(Font?) // 0x20
        case italic // 0xe0
        case weight(Font.Weight?) // 0x40 / 0x41
        case kerning(CGFloat) // 0x60
        case tracking(CGFloat) // 0x80
        case baseline(CGFloat) // 0xa0
        case rounded
        case anyTextModifier(AnyTextModifier) // 0xc0
        
        @usableFromInline
        package static func == (lhs: Text.Modifier, rhs: Text.Modifier) -> Bool {
            assertUnimplemented()
        }
    }
    
    @usableFromInline
    package var storage: Text.Storage // 0x0
    @usableFromInline
    package var modifiers: [Text.Modifier] = [Modifier]() // 0x18
    
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
        case .anyTextStorage(_):
            var resolved = Text.ResolvedString(
                style: Text.Style(),
                idiom: idiom,
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
    
    func resolve<T : ResolvedTextContainer>(into container: inout T, in environmentValues: EnvironmentValues, with options: Text.ResolveOptions) {
        let _ = container.style
        
        if modifiers.isEmpty {
            storage.resolve(into: &container, in: environmentValues, with: options)
        } else {
            assertUnimplemented()
        }
    }
}

extension Text : View {
    nonisolated public static func _makeView(view: _GraphValue<Text>, inputs: _ViewInputs) -> _ViewOutputs {
        guard
            let presentation = inputs.requestedTextRepresentation,
            presentation.shouldMakeRepresentation(inputs: inputs)
        else {
            return Text.makeCommonAttributes(view: view, inputs: inputs)
        }
        
        // <+280>
        var outputs = Text.makeCommonAttributes(view: view, inputs: inputs)
        // x29 - 0x158
        let options = presentation.representationOptions(inputs: inputs)
        
        let helper = ResolvedTextHelper(
            time: inputs.time,
            referenceDate: inputs[ReferenceDateInput.self],
            includeDefaultAttributes: options.contains(.includeStyledText),
            allowsKeyColors: false,
            archiveOptions: inputs[ArchivedViewInput.self],
            features: [],
            attachmentsAsAuxiliaryMetadata: inputs.hasWidgetMetadata,
            allowsAccessibilityAttributes: options.contains(.includeAccessibility),
            idiom: inputs[InterfaceIdiomInput.self] ?? AnyInterfaceIdiom(idiom: .phone),
            tracker: PropertyList.Tracker(),
            lastText: nil,
            nextUpdate: .time(.zero),
            sizeVariant: TextSizeVariant(rawValue: 0)
        )
        
        let filter = ResolvedTextFilter(
            text: view.value,
            environment: inputs.environment,
            helper: helper
        )
        
        let context = Text.MakeRepresentableContext(
            text: Attribute(filter),
            referenceDate: inputs[ReferenceDateInput.self],
            environment: inputs.environment
        )
        
        presentation.makeRepresentation(
            inputs: inputs,
            context: Attribute(context),
            outputs: &outputs
        )
        
        return outputs
    }

    nonisolated public static func _makeViewList(view: _GraphValue<Text>, inputs: _ViewListInputs) -> _ViewListOutputs {
        if inputs[RequestedLeafContentType.self] {
            // <+68>
            var copy = inputs
            copy.addTraitKey(LeafContentType.TraitKey.self)
            copy.$traits = Attribute(Text.WriteTextTrait(traits: OptionalAttribute(copy.$traits)))
            
            return _ViewListOutputs.unaryViewList(view: view, inputs: copy)
        } else {
            // <+300>
            return _ViewListOutputs.unaryViewList(view: view, inputs: inputs)
        }
    }

    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        return 1
    }
    
    public func _resolveText(in environment: EnvironmentValues) -> String {
        assertUnimplemented()
    }
}

extension Text : PrimitiveView {}

extension Text {
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public init<Subject>(_ subject: Subject, formatter: Formatter) where Subject : ReferenceConvertible {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public init<Subject>(_ subject: Subject, formatter: Formatter) where Subject : NSObject {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public init<F>(_ input: F.FormatInput, format: F) where F : FormatStyle, F.FormatInput : Equatable, F.FormatOutput == String {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, *)
    public init<F>(_ input: F.FormatInput, format: F) where F : FormatStyle, F.FormatInput : Equatable, F.FormatOutput == AttributedString {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public init(_ image: Image) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(timerInterval: ClosedRange<Date>, pauseTime: Date? = nil, countsDown: Bool = true, showsHours: Bool = true) {
        assertUnimplemented()
    }
    
    package init(dateFormat: String, timeZone: TimeZone?) {
        assertUnimplemented()
    }
    
    package init(dateFormatTemplate: String, timeZone: TimeZone?) {
        assertUnimplemented()
    }
    
    package init(progressInterval: ClosedRange<Date>, countsDown: Bool = true) {
        assertUnimplemented()
    }
    
    package init(variants: [Text]) {
        assertUnimplemented()
    }
}

extension Text {
    package struct ResolveOptions : OptionSet {
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
    
    struct Resolved : ResolvedTextContainer {
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
        
        func finalized(in environment: EnvironmentValues) -> NSMutableAttributedString? {
            assertUnimplemented()
        }
        
        func nsAttributes(content: (() -> String)?, in environment: EnvironmentValues, with options: Text.ResolveOptions, properties: inout Text.ResolvedProperties) -> [NSAttributedString.Key : Any] {
            assertUnimplemented()
        }
    }
    
    struct ResolvedString : ResolvedTextContainer {
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
        
        var units: NSCalendar.Unit {
            assertUnimplemented()
        }
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
    
    package func resolve<C>(into container: inout C, in environment: EnvironmentValues, with options: Text.ResolveOptions) where C : ResolvedTextContainer {
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

extension AnyTextStorage : CustomDebugStringConvertible {
    @usableFromInline package var debugDescription: String {
        assertUnimplemented()
    }
}

final class AttributedStringTextStorage : AnyTextStorage {
    private let str: AttributedString
    
    override func resolve<C>(into container: inout C, in environment: EnvironmentValues, with options: Text.ResolveOptions) where C : ResolvedTextContainer {
        assertUnimplemented()
    }
    
    override func resolvesToEmpty(in environment: EnvironmentValues, with options: Text.ResolveOptions) -> Bool {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextStorage) -> Bool {
        assertUnimplemented()
    }
    
    override func isStyled(options: Text.ResolveOptions) -> Bool {
        assertUnimplemented()
    }
    
    override func allowsTypesettingLanguage() -> Bool {
        assertUnimplemented()
    }
    
    override var localizationInfo: _LocalizationInfo {
        assertUnimplemented()
    }
    
    init(str: AttributedString) {
        self.str = str
        super.init()
    }
}

package protocol ResolvedTextContainer {
    var style: Text.Style { get set }
    var properties: Text.ResolvedProperties { get set }
    var idiom: AnyInterfaceIdiom? { get }
    
    mutating func append<S>(_ string: S, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool) where S : StringProtocol
    mutating func append(_ attributedString: NSAttributedString, in environment: EnvironmentValues, with options: Text.ResolveOptions, isUniqueSizeVariant: Bool)
    mutating func append(_ image: Image.Resolved, in environment: EnvironmentValues, with options: Text.ResolveOptions)
    mutating func append<T>(resolvable: T, in environment: EnvironmentValues, with options: Text.ResolveOptions, transition: ContentTransition?) where T : ResolvableStringAttribute
}

extension ResolvedTextContainer {
    mutating func append(_ attributedString: NSAttributedString, in environment: EnvironmentValues, with options: Text.ResolveOptions) {
        let isUniqueSizeVariant = environment.textSizeVariant == .regular
        append(attributedString, in: environment, with: options, isUniqueSizeVariant: isUniqueSizeVariant)
    }
    
    mutating func append<S>(_ string: S, in environment: EnvironmentValues, with options: Text.ResolveOptions) where S : StringProtocol {
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
        var clearedFontModifiers: Set<ObjectIdentifier> = []
        
        init() {}
        
        mutating func addFontModifier<T : StaticFontModifier>(type: T.Type) {
            assertUnimplemented()
        }
        
        mutating func removeFontModifier<T : StaticFontModifier>(ofType: T.Type) {
            assertUnimplemented()
        }
        
        func fontTraits(in environment: EnvironmentValues) -> Font.ResolvedTraits {
            assertUnimplemented()
        }
        
        func nsAttributes(content: (() -> String)?, environment: EnvironmentValues, includeDefaultAttributes: Bool, with options: Text.ResolveOptions, properties: inout Text.ResolvedProperties) -> [NSAttributedString.Key : Any] {
            assertUnimplemented()
        }
    }
    
    package struct ResolvedProperties {
        // TODO
    }
    
    struct Superscript : Hashable {
        // TODO
    }
    
    struct CustomAttributes : Hashable {
        // TODO
    }
    
    public struct LineStyle : Hashable, Sendable {
        private var nsUnderlineStyleValue: Int
        fileprivate var color: Color?

        public init(pattern: Pattern = .solid, color: Color? = nil) {
            self.nsUnderlineStyleValue = pattern.nsUnderlineStyle.union(.single).rawValue
            self.color = color
        }
        
        init?(_nsUnderlineStyle: NSUnderlineStyle) {
            assertUnimplemented()
        }
        
        init?(_nsUnderlineStyleForTextEditing: NSUnderlineStyle) {
            guard !_nsUnderlineStyleForTextEditing.isEmpty else {
                return nil
                
            }
            self.nsUnderlineStyleValue = _nsUnderlineStyleForTextEditing.rawValue
            self.color = nil
        }

        public struct Pattern : Sendable {
            fileprivate let nsUnderlineStyle: NSUnderlineStyle
            
            public static let solid = Text.LineStyle.Pattern(nsUnderlineStyle: [])
            public static let dot = Text.LineStyle.Pattern(nsUnderlineStyle: [.patternDot])
            public static let dash = Text.LineStyle.Pattern(nsUnderlineStyle: [.patternDash])
            public static let dashDot = Text.LineStyle.Pattern(nsUnderlineStyle: [.patternDashDot])
            public static let dashDotDot = Text.LineStyle.Pattern(nsUnderlineStyle: [.patternDashDotDot])
        }

        public static let single = Text.LineStyle(
            pattern: Text.LineStyle.Pattern(nsUnderlineStyle: .single),
            color: nil
        )
    }
}

extension Text.ResolvedProperties {
    struct CustomAttachments {
        // TODO
    }
    
    struct Features : OptionSet {
        static var keyColor: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 0)
        }
        
        static var attachments: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 1)
        }
        
        static var sensitive: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 2)
        }
        
        static var customRenderer: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 3)
        }
        
        static var useTextLayoutManager: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 4)
        }
        
        static var useTextSuffix: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 5)
        }
        
        static var produceTextLayout: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 6)
        }
        
        static var checkInterpolationStrategy: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 7)
        }
        
        static var isUniqueSizeVariant: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 8)
        }
        
        static var isStandaloneSizeVariant: Text.ResolvedProperties.Features {
            return Text.ResolvedProperties.Features(rawValue: 1 << 9)
        }
        
        let rawValue: UInt16
    }
    
    struct Transition {
        // TODO
    }
    
    struct Paragraph {
        // TODO
    }
    
    struct Links {
        // TODO
    }
}

extension Text.Storage : @unchecked Sendable {}
extension Text.Modifier : @unchecked Sendable {}

extension Text {
    @_disfavoredOverload public init(_ attributedContent: AttributedString) {
        self.storage = .anyTextStorage(AttributedStringTextStorage(str: attributedContent))
        self.modifiers = []
    }
}

extension Text {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func textScale(_ scale: Text.Scale, isEnabled: Bool = true) -> Text { assertUnimplemented() }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Text {
    public func customAttribute<T>(_ value: T) -> Text where T : TextAttribute { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Text {
    public struct WritingDirectionStrategy : Hashable, Sendable {
        public static let layoutBased: Self = { assertUnimplemented() }()
        public static let contentBased: Self = { assertUnimplemented() }()
        public static let `default`: Self = { assertUnimplemented() }()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Text {
    public struct AlignmentStrategy : Hashable, Sendable {
        public static let layoutBased: Self = { assertUnimplemented() }()
        public static let writingDirectionBased: Self = { assertUnimplemented() }()
        public static let `default`: Self = { assertUnimplemented() }()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.DateStyle : Equatable {
    public static func == (a: Self, b: Self) -> Bool { assertUnimplemented() }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.DateStyle : Codable {
    public func encode(to encoder: any Encoder) throws { assertUnimplemented() }
    public init(from decoder: any Decoder) throws { assertUnimplemented() }
}

extension Text {
    public var _localizationInfo: _LocalizationInfo { assertUnimplemented() }
}

@available(iOS, introduced: 13.0, deprecated: 26.0, message: "Use string interpolation on `Text` instead: `Text(\"Hello \\(name)\")`")
@available(macOS, introduced: 10.15, deprecated: 26.0, message: "Use string interpolation on `Text` instead: `Text(\"Hello \\(name)\")`")
@available(tvOS, introduced: 13.0, deprecated: 26.0, message: "Use string interpolation on `Text` instead: `Text(\"Hello \\(name)\")`")
@available(watchOS, introduced: 6.0, deprecated: 26.0, message: "Use string interpolation on `Text` instead: `Text(\"Hello \\(name)\")`")
extension Text {
    public static func + (lhs: Text, rhs: Text) -> Text { assertUnimplemented() }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Text {
    public func textVariant<V>(_ preference: V) -> some View where V : TextVariantPreference {
        let result: Text = { assertUnimplemented() }()
        return result
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public protocol TextVariantPreference {
    var _preference: _TextVariantPreference<Self> { get }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct _TextVariantPreference<Preference> : Sendable where Preference : TextVariantPreference {}

extension Text.Style {
    enum TextStyleFont {
        case explicit(Font)
        case implicit
        case `default`
        
        func resolve(in environment: EnvironmentValues, includeDefaultAttributes: Bool) -> Font? {
            assertUnimplemented()
        }
    }
    
    enum TextStyleColor {
        case explicit(AnyShapeStyle)
        case foregroundKeyColor(base: AnyShapeStyle)
        case implicit
        case `default`
        
        func resolve(in environment: EnvironmentValues, with options: Text.ResolveOptions, properties: inout Text.ResolvedProperties, includeDefaultAttributes: Bool) -> Color.ResolvedHDR? {
            assertUnimplemented()
        }
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

package struct AccessibilitySpeechAttributes {
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

extension Text {
    struct WriteTextTrait : Rule {
        @OptionalAttribute var traits: ViewTraitCollection?
        
        var value: ViewTraitCollection {
            assertUnimplemented()
        }
    }
    
    fileprivate static func makeCommonAttributes(view: _GraphValue<Text>, inputs: _ViewInputs) -> _ViewOutputs {
        if !inputs[ShouldAttachScrollEdgeEffectTag.self] || inputs[UsingGraphicsRenderer.self] {
            // <+68>
            return self.makeTextAttributes(view: view, inputs: inputs)
        } else {
            // <+148>
            let outputs = PlatformScrollEdgeEffectTagDefinition.apply(inputs: inputs) { _, inputs in
                // $s7SwiftUI4TextV20makeCommonAttributes33_641995D812913A47B866B20B88782376LL4view6inputsAA12_ViewOutputsVAA11_GraphValueVyACG_AA01_N6InputsVtFZAiA01_P0V_ANtcfU_TA
                return self.makeTextAttributes(view: view, inputs: inputs)
            }
            
            return outputs ?? self.makeTextAttributes(view: view, inputs: inputs)
        }
    }
    
    fileprivate static func makeTextAttributes(view: _GraphValue<Text>, inputs: _ViewInputs) -> _ViewOutputs {
        let selection: Bool
        if !inputs[TextAllowsSelection.self] {
            selection = false
        } else {
            selection = !inputs[TextSelectionForbidden.self]
        }
        
        let renderer = inputs[TextRendererInput.self]
        let archiveOptions = inputs[ArchivedViewInput.self]
        var features: ResolvedProperties.Features
        
        if archiveOptions.flags.contains(.isArchived) {
            features = []
        } else {
            features = [.useTextSuffix]
        }
        
        if renderer.attribute != nil {
            features.formUnion([.customRenderer, .produceTextLayout])
        } else {
            if inputs.preferences.contains(Text.LayoutKey.self) {
                features.formUnion([.produceTextLayout])
            }
        }
        
        if inputs[PreferTextLayoutManagerInput.self] {
            features.formUnion([.useTextLayoutManager])
        }
        
        var copy = inputs
        let variantThatFits = inputs[VariantThatFitsFlag.self]
        let resolvedText: Attribute<ResolvedStyledText>
        let layoutComputer: Attribute<LayoutComputer>?
        
        if variantThatFits {
            // <+1576>
            let filter = SizeFittingTextFilter(
                size: inputs.size,
                text: view.value,
                environment: inputs.environment,
                time: inputs.time,
                referenceDate: inputs[ReferenceDateInput.self],
                includeDefaultAttributes: true,
                allowsKeyColors: true,
                archiveOptions: inputs[ArchivedViewInput.self],
                features: features,
                attachmentsAsAuxiliaryMetadata: inputs.hasWidgetMetadata,
                idiom: inputs.base.interfaceIdiom
            )
            
            resolvedText = Attribute(filter)
            
            layoutComputer = Attribute(
                SizeFittingTextLayoutComputer(
                    text: view.value,
                    environment: inputs.environment,
                    renderer: renderer,
                    cache: filter.cache
                )
            )
            
            copy.base.options.subtract(.viewRequestsLayoutComputer)
        } else {
            // <+500>
            let helper = ResolvedTextHelper(
                time: inputs.time,
                referenceDate: inputs[ReferenceDateInput.self],
                includeDefaultAttributes: true,
                allowsKeyColors: true,
                archiveOptions: archiveOptions,
                features: features,
                attachmentsAsAuxiliaryMetadata: inputs.hasWidgetMetadata,
                allowsAccessibilityAttributes: false,
                idiom: inputs[InterfaceIdiomInput.self] ?? AnyInterfaceIdiom(idiom: .phone),
                tracker: PropertyList.Tracker(),
                lastText: nil,
                nextUpdate: .time(.zero),
                sizeVariant: TextSizeVariant(rawValue: 0)
            )
            
            resolvedText = Attribute(
                ResolvedTextFilter(
                    text: view.value,
                    environment: inputs.environment,
                    helper: helper
                )
            )
            
            layoutComputer = nil
        }
        
        // <+1144>
        copy.base.options.formUnion(.doNotScrape)
        var outputs: _ViewOutputs
        
        if selection {
            // <+1160>
            if let textSelectionRepresentation = inputs.textSelectionRepresentation {
                // <+1172>
                let isScrapeable: Bool
                
                if inputs.base.options.contains(.viewNeedsGeometry) {
                    // <+1184>
                    if inputs.preferences.contains(DisplayList.Key.self) {
                        // <+1200>
                        isScrapeable = !inputs.base.options.contains(.doNotScrape)
                        // <+1312>
                    } else {
                        // <+1308>
                        isScrapeable = false
                        // <+1312>
                    }
                } else {
                    // <+1308>
                    isScrapeable = false
                    // <+1312>
                }
                
                outputs = textSelectionRepresentation.makeSelectableText(
                    resolvedText: resolvedText,
                    view: view.value,
                    inputs: copy,
                    isScrapeable: isScrapeable
                )
                
                // <+1372>
            } else {
                // <+1348>
                outputs = _ViewOutputs()
                // <+1372>
            }
        } else {
            // <+1212>
            let textAccessibilityProvider = inputs.textAccessibilityProvider
            let isScrapeable: Bool
            
            if inputs.base.options.contains(.viewNeedsGeometry) {
                // <+1232>
                if inputs.preferences.contains(DisplayList.Key.self) {
                    // <+1248>
                    isScrapeable = !inputs.base.options.contains(.doNotScrape)
                } else {
                    // <+1260>
                    isScrapeable = false
                }
            } else {
                // <+1260>
                isScrapeable = false
            }
            
            outputs = self.makeTextChildQuery(
                textAccessibilityProvider,
                styledText: resolvedText,
                view: view.value,
                renderer: renderer,
                inputs: copy,
                isScrapeable: isScrapeable
            )
        }
        
        // <+1372>
        if let textAlwaysOnProvider = inputs.base.textAlwaysOnProvider {
            textAlwaysOnProvider.makeAlwaysOn(
                inputs: inputs,
                schedule: Attribute(
                    Map(resolvedText) { text in
                        return text.storage?.updateSchedule
                    }
                ), // $s7SwiftUI4TextV04makeC10Attributes33_641995D812913A47B866B20B88782376LL4view6inputsAA12_ViewOutputsVAA11_GraphValueVyACG_AA01_M6InputsVtFZ09AttributeO00R0VyAA16TimelineSchedule_pSgGyXEfu0_TA
                outputs: &outputs
            )
        }
        
        // <+1492>
        if variantThatFits {
            outputs.layoutComputer = layoutComputer
        }
        
        return outputs
    }
    
    fileprivate static func makeTextChildQuery<T : TextAccessibilityProvider>(
        _: T.Type,
        styledText: Attribute<ResolvedStyledText>,
        view: Attribute<Text>,
        renderer: WeakAttribute<TextRendererBoxBase>,
        inputs: _ViewInputs,
        isScrapeable: Bool
    ) -> _ViewOutputs {
        let query = Attribute(
            TextChildQuery<T>(
                resolvedText: styledText,
                unresolvedText: view,
                renderer: renderer,
                environment: inputs.environment,
                position: inputs.position,
                size: inputs.size,
                transform: inputs.transform,
                parentID: inputs.scrapeableParentID
            )
        )
        
        if isScrapeable {
            query.flags = [.unknown3]
        }
        
        return TextChildQuery<T>.Value.makeDebuggableView(view: _GraphValue(query), inputs: inputs)
    }
    
    fileprivate struct MakeRepresentableContext : AsyncAttribute, Rule {
        @Attribute private(set) var text: ResolvedStyledText
        @WeakAttribute var referenceDate: Date??
        @Attribute private(set) var environment: EnvironmentValues
        
        var value: PlatformTextRepresentableContext {
            assertUnimplemented()
        }
    }
}

package struct TextLayoutProperties {
    // TODO
}

extension TextLayoutProperties {
    fileprivate struct Key {
        // TODO
    }
}

fileprivate struct ResolvedTextFilter : AsyncAttribute, StatefulRule {
    @Attribute private(set) var text: Text
    @Attribute private(set) var environment: EnvironmentValues
    private(set) var helper: ResolvedTextHelper
    
    static var flags: AnyAttribute.TypeFlags {
        return [.unknown5]
    }
    
    typealias Value = ResolvedStyledText
    
    func updateValue() {
        let (text, textChanged) = self.$text.changedValue(options: [])
        let (environment, environmentChanged) = self.$environment.changedValue(options: [])
        
        let flag: Bool
        if self.hasValue {
            // <+168>
            if textChanged && !(self.helper.lastText == text) {
                // <+864>
                flag = true
            } else {
                // <+196>
                if environmentChanged && self.helper.tracker.hasDifferentUsedValues(environment.plist) {
                    // <+836>
                    // <+864>
                    flag = true
                } else {
                    // <+260>
                    if let d8 = self.helper.nextUpdate.time() {
                        // <+488>
                        let d9 = self.helper.time
                        
                        if !(d9 < d8) {
                            // <+864>
                            flag = true
                        } else {
                            // <+996>
                            flag = false
                        }
                    } else {
                        // <+996>
                        flag = false
                    }
                }
            }
        } else {
            // <+324>
            // <+864>
            flag = true
        }
        
        if flag {
            self.value = self.helper.resolve(text, with: environment, sizeFitting: false)!
        }
        
        // <+996>
        if let d8 = self.helper.nextUpdate.time() {
            var d0 = self.helper.time
            
            if !(d0 < d8) {
                // <+1216>
            } else {
                // <+1084>
                let graph = ViewGraph.current
                d0 = graph.nextUpdate.views.time
                
                if !(d8 < d0) {
                    // <+1204>
                } else {
                    graph.nextUpdate.views.time = d8
                    // <+1256>
                }
            }
        } else {
            // <+1216>
        }
        
        // <+1256>
    }
}

struct ResolvedTextHelper : SizeFittingTextResolver {
    @Attribute private(set) var time: Time // 0x0
    @WeakAttribute var referenceDate: Date?? // 0x4
    let includeDefaultAttributes: Bool // 0xc
    let allowsKeyColors: Bool // 0xd
    let archiveOptions: ArchivedViewInput.Value // 0xe
    let features: Text.ResolvedProperties.Features // 0x10
    let attachmentsAsAuxiliaryMetadata: Bool // 0x12
    let allowsAccessibilityAttributes: Bool // 0x13
    let idiom: AnyInterfaceIdiom // 0x18
    let tracker: PropertyList.Tracker // 0x28
    private(set) var lastText: Text? // 0x30
    private(set) var nextUpdate: ResolvedTextHelper.NextUpdate // 0x50 (offset field : 0x3c)
    private(set) var sizeVariant: TextSizeVariant // 0x78 (offset field : 0x40)
    
    typealias Input = (text: Text?, env: EnvironmentValues, renderer: TextRendererBoxBase?)
    typealias Engine = StyledTextLayoutEngine
    
    func shouldUpdate(for input: Self.Input, inputChanged: Bool) -> Bool {
        assertUnimplemented()
    }
    
    func value(for input: Self.Input) -> SizeFittingTextCacheValue<Self.Engine> {
        assertUnimplemented()
    }
    
    var narrowerVariant: Self {
        assertUnimplemented()
    }
    
    func layoutPriority() -> Double {
        assertUnimplemented()
    }
    
    func ignoresAutomaticPadding() -> Bool {
        assertUnimplemented()
    }
    
    func requiresSpacingProjection() -> Bool {
        assertUnimplemented()
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        assertUnimplemented()
    }
    
    func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat {
        assertUnimplemented()
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        assertUnimplemented()
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    func childPlacement(at viewSize: ViewSize) -> _Placement {
        assertUnimplemented()
    }
    
    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        assertUnimplemented()
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func requiresTrueDepthLayout() -> Bool {
        assertUnimplemented()
    }
    
    var debugContentDescription: String? {
        assertUnimplemented()
    }
    
    func resolve(_: Text?, with: EnvironmentValues, sizeFitting: Bool) -> ResolvedStyledText? {
        assertUnimplemented()
    }
}

extension ResolvedTextHelper {
    enum NextUpdate {
        case time(Time)
        case recipe(lastTime: Time, SwiftDate: Date, reduceFrequency: Bool, resolved: ResolvedStyledText)
        case none
        
        func time() -> Time? {
            assertUnimplemented()
        }
    }
}

protocol SizeFittingTextResolver : LayoutEngine {
    associatedtype Input
    associatedtype Engine
    
    func shouldUpdate(for input: Self.Input, inputChanged: Bool) -> Bool
    func value(for input: Self.Input) -> SizeFittingTextCacheValue<Self.Engine>
    var narrowerVariant: Self { get }
}

struct SizeFittingTextCacheValue<T> {
    var text: ResolvedStyledText
    var engine: T
    var renderer: TextRendererBoxBase?
}

struct StyledTextLayoutEngine {
    private var text: ResolvedStyledText
    private var renderer: TextRendererBoxBase?
}

struct TextRendererInput : ViewInput {
    static var defaultValue: WeakAttribute<TextRendererBoxBase> {
        return WeakAttribute()
    }
}

fileprivate struct TextChildQuery<T : TextAccessibilityProvider> : ScrapeableAttribute, AsyncAttribute, Rule {
    static func scrapeContent(from attribute: AnyAttribute) -> ScrapeableContent.Item? {
        assertUnimplemented()
    }
    
    @Attribute private(set) var resolvedText: ResolvedStyledText
    @Attribute private(set) var unresolvedText: Text
    @WeakAttribute var renderer: TextRendererBoxBase?
    @Attribute private(set) var environment: EnvironmentValues
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var transform: ViewTransform
    let parentID: ScrapeableID
    
    var value: some View {
        let resolvedText = self.resolvedText
        let unresolvedText = self.unresolvedText
        let renderer = self.renderer
        
        let needsDrawingGroup: Bool
        if self.renderer != nil {
            needsDrawingGroup = self.environment.textRendererAddsDrawingGroup
        } else {
            needsDrawingGroup = false
        }
        
        let contentView = AccessibilityStyledTextContentView<T>(
            text: resolvedText,
            unresolvedText: unresolvedText,
            renderer: renderer,
            needsDrawingGroup: needsDrawingGroup
        )
        
        return contentView.body
    }
}
