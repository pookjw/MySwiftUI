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
}

package struct RemoteEffectGroup {
    var effects: [any RemoteEffect]
    var accessibilityOptions: RemoteEffectAccessibilityOptions
    var properties: RemoteEffectGroup.Properties
}

extension RemoteEffectGroup {
    package struct Resolved {
        var effects: [RemoteEffectEntry] // 0x0
        var accessibilityID: Int? // 0x8
        var properties: RemoteEffectGroup.Properties // 0x18
    }
    
    struct Properties {
        var groupID: RemoteEffectGroupInfo.ID // 0x0
        var blendFactor: Double // 0x20
        var options: RemoteEffectOptions // 0x28
    }
}

protocol RemoteEffect {
    // TODO
}

struct RemoteEffectAccessibilityOptions {
    var accessibilityID: Namespace.ID
//    var attachmentBehavior: RemoteEffectAccessibilityOptions.AttachmentBehavior
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
