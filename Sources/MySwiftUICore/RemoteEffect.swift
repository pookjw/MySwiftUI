// 3E16A233DDB220D680CDDD5BF460B837
internal import CoreGraphics

enum RemoteEffectInfo {
    case group(RemoteEffectGroupInfo)
    //    case property(RemotePropertyEffectInfo)
    //    case external(RemoteExternalEffectInfo)
    //    case glowEffect(RemoteGlowEffect)
    
    var localIdentifier: String {
        assertUnimplemented()
    }
}

extension RemoteEffectInfo {
    struct Properties : Equatable {
        private var activationBehavior: ActivationBehavior?
        private var activationHoverDelay: Double?
        private var activationIdleDelay: Double?
        private var allowedInputTypes: Set<InputType>?
        private var dwellHoverDuration: Double?
        private var dwellIdleDuration: Double?
        private var localIdentifier: String?
        
        static var empty: Properties {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectInfo.Properties, rhs: RemoteEffectInfo.Properties) -> Bool {
            assertUnimplemented()
        }
    }
    
    enum ActivationBehavior : Equatable {
        case `default`
        case active(UInt32?)
        case inactive(UInt32?)
        case toggled(UInt32?, Int?)
        case activeTemporarily(UInt32?, Int?)
        case inactiveTemporarily(UInt32?, Int?)
        case toggledTemporarily(UInt32?, Int?)
        
        static func == (lhs: RemoteEffectInfo.ActivationBehavior, rhs: RemoteEffectInfo.ActivationBehavior) -> Bool {
            assertUnimplemented()
        }
    }
    
    enum InputType : Hashable {
        case gaze
        case pointer
        case directTouch
        case phaseOverride
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectInfo.InputType, rhs: RemoteEffectInfo.InputType) -> Bool {
            assertUnimplemented()
        }
    }
}

struct RemoteEffectGroupInfo {
    private var effects: [RemoteEffectInfo]
    private var properties: RemoteEffectGroupInfo.Properties
}

extension RemoteEffectGroupInfo {
    struct Properties {
        private var base: RemoteEffectInfo.Properties
        private var accessibilityID: Int?
        private var groupID: RemoteEffectGroupInfo.ID
        private var isMatched: Bool
        private var isSource: Bool
        private var sourceBehavior: RemoteEffectGroupInfo.SourceBehavior?
        private var isFrozen: Bool
        private var namespaceScope: RemoteEffectGroupInfo.NamespaceScope
        private var exclusiveHitTestNamespace: RemoteEffectGroupInfo.ExclusiveHitTestNamespace?
        private var hitTestMode: RemoteEffectGroupInfo.HitTestMode?
    }
    
    enum ID : Hashable {
        case namespace(Namespace.ID)
        case custom(String)
        case implicit(_DisplayList_Identity)
        case named(Namespace.ID, String)
        case view(Namespace.ID)
        case none
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectGroupInfo.ID, rhs: RemoteEffectGroupInfo.ID) -> Bool {
            assertUnimplemented()
        }
    }
    
    enum ExclusiveHitTestNamespace : Hashable {
        case `default`
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectGroupInfo.ExclusiveHitTestNamespace, rhs: RemoteEffectGroupInfo.ExclusiveHitTestNamespace) -> Bool {
            assertUnimplemented()
        }
    }
    
    enum HitTestMode : Hashable {
        case rayPlaneIntersection
        case rightHandGesture
        case leftHandGesture
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectGroupInfo.HitTestMode, rhs: RemoteEffectGroupInfo.HitTestMode) -> Bool {
            assertUnimplemented()
        }
    }
    
    enum SourceBehavior : Hashable {
        case preservesGroup
        case onlyTriggersGroup
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectGroupInfo.SourceBehavior, rhs: RemoteEffectGroupInfo.SourceBehavior) -> Bool {
            assertUnimplemented()
        }
    }
    
    enum NamespaceScope : Hashable {
        case scene(String)
        case local
        case global
        
        var usesRenderServerGlobalNamespace: Bool {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectGroupInfo.NamespaceScope, rhs: RemoteEffectGroupInfo.NamespaceScope) -> Bool {
            assertUnimplemented()
        }
    }
}

struct RemoteEffectsPlatformState {
    var legacyEffects: [_DisplayList_Identity: RemoteEffectGroup.Resolved] = [:]
    var hoverEffectState = HoverEffectState()
    
    var values: [RemoteEffectGroupInfo.ID: RemoteEffectGroupInfo] {
        /*
         legacyEffects -> x0 -> x21
         hoverEffectState -> x1/x2 -> sp + 0x8
         */
        let results: [RemoteEffectGroupInfo.ID: RemoteEffectGroupInfo] = [:]
        
        for (_, _) in self.legacyEffects {
            assertUnimplemented()
        }
        
        // <+2060>
        for _ in self.hoverEffectState.groups {
            assertUnimplemented()
        }
        
        // <+2320>
        for _ in self.hoverEffectState.leafEffects {
            assertUnimplemented()
        }
        
        // <+2956>
        return results
    }
    
    mutating func reset(hasRecursiveValues: inout Bool) {
        assertUnimplemented()
    }
}

package struct RemoteEffectGroup {
    var effects: [any RemoteEffect]
    var accessibilityOptions: RemoteEffectAccessibilityOptions
    var properties: RemoteEffectGroup.Properties
    
    init(effects: [any RemoteEffect], accessibilityOptions: RemoteEffectAccessibilityOptions, properties: RemoteEffectGroup.Properties) {
        assertUnimplemented()
    }
    
    var shouldAttachToAccessibilityTree: Bool {
        assertUnimplemented()
    }
}

extension RemoteEffectGroup {
    package struct Resolved {
        var effects: [RemoteEffectEntry] // 0x0
        var accessibilityID: Int? // 0x8
        var properties: RemoteEffectGroup.Properties // 0x18
        
        init(effects: [RemoteEffectEntry], accessibilityID: Int?, properties: RemoteEffectGroup.Properties) {
            assertUnimplemented()
        }
        
        var remoteEffectInfo: RemoteEffectGroupInfo {
            assertUnimplemented()
        }
    }
    
    struct Properties : Equatable {
        var groupID: RemoteEffectGroupInfo.ID // 0x0
        var blendFactor: Double // 0x20
        var options: RemoteEffectOptions // 0x28
        
        init(groupID: RemoteEffectGroupInfo.ID, blendFactor: Double, options: RemoteEffectOptions) {
            assertUnimplemented()
        }
        
        func remoteEffectInfo(accessibilityID: Int?) -> RemoteEffectGroupInfo.Properties {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectGroup.Properties, rhs: RemoteEffectGroup.Properties) -> Bool {
            assertUnimplemented()
        }
    }
}

protocol RemoteEffect {
    // TODO
}

struct RemoteEffectAccessibilityOptions : Equatable {
    private var accessibilityID: Namespace.ID
    private var attachmentBehavior: AttachmentBehavior
    
    init(accessibilityID: Namespace.ID, attachmentBehavior: AttachmentBehavior = .automatic) {
        assertUnimplemented()
    }
    
    var resolvedAccessibilityID: Int {
        assertUnimplemented()
    }
    
    static func == (lhs: RemoteEffectAccessibilityOptions, rhs: RemoteEffectAccessibilityOptions) -> Bool {
        assertUnimplemented()
    }
    
    enum AttachmentBehavior : Hashable {
        case automatic
        case always
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectAccessibilityOptions.AttachmentBehavior, rhs: RemoteEffectAccessibilityOptions.AttachmentBehavior) -> Bool {
            assertUnimplemented()
        }
    }
}

enum RemoteEffectEntry : Identifiable {
    //    case property(RemotePropertyEffect)
    //    case external(RemoteExternalEffectInfo)
    //    case glowEffect(RemoteGlowEffect)
    
    var id: String {
        assertUnimplemented()
    }
    
    var remoteEffectInfo: RemoteEffectInfo {
        assertUnimplemented()
    }
}

struct RemoteEffectOptions : Equatable {
    private var applyInPlace: Bool
    private var overrideState: RemoteEffectState?
    private var dwellHover: Bool
    private var dwellIdle: Bool
    private var isFrozen: Bool
    private var namespaceScope: RemoteEffectNamespaceScope
    private var allowedTouchTypes: Set<TouchType>?
    
    init(applyInPlace: Bool) {
        assertUnimplemented()
    }
    
    init(applyInPlace: Bool, overrideState: RemoteEffectState?, dwellHover: Bool, dwellIdle: Bool) {
        assertUnimplemented()
    }
    
    init(applyInPlace: Bool, overrideState: RemoteEffectState?, dwellHover: RemoteEffectDwellDelay, dwellIdle: RemoteEffectDwellDelay) {
        assertUnimplemented()
    }
    
    init(applyInPlace: Bool, overrideState: RemoteEffectState?, dwellHover: RemoteEffectDwellDelay, dwellIdle: RemoteEffectDwellDelay, namespaceScope: RemoteEffectNamespaceScope) {
        assertUnimplemented()
    }
    
    init(applyInPlace: Bool, overrideState: RemoteEffectState?, dwellHover: RemoteEffectDwellDelay, dwellIdle: RemoteEffectDwellDelay, namespaceScope: RemoteEffectNamespaceScope, allowedTouchTypes: Set<TouchType>?) {
        assertUnimplemented()
    }
    
    init(applyInPlace: Bool, overrideState: RemoteEffectState?, dwellHover: RemoteEffectDwellDelay, dwellIdle: RemoteEffectDwellDelay, namespaceScope: RemoteEffectNamespaceScope, allowedTouchTypes: Set<TouchType>?, hitTestProperties: HitTestProperties?) {
        assertUnimplemented()
    }
    
    init(applyInPlace: Bool, overrideState: RemoteEffectState?, isFrozen: Bool, dwellHover: RemoteEffectDwellDelay, dwellIdle: RemoteEffectDwellDelay, namespaceScope: RemoteEffectNamespaceScope, allowedTouchTypes: Set<TouchType>?, hitTestProperties: HitTestProperties?) {
        assertUnimplemented()
    }
    
    init(applyInPlace: Bool, kind: Kind = .content, overrideState: RemoteEffectState? = nil, dwellHover: RemoteEffectDwellDelay, dwellIdle: RemoteEffectDwellDelay = .none, hitTestProperties: HitTestProperties? = nil) {
        assertUnimplemented()
    }
    
    static func == (lhs: RemoteEffectOptions, rhs: RemoteEffectOptions) -> Bool {
        assertUnimplemented()
    }
    
    enum Kind : Hashable {
        case content
        case auxiliary
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectOptions.Kind, rhs: RemoteEffectOptions.Kind) -> Bool {
            assertUnimplemented()
        }
    }
    
    struct HitTestProperties : Equatable {
        var mode: Mode
        var options: Options
        
        init(mode: Mode, opaque: Bool) {
            assertUnimplemented()
        }
        
        init(mode: Mode, options: Options) {
            assertUnimplemented()
        }
        
        static func == (lhs: RemoteEffectOptions.HitTestProperties, rhs: RemoteEffectOptions.HitTestProperties) -> Bool {
            assertUnimplemented()
        }
        
        enum Mode : Equatable {
            case `default`
            case rayPlaneIntersection
            case handGesture(Chirality)
            
            static func == (lhs: RemoteEffectOptions.HitTestProperties.Mode, rhs: RemoteEffectOptions.HitTestProperties.Mode) -> Bool {
                assertUnimplemented()
            }
            
            enum Chirality : Hashable {
                case left
                case right
                
                func hash(into hasher: inout Hasher) {
                    assertUnimplemented()
                }
                
                static func == (lhs: RemoteEffectOptions.HitTestProperties.Mode.Chirality, rhs: RemoteEffectOptions.HitTestProperties.Mode.Chirality) -> Bool {
                    assertUnimplemented()
                }
            }
        }
        
        struct Options : OptionSet, ExpressibleByArrayLiteral {
            var rawValue: UInt8
            
            init(rawValue: UInt8) {
                self.rawValue = rawValue
            }
            
            init(arrayLiteral elements: Options...) {
                assertUnimplemented()
            }
        }
    }
}

struct RemoteEffectState : Hashable {
    private var storage: RemoteEffectStateInfo
    
    static var inactive: RemoteEffectState {
        return .idle
    }
    
    static var active: RemoteEffectState {
        return .hover
    }
    
    static var idle: RemoteEffectState {
        return RemoteEffectState(storage: .idle)
    }
    
    static var hover: RemoteEffectState {
        return RemoteEffectState(storage: .hover)
    }
    
    static var perspectiveValues: RemoteEffectState {
        return RemoteEffectState(storage: .perspectiveValues)
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    static func == (lhs: RemoteEffectState, rhs: RemoteEffectState) -> Bool {
        assertUnimplemented()
    }
}

enum RemoteEffectStateInfo : Hashable {
    case idle
    case hover
    case perspectiveValues
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    static func == (lhs: RemoteEffectStateInfo, rhs: RemoteEffectStateInfo) -> Bool {
        assertUnimplemented()
    }
}

struct RemoteEffectDwellDelay : Equatable {
    enum Value {
        case none
        case short
    }
    
    // TODO: storage layout - UInt64 raw word at +0x0 (Double bit pattern when the preset
    // flag is clear, Value tag when set) + Bool preset flag byte at +0x8
    private var raw: UInt64
    private var isPreset: Bool
    
    init(_ delay: Double) {
        self.raw = delay.bitPattern
        self.isPreset = false
    }
    
    static var none: RemoteEffectDwellDelay {
        assertUnimplemented()
    }
    
    static var short: RemoteEffectDwellDelay {
        assertUnimplemented()
    }
    
    static func == (lhs: RemoteEffectDwellDelay, rhs: RemoteEffectDwellDelay) -> Bool {
        assertUnimplemented()
    }
}

struct RemoteEffectNamespaceScope : Equatable {
    // TODO: 16-byte private storage; .local is all-zero, .global is a constant
    private var storage: (UInt64, UInt64) = (0, 0)
    
    static var local: RemoteEffectNamespaceScope {
        assertUnimplemented()
    }
    
    static var global: RemoteEffectNamespaceScope {
        assertUnimplemented()
    }
    
    static func == (lhs: RemoteEffectNamespaceScope, rhs: RemoteEffectNamespaceScope) -> Bool {
        assertUnimplemented()
    }
}

enum TouchType : Hashable {
    case direct
    case indirect
    case indirectPointer
    case pencil
}

enum RemoteExternalEffectIdentifier : Hashable {
    case data(String)
    case pointerStyleEffect
    case pointerLatchingEffect
    case pointerInput
    case linkInteraction
    case markupPointer
    case glow
    case audioFeedback
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    static func == (lhs: RemoteExternalEffectIdentifier, rhs: RemoteExternalEffectIdentifier) -> Bool {
        assertUnimplemented()
    }
}

struct RemoteExternalEffectContent {
    private var identifier: RemoteExternalEffectIdentifier
    private var properties: [String : Any]?
    private var userInfo: [String : Any]?
    
    init(identifier: RemoteExternalEffectIdentifier, properties: [String : Any]?, userInfo: [String : Any]?) {
        assertUnimplemented()
    }
}

struct RemoteExternalEffectDescriptor {
    private var identifier: RemoteExternalEffectIdentifier
    private var properties: [RemoteEffectState : [String : Any]]
    private var userInfo: [String : Any]?
    
    init(identifier: RemoteExternalEffectIdentifier, properties: [RemoteEffectState : [String : Any]], userInfo: [String : Any]?) {
        assertUnimplemented()
    }
    
    init(inactive: RemoteExternalEffectContent, active: RemoteExternalEffectContent) {
        assertUnimplemented()
    }
}

struct RemotePropertyEffectContent {
    private var keyPath: String
    private var value: NSObject
    private var baseState: RemoteEffectState?
    private var userInfo: [String : Any]?
    
    init(keyPath: String, value: NSObject, baseState: RemoteEffectState?, userInfo: [String : Any]?) {
        assertUnimplemented()
    }
}

struct RemotePropertyEffectDescriptor {
    private var keyPath: String
    private var values: [RemoteEffectState : NSObject]
    private var baseState: RemoteEffectState?
    private var userInfo: [String : Any]?
    
    init(keyPath: String, values: [RemoteEffectState : NSObject], baseState: RemoteEffectState?, userInfo: [String : Any]?) {
        assertUnimplemented()
    }
    
    init(keyPath: String, inactiveValue: NSObject, activeValue: NSObject, baseState: RemoteEffectState?, userInfo: [String : Any]?) {
        assertUnimplemented()
    }
    
    init(inactive: RemotePropertyEffectContent, active: RemotePropertyEffectContent) {
        assertUnimplemented()
    }
}

struct RemoteLeafEffectCollection {
    fileprivate var entries: [RemoteLeafEffectCollection.Entry]
}

extension RemoteLeafEffectCollection {
    fileprivate struct Entry {
        var identity: _DisplayList_Identity
        var descriptor: RemoteLeafEffectDescriptor
    }
}

enum RemoteLeafEffectDescriptor {
    case propertyEffect(RemotePropertyEffectDescriptor)
    case externalEffect(RemoteExternalEffectDescriptor)
}
