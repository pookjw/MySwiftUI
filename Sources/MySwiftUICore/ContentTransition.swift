// 91D8F0C7DA490950AB41112E50631DCA
internal import CoreGraphics
internal import AttributeGraph

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct ContentTransition : Equatable, Sendable {
    public static func == (lhs: ContentTransition, rhs: ContentTransition) -> Bool {
        assertUnimplemented()
    }
    
    public static let identity: ContentTransition = {
        assertUnimplemented()
    }()
    
    public static let opacity: ContentTransition = {
        assertUnimplemented()
    }()
    
    public static let interpolate: ContentTransition = {
        assertUnimplemented()
    }()
    
    public static func numericText(countsDown: Bool = false) -> ContentTransition {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public static func numericText(value: Double) -> ContentTransition {
        assertUnimplemented()
    }
    
    static let `default`: ContentTransition = {
        assertUnimplemented()
    }()
    
    private(set) var storage: ContentTransition.Storage // 0x0
    var isReplaceable: Bool // 0xe
    
    init(storage: ContentTransition.Storage) {
        self.storage = storage
        self.isReplaceable = false
    }
    
    mutating func applyEnvironmentValues(style: ContentTransition.Style, layoutDirection: LayoutDirection) {
        assertUnimplemented()
    }
}

extension ContentTransition {
    enum Storage : Equatable {
        static func == (lhs: ContentTransition.Storage, rhs: ContentTransition.Storage) -> Bool {
            assertUnimplemented()
        }
        
        case named(ContentTransition.NamedTransition)
        case custom(ContentTransition.CustomTransition)
        case symbolReplace(_SymbolEffect.ReplaceConfiguration)
    }
    
    struct NamedTransition : Hashable {
        static func == (lhs: ContentTransition.NamedTransition, rhs: ContentTransition.NamedTransition) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        private(set) var name: ContentTransition.NamedTransition.Name // 0x0
        private var layoutDirection: LayoutDirection? // 0xb
        private var style: ContentTransition.Style? // 0xc
        
        init(
            name: ContentTransition.NamedTransition.Name = .default,
            layoutDirection: LayoutDirection?,
            style: ContentTransition.Style?
        ) {
            self.name = name
            self.layoutDirection = layoutDirection
            self.style = style
        }
    }
    
    struct NumericTextConfiguration : Hashable {
        static func == (lhs: ContentTransition.NumericTextConfiguration, rhs: ContentTransition.NumericTextConfiguration) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func fixed(downwards: Bool) -> ContentTransition.NumericTextConfiguration {
            return ContentTransition.NumericTextConfiguration(
                direction: .fixed(downwards: downwards),
                axis: nil,
                options: [.relativeBlur]
            )
        }
        
        static func automatic(value: Double) -> ContentTransition.NumericTextConfiguration {
            return ContentTransition.NumericTextConfiguration(
                direction: .automatic(value: Float(value)),
                axis: nil,
                options: [.relativeBlur]
            )
        }
        
        var direction: ContentTransition.NumericTextConfiguration.Direction // 0x0
        var axis: Axis? // 0x5
        var options: ContentTransition.NumericTextConfiguration.Options // 0x6
        private var _delay: UInt8 = 18 // 0x7
        private var _scale: UInt8 = 51 // 0x8
        private var _blur: UInt8 = 32 // 0x9
        private var _offset: Int8 = 19 // 0xa
        
        var delay: Float {
            get {
                return Float(self._delay) * Float(bitPattern: 0x3c088889) // 1 / 120
            }
            set {
                self._delay = UInt8(clamping: newValue * 120.0)
            }
        }
        
        var maxDurationMultiple: Float {
            return 1.25
        }
        
        var scale: Float {
            get {
                return Float(self._scale) / 128.0
            }
            set {
                self._scale = UInt8(clamping: newValue * 128.0)
            }
        }
        
        var blur: Float {
            get {
                return Float(self._blur) / 4.0
            }
            set {
                self._blur = UInt8(clamping: newValue * 4.0)
                
                if self.options.contains(.relativeBlur) {
                    self.options.subtract(.relativeBlur)
                }
            }
        }
        
        var relativeBlur: Float {
            get {
                return Float(self._blur) / 128.0
            }
            set {
                self._blur = UInt8(clamping: newValue * 128.0)
                self.options.formUnion(.relativeBlur)
            }
        }
        
        var offset: Float {
            get {
                return Float(self._offset) / 32.0
            }
            set {
                self._offset = Int8(clamping: newValue * 32.0)
            }
        }
        
        init(
            direction: ContentTransition.NumericTextConfiguration.Direction = .fixed(downwards: false),
            axis: Axis?,
            options: ContentTransition.NumericTextConfiguration.Options = [.relativeBlur]
        ) {
            self.direction = direction
            self.axis = axis
            self.options = options
        }
        
        func axis(_ axis: Axis) -> ContentTransition.NumericTextConfiguration {
            var copy = self
            copy.axis = axis
            return copy
        }
        
        func delay(_ delay: Double) -> ContentTransition.NumericTextConfiguration {
            var copy = self
            copy.delay = Float(delay)
            return copy
        }
        
        func scale(_ scale: CGFloat) -> ContentTransition.NumericTextConfiguration {
            var copy = self
            copy.scale = Float(scale)
            return copy
        }
        
        func blur(radius: CGFloat) -> ContentTransition.NumericTextConfiguration {
            var copy = self
            copy.blur = Float(radius)
            return copy
        }
        
        func relativeOffset(_ offset: CGFloat) -> ContentTransition.NumericTextConfiguration {
            var copy = self
            copy.offset = Float(offset)
            return copy
        }
        
        func reversed(_ reversed: Bool) -> ContentTransition.NumericTextConfiguration {
            var copy = self
            
            if reversed {
                copy.options.formUnion(.reversed)
            } else {
                copy.options.subtract(.reversed)
            }
            
            return copy
        }
    }
    
    struct CustomTransition : Equatable {
        static func == (lhs: ContentTransition.CustomTransition, rhs: ContentTransition.CustomTransition) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        // TODO
    }
    
    struct Style : Hashable, Codable {
        static func == (lhs: ContentTransition.Style, rhs: ContentTransition.Style) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        private var storage: ContentTransition.Style.Storage
        
        init(_ storage: ContentTransition.Style.Storage) {
            self.storage = storage
        }
    }
    
    struct Options: OptionSet {
        static var addsDrawingGroup: ContentTransition.Options {
            return ContentTransition.Options(rawValue: 1 << 0)
        }
        
        static var animatesDifferentContent: ContentTransition.Options {
            return ContentTransition.Options(rawValue: 1 << 1)
        }
        
        static var formsGroup: ContentTransition.Options {
            return ContentTransition.Options(rawValue: 1 << 2)
        }
        
        static var implicitGroup: ContentTransition.Options {
            return ContentTransition.Options(rawValue: 1 << 3)
        }
        
        static var inherited: ContentTransition.Options {
            return ContentTransition.Options(rawValue: 1 << 0)
        }
            
        let rawValue: UInt32
    }
    
    package struct State : Equatable, EnvironmentKey, ProtobufEncodableMessage, ProtobufDecodableMessage {
        package static func == (lhs: ContentTransition.State, rhs: ContentTransition.State) -> Bool {
            assertUnimplemented()
        }
        
        var transition: ContentTransition = .default // 0x0
        var style: ContentTransition.Style // 0xf
        var animation: Animation? // 0x10
        var options: ContentTransition.Options // 0x18
        
        init(
            transition: ContentTransition = .default,
            style: ContentTransition.Style = ContentTransition.Style(.default),
            animation: Animation?,
            options: ContentTransition.Options = []
        ) {
            self.transition = transition
            self.style = style
            self.animation = animation
            self.options = options
        }
        
        package init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
        
        package func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        package static let defaultValue = ContentTransition.State(
            transition: .default,
            style: ContentTransition.Style(.default),
            animation: nil,
            options: []
        )
    }
}

extension ContentTransition.Style {
    enum Storage : Hashable {
        case `default`
        case sessionWidget
        case animatedWidget
    }
}

extension ContentTransition.NamedTransition {
    enum Name : Hashable {
        static func == (lhs: ContentTransition.NamedTransition.Name, rhs: ContentTransition.NamedTransition.Name) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        case text(different: Bool)
        case numericText(ContentTransition.NumericTextConfiguration)
        case `default`
        case identity
        case opacity
        case diff
        case fadeIfDifferent
    }
}

extension ContentTransition.NumericTextConfiguration {
    enum Direction : Hashable {
        case fixed(downwards: Bool)
        case automatic(value: Float)
    }
    
    struct Options : OptionSet, Hashable {
        static var reversed: ContentTransition.NumericTextConfiguration.Options {
            return ContentTransition.NumericTextConfiguration.Options(rawValue: 1 << 0)
        }
        
        static var relativeBlur: ContentTransition.NumericTextConfiguration.Options {
            return ContentTransition.NumericTextConfiguration.Options(rawValue: 1 << 1)
        }
        
        let rawValue: UInt8
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension View {
    @_alwaysEmitIntoClient nonisolated public func contentTransition(_ transition: ContentTransition) -> some View {
        return environment(\.contentTransition, transition)
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension EnvironmentValues {
    public var contentTransition: ContentTransition {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var contentTransitionAddsDrawingGroup: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

struct ContentTransitionEffect : _RendererEffect {
    nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
        assertUnimplemented()
    }
    
    nonisolated static var isolatesChildPosition: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var disabledForFlattenedContent: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var preservesEmptyContent: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var isScrapeable: Bool {
        assertUnimplemented()
    }
    
    // TODO
}

struct _ContentTransitionModifier : MultiViewModifier, PrimitiveViewModifier {
    // TODO
}

struct _ContentTransitionGroup : MultiViewModifier, PrimitiveViewModifier {
    // TODO
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct _Transition_ContentTransition {
    // TODO
}

@available(*, unavailable)
extension _Transition_ContentTransition : Sendable {
}

extension ContentTransitionEffect {
    struct Init : AsyncAttribute, Rule {
        @Attribute private(set) var environment: EnvironmentValues
        private(set) var defaultTransition: ContentTransition
        
        var value: ContentTransitionEffect {
            assertUnimplemented()
        }
    }
}
