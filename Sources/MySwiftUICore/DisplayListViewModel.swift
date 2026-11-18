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
            fileprivate(set) var blend = GraphicsBlendMode.normal // 0x10
            var transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0) // 0x20
            private(set) var clips: [DisplayList.ViewUpdater.Model.Clip] = [] // 0x50
            var filters: [GraphicsFilter] = [] // 0x58
            fileprivate(set) var shadow: Indirect<ResolvedShadowStyle>? = nil // 0x60
            fileprivate(set) var properties: DisplayList.Properties = [] // 0x68
            private(set) var rewriteVibrantColorMatrix: Bool = false // 0x6c
            private var backdropAwareColorMatrices: Bool = false // 0x6d
            private(set) var compositingGroup: Bool = false // 0x6e
            private var backdropGroupID: BackdropGroupID? = nil // 0x70
            private var stateHashes: [StrongHash] = [] // 0x78
            var platformState = DisplayList.ViewUpdater.Model.PlatformState() // 0x80
            var versions = DisplayList.ViewUpdater.Model.State.Versions() // 0x118
            
            @inline(always)
            init(globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>) {
                unsafe self.globals = unsafe globals
            }
            
            var hasDODEffects: Bool {
                guard unsafe self.clips.isEmpty && (self.shadow == nil) else {
                    return true
                }
                
                // <+68>
                var result = false
                
                for filter in unsafe self.filters {
                    guard !result else {
                        continue
                    }
                    
                    switch filter {
                    case .blur(let blurStyle):
                        // <+248>
                        result = !blurStyle.isOpaque
                    case .variableBlur(let variableBlurStyle):
                        // <+248>
                        result = !variableBlurStyle.isOpaque
                    case .displacementMap(_):
                        result = true
                    case .chromaticAberrationMap(_):
                        result = true
                    case .shadow(_):
                        result = true
                    case .projection(_):
                        result = false
                    case .colorMatrix(_):
                        result = false
                    case .colorMultiply(_):
                        result = false
                    case .alphaMultiply(_):
                        result = false
                    case .hueRotation(_):
                        result = false
                    case .saturation(_):
                        result = false
                    case .brightness(_):
                        result = false
                    case .contrast(_):
                        result = false
                    case .grayscale(_):
                        result = false
                    case .colorMonochrome(_):
                        result = false
                    case .vibrantColorMatrix(_):
                        result = false
                    case .luminanceCurve(_):
                        result = false
                    case .colorCurves(_):
                        result = false
                    case .shader(_):
                        result = false
                    case .alphaThreshold(_):
                        result = false
                    case .edrGainMultiply(_):
                        result = false
                    case .glassBackground(_):
                        result = true
                    case .caFilter(_):
                        result = false
                    case .averageColor:
                        result = false
                    case .luminanceToAlpha:
                        result = false
                    case .colorInvert:
                        result = false
                    }
                }
                
                return result
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
            
            fileprivate mutating func adjust(for transform: CGAffineTransform) {
                guard unsafe (self.shadow != nil) || !self.filters.isEmpty else {
                    return
                }
                
                let transform_1 = transform
                let d8: CGFloat = 1
                var d0 = CGSize(width: 1, height: 1)
                    .applying(transform_1)
                    .width
                var d1: CGFloat = -1
                d1 = d0 + d1
                d1 = abs(d1)
                let d2: CGFloat = 0.001
                
                guard !(d1 <= d2) else {
                    return
                }
                
                d0 = d8 / d0
                let sp0x10 = d0
                
                if unsafe self.shadow != nil {
                    // <+152>
                    let radius = unsafe self.shadow!.value.radius
                    unsafe self.shadow!.value.radius = sp0x10 * radius
                    
                    var offset = unsafe self.shadow!.value.offset
                    
                    if offset.width != 0 {
                        offset.width = offset.width * sp0x10
                    } else {
                        offset.width = 0
                    }
                    
                    if offset.height != 0 {
                        offset.height = offset.height * sp0x10
                    } else {
                        offset.height = 0
                    }
                    
                    unsafe self.shadow!.value.offset = offset
                }
                
                // <+508>
                for index in unsafe self.filters.indices {
                    let filter = unsafe self.filters[index]
                    
                    switch filter {
                    case .blur(var blurStyle):
                        blurStyle.radius = sp0x10 * blurStyle.radius
                        unsafe self.filters[index] = .blur(blurStyle)
                    default:
                        break
                    }
                }
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
        private var updater: DisplayList.ViewUpdater // 0x0
        private(set) var time: Time // 0x8
        private var maxVersion: DisplayList.Version // 0x10
        private(set) var environment: DisplayList.ViewRenderer.Environment // 0x18
        
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
        var shadow = DisplayList.Version() // 0x28
        fileprivate(set) var properties = DisplayList.Version() // 0x30
        
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
    
    func canMergeWithTransform() -> Bool {
        switch self.value {
        case .effect(let effect, _):
            switch effect {
            case .clip(let path, _, _):
                // <+124>
                return path.roundedRect() == nil
            case .platform(let effect):
                // <+184>
                switch effect {
                case .customHoverEffect(let effect):
                    return effect.canMergeWithTransform(item: self)
                default:
                    return true
                }
            default:
                return true
            }
        default:
            return true
        }
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
    
    fileprivate var canInheritIgnoresEvents: Bool {
        switch self.value {
        case .content(let content):
            // <+52>
            switch content.value {
            case .platformView(let factory):
                // <+76>
                return factory.capabilities.contains(.mergesWithIgnoresEvents)
            case .platformLayer(let factory):
                // <+188>
                return factory.capabilities.contains(.mergesWithIgnoresEvents)
            default:
                return true
            }
        case .effect(let effect, _):
            // <+136>
            switch effect {
            case .platformGroup(_):
                return false
            default:
                return true
            }
        case .states(_):
            // <+320>
            fatalError()
        case .empty:
            return true
        }
    }
}

extension DisplayList.ViewUpdater.Model {
    static func merge(
        item: inout DisplayList.Item,
        index: DisplayList.Index,
        into state: inout DisplayList.ViewUpdater.Model.State
    ) -> DisplayList.ViewUpdater.Model.MergedViewRequirements {
        if case .states = item.value {
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
            // <+1060>
            assertUnimplemented()
        }
        
        // <+1212>
        if !requirements.contains(.unknown1) {
            let transform = unsafe state.transform
            if (transform.a == 1) && (transform.b == 0) && (transform.c == 0) && (transform.d == 1) {
            } else {
                // <+1264>
                if !item.canMergeWithTransform() {
                    requirements.formUnion(.unknown1)
                }
            }
        }
        
        // <+1284>
        if unsafe !requirements.contains(.unknown1) && ((state.shadow != nil) || (!state.filters.isEmpty)) {
            assertUnimplemented()
        }
        
        if unsafe !requirements.contains(.unknown1) && state.properties.contains(.ignoresEvents) {
            // <+1372>
            if !item.canInheritIgnoresEvents {
                requirements.formUnion(.unknown1)
            }
        }
        
        if !requirements.contains(.unknown1) {
            let copy_6 = item
            let platformState = unsafe state.platformState
            let canMerge = copy_6.canMergeWithPlatformState(state: platformState)
            
            if !canMerge {
                requirements.formUnion(.unknown1)
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
            // <+1936>
            switch effect {
            case .backdropGroup(_):
                // <+1968>
                assertUnimplemented()
            case .archive(_):
                // <+3260>
                assertUnimplemented()
            case .properties(let properties):
                // <+2480>
                unsafe state.properties.formUnion(properties)
                unsafe state.versions.properties = max(state.versions.properties, item.version)
            case .platformGroup(_):
                // <+2524>
                assertUnimplemented()
            case .opacity(let opacity):
                // <+2128>
                unsafe state.opacity = state.opacity * opacity
                unsafe state.versions.opacity = max(state.versions.opacity, item.version)
            case .blendMode(let blendMode):
                // <+3332>
                unsafe state.blend = blendMode
                unsafe state.versions.blend = max(state.versions.blend, item.version)
            case .clip:
                // <+3424>
                assertUnimplemented()
            case .mask(_, _):
                // <+3212>
                assertUnimplemented()
            case .sdfShape(_):
                // <+3736>
                assertUnimplemented()
            case .transform(let transform):
                // <+2176>
                switch transform {
                case .affine(_):
                    // <+3992>
                    assertUnimplemented()
                case .projection(_):
                    // <+4708>
                    assertUnimplemented()
                case .affine3D(let transform):
                    // <+4448>
                    let results = unsafe DisplayList
                        .ViewUpdater
                        .Model
                        .mergeAffineTransform3D(
                            transform,
                            item: item,
                            into: &state
                        )
                    
                    requirements.formUnion(results)
                case .rotation(let data):
                    // <+2332>
                    let transform = CGAffineTransform(translationX: data.anchor.x, y: data.anchor.y)
                        .rotated(by: data.angle.radians)
                        .translatedBy(x: -data.anchor.x, y: -data.anchor.y)
                    
                    unsafe state.transform = transform.concatenating(state.transform)
                    unsafe state.versions.transform = max(state.versions.transform, item.version)
                    unsafe state.adjust(for: transform)
                case .rotation3D(_):
                    // <+4604>
                    assertUnimplemented()
                }
            case .filter(let filter):
                // <+3532>
                switch filter {
                case .shadow(let style):
                    // <+4296>
                    unsafe state.shadow = Indirect(style)
                    unsafe state.versions.shadow = max(state.versions.shadow, item.version)
                case .shader(_):
                    // <+5036>
                    break
                default:
                    // <+3660>
                    if filter.isIdentity {
                        // <+5036>
                    } else {
                        // <+4908>
                        unsafe state.filters.append(filter)
                        unsafe state.versions.filters = max(state.versions.filters, item.version)
                    }
                }
            case .animation(_):
                // <+5452>
                assertUnimplemented()
            case .contentTransition(_):
                // <+2056>
                assertUnimplemented()
            case .view(_):
                // <+5452>
                assertUnimplemented()
            case .accessibility(_):
                // <+2092>
                assertUnimplemented()
            case .platform(let platformEffect):
                // <+2556>
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
            case .state(_):
                // <+3824>
                assertUnimplemented()
            case .interpolatorRoot(_, _, _):
                // <+2444>
                assertUnimplemented()
            case .interpolatorLayer(_, _):
                // <+3936>
                assertUnimplemented()
            case .interpolatorAnimation(_):
                // <+3296>
                assertUnimplemented()
            case .identity:
                // <+3776>
                break
            case .geometryGroup:
                // <+1968>
                assertUnimplemented()
            case .compositingGroup:
                // <+1968>
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
        
        if unsafe !requirements.isDisjoint(with: [.unknown0, .unknown1]) && !state.platformState.separatedModifiers.isEmpty,
           case .effect(_, _) = item.value
        {
            // <+88>
            assertUnimplemented()
        }
        
        // <+904>에서 state에 값 할당하는거 놓치지 말기
        
        // <+344>
        switch item.value {
        case .content(let content):
            // <+636>
            switch content.value {
            case .shape(let path, _, _):
                // <+648>
                let result = unsafe state.platformState.remoteEffects.hoverEffectState.applyPath(path)
                if result {
                    unsafe state.platformState.versions.remoteEffects = max(state.platformState.versions.remoteEffects, item.version)
                }
                
                return
            default:
                // <+908>
                return
            }
        case .effect(let effect, _):
            // <+368>
            // inlined
            let result = unsafe state.platformState.remoteEffects.hoverEffectState.applyEffect(effect)
            if result {
                unsafe state.platformState.versions.remoteEffects = max(state.platformState.versions.remoteEffects, item.version)
            }
            
            return
        default:
            // <+908>
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
