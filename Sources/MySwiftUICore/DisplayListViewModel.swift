// CA3A65C294B7CEBAC4D3EE28C528C257
internal import CoreGraphics
internal import Spatial

extension DisplayList.ViewUpdater {
    enum Model {
        struct PlatformState {
            fileprivate(set) var zPosition: CGFloat = 0 // 0x0
            private(set) var renderingTechnique: RenderingTechnique = .texture // 0x8
            private(set) var separatedState: SeparatedState = .none // 0x9
            private(set) var separatedOptions = SeparatedOptionValues() // 0x10
            fileprivate(set) var remoteEffects = RemoteEffectsPlatformState() // 0x18
            private(set) var hitTestsAsOpaque: Bool = false // 0x30
            fileprivate(set) var serverResponderID: UInt32? = nil // 0x34
            fileprivate private(set) var separatedModifiers: [any _DisplayList_SeparatedItemModifier] = [] // 0x40
            private(set) var hierarchicalProjectiveShadow: ProjectiveShadow? = nil // 0x48
            private(set) var currentProjectiveShadow: ProjectiveShadow? = nil // 0x49
            var versions = DisplayList.ViewUpdater.Model.PlatformState.Versions() // 0x50
            
            init() {}
            
            mutating func reset() {
                assertUnimplemented()
            }
        }
        
        struct Clip {
            private var path: Path
            private var transform: CGAffineTransform?
            private var style: FillStyle
        }
        
        @unsafe struct State {
            private(set) var globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals> // 0x0
            var opacity: Float = 1 // 0x8
            fileprivate private(set) var blend = GraphicsBlendMode.normal // 0x10
            var transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0) // 0x20
            private(set) var clips: [DisplayList.ViewUpdater.Model.Clip] = [] // 0x50
            private(set) var filters: [GraphicsFilter] = [] // 0x58
            private(set) var shadow: Indirect<ResolvedShadowStyle>? = nil // 0x60
            private(set) var properties: DisplayList.Properties = [] // 0x68
            private(set) var rewriteVibrantColorMatrix: Bool = false // 0x6c
            private var backdropAwareColorMatrices: Bool = false // 0x6d
            private var compositingGroup: Bool = false // 0x6e
            private var backdropGroupID: BackdropGroupID? = nil // 0x70
            private var stateHashes: [StrongHash] = [] // 0x78
            var platformState = DisplayList.ViewUpdater.Model.PlatformState() // 0x80
            var versions = DisplayList.ViewUpdater.Model.State.Versions() // 0x118
            
            @inline(always)
            init(
                globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>
            ) {
                unsafe self.globals = unsafe globals
            }
            
            mutating func reset() {
                assertUnimplemented()
            }
            
            func clipRect() -> FixedRoundedRect? {
                guard unsafe clips.count == 1 else {
                    return nil
                }
                
                assertUnimplemented()
            }
        }
        
        struct MergedViewRequirements : OptionSet {
            static let unknown0 = MergedViewRequirements(rawValue: 1 << 0)
            static let unknown1 = MergedViewRequirements(rawValue: 1 << 1)
            static let unknown2 = MergedViewRequirements(rawValue: 1 << 2)
            
            let rawValue: UInt8
        }
    }
}

extension DisplayList.ViewUpdater.Model.State {
    struct Globals {
        private var updater: DisplayList.ViewUpdater
        private(set) var time: Time
        private var maxVersion: DisplayList.Version
        private(set) var environment: DisplayList.ViewRenderer.Environment
        
        init(updater: DisplayList.ViewUpdater, time: Time, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) {
            self.updater = updater
            self.time = time
            self.maxVersion = maxVersion
            self.environment = environment
        }
    }
    
    struct Versions {
        var opacity = DisplayList.Version() // 0x0
        var blend = DisplayList.Version() // 0x8
        var transform = DisplayList.Version() // 0x10
        var clips = DisplayList.Version() // 0x18
        var filters = DisplayList.Version() // 0x20
        private(set) var shadow = DisplayList.Version() // 0x28
        private(set) var properties = DisplayList.Version() // 0x30
        
        init() {}
    }
}

extension DisplayList.ViewUpdater.Model.PlatformState {
    struct Versions {
        fileprivate(set) var zPosition = DisplayList.Version() // 0x0
        private(set) var separatedState = DisplayList.Version() // 0x8
        private(set) var separatedOptions = DisplayList.Version() // 0x10
        var remoteEffects = DisplayList.Version() // 0x18
        private(set) var hitTestsAsOpaque = DisplayList.Version() // 0x20
        fileprivate(set) var serverResponderID = DisplayList.Version() // 0x28
        private(set) var renderingTechnique = DisplayList.Version() // 0x30
        private(set) var hierarchicalProjectiveShadow = DisplayList.Version() // 0x38
        private(set) var currentProjectiveShadow = DisplayList.Version() // 0x40
        
        init() {}
    }
}

extension DisplayList.Item {
    func canMergeWithClipMask(state: UnsafePointer<DisplayList.ViewUpdater.Model.State>) -> Bool {
        assertUnimplemented()
    }
    
    func canMergeWithClipRect(_: FixedRoundedRect, state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
        assertUnimplemented()
    }
    
    func canMergeWithTransform() {
        assertUnimplemented()
    }
    
    var canInheritShadowOrFilters: Bool {
        assertUnimplemented()
    }
    
    private func rewriteVibrancyFilterAsBackdrop(_: GraphicsFilter.VibrantColorMatrix, list: DisplayList) {
        assertUnimplemented()
    }
    
    fileprivate func discardContainingClips(state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
        /*
         state = x23
         */
        guard unsafe !state.clips.isEmpty else {
            return true
        }
        
        assertUnimplemented()
    }
    
    private var canInheritIgnoresEvents: Bool {
        assertUnimplemented()
    }
}

extension DisplayList.ViewUpdater.Model {
    static func merge(
        item: inout DisplayList.Item,
        index: DisplayList.Index,
        into state: inout DisplayList.ViewUpdater.Model.State
    ) -> DisplayList.ViewUpdater.Model.MergedViewRequirements {
        if case .empty = item.value {
            assertUnimplemented()
        }
        
        if unsafe state.opacity == 1 || state.blend == .normal {
            if unsafe state.rewriteVibrantColorMatrix {
                assertUnimplemented()
            } else {
                if let filter = unsafe state.filters.first {
                    switch filter {
                    case .colorMultiply(_):
                        assertUnimplemented()
                    default:
                        assertUnimplemented()
                    }
                }
            }
        } else {
            // <+696>
            assertUnimplemented()
        }
        
        let copy_2 = item
        
        let result = unsafe copy_2.discardContainingClips(state: &state)
        var requirements = DisplayList.ViewUpdater.Model.MergedViewRequirements(rawValue: 0)
        if result {
            requirements.formUnion(.unknown2)
        }
        
        if unsafe !state.clips.isEmpty {
            assertUnimplemented()
        }
        
        if !requirements.contains(.unknown1) {
            let transform = unsafe state.transform
            if (transform.a == 1) && (transform.b == 0) && (transform.c == 0) && (transform.d == 1) {
            } else {
                assertUnimplemented()
            }
        }
        
        if unsafe !requirements.contains(.unknown1) && ((state.shadow != nil) || (!state.filters.isEmpty)) {
            assertUnimplemented()
        }
        
        if unsafe !requirements.contains(.unknown1) && state.properties.contains(.ignoresEvents) {
            assertUnimplemented()
        }
        
        if !requirements.contains(.unknown1) {
            let copy_5 = item
            let copy_6 = item
            let platformState = unsafe state.platformState
            let canMerge = copy_6.canMergeWithPlatformState(state: platformState)
            
            if !canMerge {
                unsafe state.reset()
            }
        } else {
            unsafe state.reset()
        }
        
        let position = item.position
        if (position.x != 0) || (position.y != 0) {
            if unsafe state.platformState.remoteEffects.hoverEffectState.applyPosition(position) {
                unsafe state.platformState.versions.remoteEffects.combine(with: item.version)
            }
        }
        
        unsafe state.transform = unsafe CGAffineTransformTranslate(
            state.transform,
            position.x,
            position.y
        )
        
        unsafe state.versions.transform.combine(with: item.version)
        
        switch item.value {
        case .content(let content):
            switch content.value {
            case .backdrop(_):
                assertUnimplemented()
            case .chameleonColor(_):
                assertUnimplemented()
            default:
                requirements.formUnion(.unknown0)
            }
        case .effect(let effect, _):
            // <+2712>
            switch effect {
            case .opacity(let opacity):
                unsafe state.opacity = state.opacity * opacity
                unsafe state.versions.opacity = max(state.versions.opacity, item.version)
            case .transform(let transform):
                switch transform {
                case .affine(_):
                    assertUnimplemented()
                case .projection(_):
                    assertUnimplemented()
                case .affine3D(let transform):
                    let results = unsafe DisplayList
                        .ViewUpdater
                        .Model
                        .mergeAffineTransform3D(
                            transform,
                            item: item,
                            into: &state
                        )
                    
                    requirements.formUnion(results)
                }
            case .identity:
                break
            case .platform(let platformEffect):
                let results = unsafe DisplayList.ViewUpdater.Model._mergePlatformEffect(
                    platformEffect,
                    item: item,
                    into: &state.platformState
                )
                
                switch platformEffect {
                case .separated(_):
                    assertUnimplemented()
                case .renderingTechnique(_):
                    requirements.formUnion(results)
                case .projectiveShadow(_):
                    requirements.formUnion(results)
                case .opaqueHitTestContainer(_):
                    requirements.formUnion(results)
                case .remoteEffects(_, _):
                    requirements.formUnion(results)
                case .customHoverEffect(_):
                    assertUnimplemented()
                case .serverResponderID(_):
                    requirements.formUnion(results)
                case .separatedModifier(_):
                    requirements.formUnion(results)
                case .identity:
                    requirements.formUnion(results)
                }
            default:
                assertUnimplemented()
            }
        case .states(_):
            fatalError()
        case .empty:
            requirements.subtract(.unknown1)
            break
        }
        
        unsafe finalizePlatformMerge(item: &item, into: &state, requirements: requirements)
        return requirements
    }
    
    static func finalizePlatformMerge(
        item: inout DisplayList.Item,
        into state: inout DisplayList.ViewUpdater.Model.State,
        requirements: DisplayList.ViewUpdater.Model.MergedViewRequirements
    ) {
        /*
         item = x21
         state = x19
         */
        
        if unsafe !requirements.isSuperset(of: [.unknown0, .unknown1]) && !state.platformState.separatedModifiers.isEmpty,
           case .states(_) = item.value 
        {
            // <+88>
            assertUnimplemented()
        }
        
        // <+1172>에서 state에 값 할당하는거 놓치지 말기
        
        // <+684>
        switch item.value {
        case .content(let content):
            // <+896>
            switch content.value {
            case .shape(_, _, _):
                // <+908>
                assertUnimplemented()
            default:
                // <+1176>
                return
            }
        case .effect(let effect, _):
            // <+708>
            // inlined
            let result = unsafe state.platformState.remoteEffects.hoverEffectState.applyEffect(effect)
            if result {
                unsafe state.platformState.versions.remoteEffects = max(state.platformState.versions.remoteEffects, item.version)
            }
            
            return
        default:
            // <+1176>
            return
        }
    }
    
    fileprivate static func mergeAffineTransform3D(
        _ transform: AffineTransform3D,
        item: DisplayList.Item,
        into state: inout DisplayList.ViewUpdater.Model.State
    ) -> DisplayList.ViewUpdater.Model.MergedViewRequirements {
        /*
         transform -> x0 -> x20
         state -> x2 -> x19
         */
        unsafe state.platformState.versions.zPosition = max(state.platformState.versions.zPosition, item.version)
        
        if transform.isIdentity {
            return []
        }
        
        // <+92>
        if
            case .effect(_, let displayList) = item.value,
            displayList.items.count > 1
        {
            return .unknown0
        }
        
        // sp + 0x60
        var copy_1 = transform
        let d8 = transform.translation.z
        
        // x29 - 0x80
        var transform = transform.translation
        transform.z = 0
        copy_1.translation = transform
        
        if copy_1.is3DTransform {
            return .unknown0
        }
        
        // <+228>
        // x29 - 0x80
        let copy_2 = CGAffineTransform(copy_1)
        // sp + 0x30
        let copy_3 = unsafe state.transform
        // sp
        let concat = copy_2.concatenating(copy_3)
        unsafe state.transform = concat
        unsafe state.platformState.zPosition += d8
        
        return []
    }
    
    fileprivate static func _mergePlatformEffect(
        _ effect: DisplayList.PlatformEffect,
        item: DisplayList.Item,
        into platformState: inout DisplayList.ViewUpdater.Model.PlatformState
    ) -> DisplayList.ViewUpdater.Model.MergedViewRequirements {
        switch effect {
        case .separated(_):
            assertUnimplemented()
            // <+536>
        case .renderingTechnique(_):
            // <+1112>
            assertUnimplemented()
        case .projectiveShadow(_):
            // <+768>
            assertUnimplemented()
        case .opaqueHitTestContainer(_):
            // <+1152>
            assertUnimplemented()
        case .remoteEffects(_, _):
            // <+816>
            assertUnimplemented()
        case .customHoverEffect(_):
            // <+1248>
            assertUnimplemented()
        case .serverResponderID(let id):
            // <+1068>
            platformState.serverResponderID = id
            platformState.versions.serverResponderID = max(item.version, platformState.versions.serverResponderID)
            return []
        case .separatedModifier(_):
            // <+248>
            assertUnimplemented()
        case .identity:
            // <+1248>
            return []
        }
    }
}
