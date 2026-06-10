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
            private(set) var remoteEffects = RemoteEffectsPlatformState() // 0x18
            private(set) var hitTestsAsOpaque: Bool = false // 0x30
            private(set) var serverResponderID: UInt32? = nil // 0x34
            fileprivate private(set) var separatedModifiers: [any _DisplayList_SeparatedItemModifier] = [] // 0x40
            private(set) var hierarchicalProjectiveShadow: ProjectiveShadow? = nil // 0x48
            private(set) var currentProjectiveShadow: ProjectiveShadow? = nil // 0x49
            var versions = DisplayList.ViewUpdater.Model.PlatformState.Versions() // 0x50
            
            init() {}
        }
        
        struct Clip {
            private var path: Path
            private var transform: CGAffineTransform?
            private var style: FillStyle
        }
        
        @unsafe struct State {
            private(set) var globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>
            private(set) var opacity: Float = 1
            private var blend: GraphicsBlendMode = unsafe .normal
            var transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
            private(set) var clips: [DisplayList.ViewUpdater.Model.Clip] = []
            private(set) var filters: [GraphicsFilter] = []
            private(set) var shadow: Indirect<ResolvedShadowStyle>? = nil
            private(set) var properties: DisplayList.Properties = []
            private(set) var rewriteVibrantColorMatrix: Bool = false
            private var backdropAwareColorMatrices: Bool = false
            private var compositingGroup: Bool = false
            private var backdropGroupID: BackdropGroupID? = nil
            private var stateHashes: [StrongHash] = []
            var platformState = DisplayList.ViewUpdater.Model.PlatformState()
            var versions = DisplayList.ViewUpdater.Model.State.Versions()
            
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
        var opacity = DisplayList.Version()
        var blend = DisplayList.Version()
        var transform = DisplayList.Version()
        var clips = DisplayList.Version()
        var filters = DisplayList.Version()
        private(set) var shadow = DisplayList.Version()
        private(set) var properties = DisplayList.Version()
        
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
        private(set) var serverResponderID = DisplayList.Version() // 0x28
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
        /*
         item = x21
         index = sp + 0x10
         state = x19
         */
        if case .empty = item.value {
            // <+80>
            assertUnimplemented()
        }
        
        // <+360>
        if unsafe state.opacity == 1 {
            // <+384>
            if unsafe state.rewriteVibrantColorMatrix {
                // <+664>
                assertUnimplemented()
            } else {
                // <+392>
                if let filter = unsafe state.filters.first {
                    switch filter {
                    case .colorMultiply(_):
                        // <+440>
                        assertUnimplemented()
                    default:
                        // <+664>
                        assertUnimplemented()
                    }
                }
                // <+960>
            }
        } else {
            // <+464>
            assertUnimplemented()
        }
        
        // <+960>
        // sp + 0x780
        let copy_1 = item
        // sp + 0x4f0
        let copy_2 = item
        // <+1020>
        // sp + 0x3a0
        _ = copy_1
        
        let result = unsafe copy_2.discardContainingClips(state: &state)
        // sp + 0x7d0
        _ = copy_2
        // w22
        var requirements = DisplayList.ViewUpdater.Model.MergedViewRequirements(rawValue: 0)
        if result {
            requirements.formUnion(.unknown2)
        }
        
        if unsafe !state.clips.isEmpty {
            // <+1132>
            assertUnimplemented()
        }
        
        // <+1568>
        // x23
        _ = copy_1.version
        if !requirements.contains(.unknown1) {
            let transform = unsafe state.transform
            if (transform.a == 1) && (transform.b == 0) && (transform.c == 0) && (transform.d == 1) {
                // <+1780>
            } else {
                // <+1636>
                assertUnimplemented()
            }
        }
        
        // <+1780>
        if unsafe !requirements.contains(.unknown1) && ((state.shadow != nil) || (!state.filters.isEmpty)) {
           // <+1804>
            assertUnimplemented()
        }
        
        // <+1892>
        // version -> x24
        if unsafe !requirements.contains(.unknown1) && state.properties.contains(.ignoresEvents) {
            // <+1908>
            assertUnimplemented()
        }
        
        // <+1988>
        if !requirements.contains(.unknown1) {
            // <+1992>
            // sp + 0x6e0
            let copy_5 = item
            // sp + 0x690
            let copy_6 = item
            
            // <+2056>
            // sp + 0x210
            let platformState = unsafe state.platformState
            // <+2172>
            // sp + 0xc0
            _ = copy_5
            // w20
            let canMerge = copy_6.canMergeWithPlatformState(state: platformState)
            
            // sp + 0x4f0
            _ = platformState
            // sp + 0x740
            _ = copy_5
            
            if !canMerge {
                unsafe state.reset()
            }
            
            // <+2376>
        } else {
            // <+2344>
            unsafe state.reset()
            // <+2376>
        }
        
        // <+2376>
        // d0, d1
        let position = item.position
        if (position.x != 0) || (position.y != 0) {
            // <+2396>
            if unsafe state.platformState.remoteEffects.hoverEffectState.applyPosition(position) {
                unsafe state.platformState.versions.remoteEffects.combine(with: item.version)
            }
        }
        
        // <+2432>
        unsafe state.transform = unsafe CGAffineTransformTranslate(
            state.transform,
            position.x,
            position.y
        )
        
        // <+2484>
        unsafe state.versions.transform.combine(with: item.version)
        
        // <+2500>
        switch item.value {
        case .content(let content):
            // <+2524>
            switch content.value {
            case .backdrop(_):
                // <+2544>
                assertUnimplemented()
            case .chameleonColor(_):
                // <+2544>
                assertUnimplemented()
            default:
                // <+2628>
                requirements.formUnion(.unknown0)
                // <+2648>
            }
        case .effect(let effect, let displayList):
            // <+2712>
            switch effect {
            case .transform(let transform):
                switch transform {
                case .affine(_):
                    assertUnimplemented()
                case .projection(_):
                    assertUnimplemented()
                case .affine3D(let transform):
                    let results = DisplayList
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
            default:
                assertUnimplemented()
            }
        case .states(_):
            // <+6396>
            fatalError()
        case .empty:
            // <+2644>
            requirements.subtract(.unknown1)
            // <+2648>
            break
        }
        
        // <+2648>
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
            switch effect {
            case .identity:
                return
            default:
                assertUnimplemented()
            }
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
        state.platformState.versions.zPosition = max(state.platformState.versions.zPosition, item.version)
        
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
        let copy_3 = state.transform
        // sp
        let concat = copy_2.concatenating(copy_3)
        state.transform = concat
        state.platformState.zPosition += d8
        
        return []
    }
}
