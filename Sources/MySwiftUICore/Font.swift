// 3D5D82E35921924EBCD40D1BFB222CC3
public import CoreText

@frozen public struct Font : Hashable, Sendable {
    @_hasStorage internal private(set) var provider: AnyFontBox
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public static func == (lhs: Font, rhs: Font) -> Bool {
        assertUnimplemented()
    }
    
    func platformFont(in context: Font.Context) -> CTFont {
        var context = context
        context.fontModifiers = []
        
        let key = Font.Cache.Key(
            font: self,
            modifiers: [],
            context: context
        )
        
        return Font.Cache.shared.objectCache[key]
    }
}

@usableFromInline
package class AnyFontBox : @unchecked Sendable {
    var tag: Font.ProviderTag {
        preconditionFailure() // abtract
    }
    
    var provider: any FontProvider {
        preconditionFailure() // abtract
    }
    
    func resolveDescriptor(in context: Font.Context) -> CTFontDescriptor {
        preconditionFailure() // abtract
    }
    
    func resolveTraits(in context: Font.Context) -> Font.ResolvedTraits {
        preconditionFailure() // abtract
    }
    
    func isEqual(to other: AnyFontBox) -> Bool {
        preconditionFailure() // abtract
    }
    
    func hash(into hasher: inout Hasher) {
        preconditionFailure() // abtract
    }
    
    func removing<T : StaticFontModifier>(_ modifier: T.Type) -> any FontProvider {
        preconditionFailure() // abtract
    }
    
    init() {}
}

extension Font {
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
    public struct Context : Hashable, Sendable {
        private(set) var sizeCategory: ContentSizeCategory // 0x0
        private(set) var legibilityWeight: LegibilityWeight? // 0x1
        private(set) var fontDefinition: FontDefinitionType // 0x8
        private(set) var watchDisplayVariant: WatchDisplayVariant // 0x18
        private(set) var shouldRedactContent: Bool // 0x19
        private(set) var effectiveFont: Font // 0x20
        fileprivate(set) var fontModifiers: [AnyFontModifier] // 0x28
        
        public static func == (a: Font.Context, b: Font.Context) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Font.Context : CustomDebugStringConvertible {
    public var debugDescription: String {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
extension EnvironmentValues {
    public var fontResolutionContext: Font.Context {
        return self[EnvironmentValues.FontContextKey.self]
    }
    
    fileprivate struct FontContextKey : DerivedEnvironmentKey {
        static func value(in environment: EnvironmentValues) -> Font.Context {
            assertUnimplemented()
        }
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Font {
    public struct Resolved : Hashable, Sendable {
        public var ctFont: CTFont {
            assertUnimplemented()
        }
        
        public var isBold: Bool {
            assertUnimplemented()
        }
        
        public var isItalic: Bool {
            assertUnimplemented()
        }
        
        public var pointSize: CGFloat {
            assertUnimplemented()
        }
        
        public var weight: Font.Weight {
            assertUnimplemented()
        }
        
        public var width: Font.Width {
            assertUnimplemented()
        }
        
        public var leading: Font.Leading {
            assertUnimplemented()
        }
        
        public var isMonospaced: Bool {
            assertUnimplemented()
        }
        
        public var isLowercaseSmallCaps: Bool {
            assertUnimplemented()
        }
        
        public var isUppercaseSmallCaps: Bool {
            assertUnimplemented()
        }
        
        public var isSmallCaps: Bool {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    public func resolve(in context: Font.Context) -> Font.Resolved {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Font.Resolved {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public static func == (lhs: Font.Resolved, rhs: Font.Resolved) -> Bool {
        assertUnimplemented()
    }
}

extension Font {
    public static let largeTitle: Font = { assertUnimplemented() }()
    public static let title: Font = { assertUnimplemented() }()
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let title2: Font = { assertUnimplemented() }()

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let title3: Font = { assertUnimplemented() }()
    
    public static let headline: Font = { assertUnimplemented() }()
    public static let subheadline: Font = { assertUnimplemented() }()
    
    public static let body = Font(
        provider: FontBox(
            Font.TextStyleProvider(
                style: .body,
                design: nil,
                weight: nil
            )
        )
    )
    
    public static let callout: Font = { assertUnimplemented() }()
    public static let footnote: Font = { assertUnimplemented() }()
    public static let caption: Font = { assertUnimplemented() }()
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static let caption2: Font = { assertUnimplemented() }()
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let extraLargeTitle: Font = { assertUnimplemented() }()
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let extraLargeTitle2: Font = { assertUnimplemented() }()
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public static func system(_ style: Font.TextStyle, design: Font.Design? = nil, weight: Font.Weight? = nil) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `system(_:design:weight:)` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `system(_:design:weight:)` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use `system(_:design:weight:)` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use `system(_:design:weight:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use `system(_:design:weight:)` instead.")
    @_disfavoredOverload public static func system(_ style: Font.TextStyle, design: Font.Design = .default) -> Font {
        assertUnimplemented()
    }
    
    public enum TextStyle : CaseIterable, Sendable {
        case largeTitle
        case title
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case title2
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case title3
        case headline
        case subheadline
        case body
        case callout
        case footnote
        case caption
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        case caption2
        @available(visionOS 1.0, *)
        @available(iOS, unavailable)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        case extraLargeTitle
        @available(visionOS 1.0, *)
        @available(iOS, unavailable)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        case extraLargeTitle2
        
        public static let allCases: [Font.TextStyle] = { assertUnimplemented() } ()
        
        public static func == (a: Font.TextStyle, b: Font.TextStyle) -> Bool {
            assertUnimplemented()
        }
        
        public typealias AllCases = [Font.TextStyle]
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Font.TextStyle : Codable {
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Font.TextStyle {
    @_silgen_name("$s7SwiftUI4FontV9TextStyleO8allCasesSayAEGvsZ")
    @usableFromInline
    internal func _setTextStyleAllCases(_ allCases: [Font.TextStyle]) {
        assertUnimplemented()
    }
}

extension Font {
    public func italic() -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func italic(_ isActive: Bool) -> Font {
        assertUnimplemented()
    }
    
    public func smallCaps() -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func smallCaps(_ isActive: Bool) -> Font {
        assertUnimplemented()
    }
    
    public func lowercaseSmallCaps() -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func lowercaseSmallCaps(_ isActive: Bool) -> Font {
        assertUnimplemented()
    }
    
    public func uppercaseSmallCaps() -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func uppercaseSmallCaps(_ isActive: Bool) -> Font {
        assertUnimplemented()
    }
    
    public func monospacedDigit() -> Font {
        assertUnimplemented()
    }
    
    public func weight(_ weight: Font.Weight) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public func width(_ width: Font.Width) -> Font {
        assertUnimplemented()
    }
    
    public func bold() -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func bold(_ isActive: Bool) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func monospaced() -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func monospaced(_ isActive: Bool) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public func leading(_ leading: Font.Leading) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 14.0, deprecated: 14.0, renamed: "leading")
    @available(macOS, introduced: 11.0, deprecated: 11.0, renamed: "leading")
    @available(tvOS, introduced: 14.0, deprecated: 14.0, renamed: "leading")
    @available(watchOS, introduced: 7.0, deprecated: 7.0, renamed: "leading")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "leading")
    public func _leading(_ leading: Font._Leading) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func pointSize(_ size: CGFloat) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public func scaled(by factor: CGFloat) -> Font {
        assertUnimplemented()
    }
    
    public func _stylisticAlternative(_ alternative: Font._StylisticAlternative) -> Font {
        assertUnimplemented()
    }
    
    @frozen public struct Weight : Hashable {
        package var value: CGFloat
        
        public static let ultraLight: Font.Weight = { assertUnimplemented() }()
        public static let thin: Font.Weight = { assertUnimplemented() }()
        public static let light: Font.Weight = { assertUnimplemented() }()
        public static let regular: Font.Weight = { assertUnimplemented() }()
        public static let medium: Font.Weight = { assertUnimplemented() }()
        public static let semibold: Font.Weight = { assertUnimplemented() }()
        public static let bold: Font.Weight = { assertUnimplemented() }()
        public static let heavy: Font.Weight = { assertUnimplemented() }()
        public static let black: Font.Weight = { assertUnimplemented() }()
        
        public static func == (a: Font.Weight, b: Font.Weight) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public struct Width : Hashable, Sendable {
        public var value: CGFloat
        
        public static let compressed: Font.Width = { assertUnimplemented() }()
        public static let condensed: Font.Width = { assertUnimplemented() }()
        public static let standard: Font.Width = { assertUnimplemented() }()
        public static let expanded: Font.Width = { assertUnimplemented() }()
        
        public init(_ value: CGFloat) {
            assertUnimplemented()
        }
        
        public static func == (a: Font.Width, b: Font.Width) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    public enum _StylisticAlternative : Int, Hashable {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case eleven
        case twelve
        case thirteen
        case fourteen
        case fifteen
        case sixteen
        case seventeen
        case eighteen
        case nineteen
        case twenty
        
        public init?(rawValue: Int) {
            assertUnimplemented()
        }
        
        public typealias RawValue = Int
        
        public var rawValue: Int {
            assertUnimplemented()
        }
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public enum Leading : Sendable {
        case standard
        case tight
        case loose
        
        public static func == (a: Font.Leading, b: Font.Leading) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    public enum _Leading : Hashable {
        case tight
        case loose
        case standard
        
        public static func == (a: Font._Leading, b: Font._Leading) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

@available(*, unavailable)
extension Font._Leading : Sendable {
}

@available(*, unavailable)
extension Font._StylisticAlternative : Sendable {
}

extension Font {
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public static var `default`: Font {
        assertUnimplemented()
    }
}

extension Font {
    public static func custom(_ name: String, size: CGFloat) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func custom(_ name: String, size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        assertUnimplemented()
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
        assertUnimplemented()
    }
}

extension Font {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public static func system(size: CGFloat, weight: Font.Weight? = nil, design: Font.Design? = nil) -> Font {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use `system(size:weight:design:)` instead.")
    @_disfavoredOverload public static func system(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
        assertUnimplemented()
    }
    
    public enum Design : Hashable, Sendable {
        case `default`
        @available(watchOS 7.0, *)
        case serif
        case rounded
        @available(watchOS 7.0, *)
        case monospaced
        
        public static func == (a: Font.Design, b: Font.Design) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

extension Font.Weight : Sendable {}
extension Font.Weight : BitwiseCopyable {}
extension Font.TextStyle : Equatable {}
extension Font.TextStyle : Hashable {}
extension Font._StylisticAlternative : RawRepresentable {}
extension Font.Leading : Equatable {}
extension Font.Leading : Hashable {}

extension Font {
    fileprivate struct Cache {
        static let shared = Font.Cache()
        
        let objectCache = ObjectCache<Font.Cache.Key, CTFont> { key in
            // $s7SwiftUI4FontV0C5Cache33_3D5D82E35921924EBCD40D1BFB222CC3LLV6sharedAA06ObjectD0CyAF3KeyVSo9CTFontRefaGvpZfiAmKcfU_
            // sp + 0x70
            let copy_1 = key.context
            // sp + 0x30
            let copy_2 = key.context
            
            var descriptor = key.font.provider.resolveDescriptor(in: copy_2)
            
            for modifier in key.modifiers {
                modifier.modify(descriptor: &descriptor, in: copy_2)
            }
            
            return CTFontCreateWithFontDescriptor(descriptor, 0, nil)
        }
    }
}

extension Font.Cache {
    fileprivate struct Key : Hashable {
        static func == (lhs: Font.Cache.Key, rhs: Font.Cache.Key) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        private(set) var font: Font // 0x0
        private(set) var modifiers: [AnyFontModifier] // 0x8
        private(set) var context: Font.Context // 0x10
    }
}

struct FontDefinitionType : @unchecked Sendable {
    private var base: any FontDefinition.Type
}

protocol FontDefinition {
    // TODO
}

extension Font {
    enum ProviderTag {
        // TODO
    }
    
    struct ResolvedTraits {
        private var pointSize: CGFloat
        private var weight: CGFloat
        private var width: CGFloat?
    }
    
    struct TextStyleProvider : CodableByProxy, FontProvider {
        fileprivate private(set) var style: Font.TextStyle
        fileprivate private(set) var design: Font.Design?
        fileprivate private(set) var weight: Font.Weight?
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: any Decoder) throws -> Font.TextStyleProvider {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: Font.TextStyleProvider, rhs: Font.TextStyleProvider) -> Bool {
            assertUnimplemented()
        }
    }
    
    struct PrivateTextStyleProvider {
        // TODO
    }
}

protocol FontProvider : Hashable, Serializable {
    // TODO
}

final class FontBox<T : FontProvider> : AnyFontBox, @unchecked Sendable {
    private let base: T
    
    init(_ base: T) {
        self.base = base
        super.init()
    }
    
    override var tag: Font.ProviderTag {
        assertUnimplemented()
    }
    
    override var provider: any FontProvider {
        assertUnimplemented()
    }
    
    override func resolveDescriptor(in context: Font.Context) -> CTFontDescriptor {
        assertUnimplemented()
    }
    
    override func resolveTraits(in context: Font.Context) -> Font.ResolvedTraits {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyFontBox) -> Bool {
        assertUnimplemented()
    }
    
    override func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    override func removing<U>(_ modifier: U.Type) -> any FontProvider where U : StaticFontModifier {
        assertUnimplemented()
    }
}

extension FontBox : Serializable {
    func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    static func deserialize(from decoder: any Decoder) throws -> Self {
        assertUnimplemented()
    }
}
