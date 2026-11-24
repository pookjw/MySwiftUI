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
    
    private var storage: ContentTransition.Storage
    private var isReplaceable: Bool
    
    init(storage: ContentTransition.Storage) {
        self.storage = storage
        self.isReplaceable = false
    }
}

extension ContentTransition {
    enum Storage {
        case named(ContentTransition.NamedTransition)
        case custom(ContentTransition.CustomTransition)
        case symbolReplace(_SymbolEffect.ReplaceConfiguration)
    }
    
    struct NamedTransition {
        private var name: ContentTransition.NamedTransition.Name
        private var layoutDirection: LayoutDirection?
        private var style: ContentTransition.Style?
        
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
    
    struct NumericTextConfiguration {
        // TODO
    }
    
    struct CustomTransition {
        // TODO
    }
    
    struct Style {
        private var storage: ContentTransition.Style.Storage
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
    
    package struct State {
        private(set) var transition: ContentTransition
        private var style: ContentTransition.Style
        private var animation: Animation?
        private(set) var options: ContentTransition.Options
    }
}

extension ContentTransition.Style {
    enum Storage {
        case `default`
        case sessionWidget
        case animatedWidget
    }
}

extension ContentTransition.NamedTransition {
    enum Name {
        case text(different: Bool)
        case numericText(ContentTransition.NumericTextConfiguration)
        case `default`
        case identity
        case opacity
        case diff
        case fadeIfDifferent
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
