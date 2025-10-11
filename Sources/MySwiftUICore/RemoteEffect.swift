#warning("TODO")

enum RemoteEffectInfo {
    case group(RemoteEffectGroupInfo)
    //    case property(RemotePropertyEffectInfo)
    //    case external(RemoteExternalEffectInfo)
    //    case glowEffect(RemoteGlowEffect)
}

extension RemoteEffectInfo {
    struct Properties {
        // TODO
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
    
    enum ID: Hashable {
        case namespace(Namespace.ID)
        case custom(String)
        case implicit(_DisplayList_Identity)
        case named(Namespace.ID, String)
        case view(Namespace.ID)
        case none
        
        func hash(into hasher: inout Hasher) {
            fatalError("TODO")
        }
        
        static func == (lhs: RemoteEffectGroupInfo.ID, rhs: RemoteEffectGroupInfo.ID) -> Bool {
            fatalError("TODO")
        }
    }
    
    enum ExclusiveHitTestNamespace {
        case `default`
    }
    
    enum HitTestMode {
        case rayPlaneIntersection
        case rightHandGesture
        case leftHandGesture
    }
    
    enum SourceBehavior {
        case preservesGroup
        case onlyTriggersGroup
    }
    
    enum NamespaceScope {
        case scene(String)
        case local
        case globa
    }
}

struct RemoteEffectsPlatformState {
    var legacyEffects: [_DisplayList_Identity: RemoteEffectGroup.Resolved] = [:]
    var hoverEffectState = HoverEffectState()
}

struct RemoteEffectGroup {
    var effects: [any RemoteEffect]
    var accessibilityOptions: RemoteEffectAccessibilityOptions
    var properties: RemoteEffectGroup.Properties
}

extension RemoteEffectGroup {
    struct Resolved {
        var effects: [RemoteEffectEntry]
        var accessibilityID: Int?
        var properties: RemoteEffectGroup.Properties
    }
    
    struct Properties {
        var groupID: RemoteEffectGroupInfo.ID
        var blendFactor: Double
        var options: RemoteEffectOptions
    }
}

protocol RemoteEffect {
    // TODO
}

struct RemoteEffectAccessibilityOptions {
    var accessibilityID: Namespace.ID
//    var attachmentBehavior: RemoteEffectAccessibilityOptions.AttachmentBehavior
}

struct HoverEffectState {
//    var groups: [HoverEffectState.GroupEffect] = []
//    var leafEffects: [HoverEffectState.LeafEffect] = []
}

enum RemoteEffectEntry {
//    case property(RemotePropertyEffect)
//    case external(RemoteExternalEffectInfo)
//    case glowEffect(RemoteGlowEffect)
}

struct RemoteEffectOptions {
    var applyInPlace: Bool
//    var overrideState: RemoteEffectState?
//    var allowedTouchTypes: Set<TouchType>?
//    var hitTestProperties: RemoteEffectOptions.HitTestProperties
    var isFrozen: Bool
//    var _dwellHover: RemoteEffectDwellDelay
//    var _dwellIdle: RemoteEffectDwellDelay
//    var namespaceScope: RemoteEffectNamespaceScope
//    var kind: RemoteEffectOptions.Kind
}
