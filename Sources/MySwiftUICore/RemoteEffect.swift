// 3E16A233DDB220D680CDDD5BF460B837
internal import CoreGraphics

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
    
    var values: [RemoteEffectGroupInfo.ID: RemoteEffectGroupInfo] {
        assertUnimplemented()
    }
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
    private var groups: [HoverEffectState.GroupEffect] = []
    private(set) var leafEffects: [HoverEffectState.LeafEffect] = []
    
    func applyPosition(_ origin: CGPoint) -> Bool {
        if !groups.isEmpty {
            assertUnimplemented()
        }
        
        if !leafEffects.isEmpty {
            assertUnimplemented()
        }
        
        return false
    }
    
    func anyLeafEffectsSatisfy(_ block: (HoverEffectLeafValues) -> Bool) -> Bool {
        if groups.isEmpty && leafEffects.isEmpty {
            return false
        }
        
        assertUnimplemented()
    }
}

extension HoverEffectState {
    struct GroupEffect {
        // TODO
    }
    
    struct LeafEffect {
        // TODO
    }
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

struct HoverEffectLeafValues {
    var opacity: HoverEffectOpacityValue?
    var affineTransform: HoverEffectAffineTransformValue?
    var resize: HoverEffectResizeValue?
    var resizeBy: HoverEffectResizeByValue?
    var remoteLeafEffects: RemoteLeafEffectCollection?
}

struct HoverEffectOpacityValue {
    let identity: _DisplayList_Identity
    var inactiveValue: Float
    var activeValue: Float
}

struct HoverEffectAffineTransformValue {
    let identity: _DisplayList_Identity
    var inactiveValue: CGAffineTransform
    var activeValue: CGAffineTransform
}

struct HoverEffectResizeValue {
    let identity: _DisplayList_Identity
    var inactiveValue: FixedRoundedRect
    var activeValue: FixedRoundedRect
    var clipped: Bool
}

struct HoverEffectResizeByValue {
    let identity: _DisplayList_Identity
    var activeValue: EdgeInsets
    var isRecursive: Bool
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
    // TODO
}
