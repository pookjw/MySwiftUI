// CA3A65C294B7CEBAC4D3EE28C528C257

internal import CoreGraphics

extension DisplayList.ViewUpdater {
    enum Model {
        struct PlatformState {
            private(set) var zPosition: CGFloat = 0
            private(set) var renderingTechnique: RenderingTechnique = .texture
            private(set) var separatedState: SeparatedState = .none
            private(set) var separatedOptions = SeparatedOptionValues()
            private(set) var remoteEffects = RemoteEffectsPlatformState()
            private(set) var hitTestsAsOpaque: Bool = false
            private(set) var serverResponderID: UInt32? = nil
            fileprivate private(set) var separatedModifiers: [any _DisplayList_SeparatedItemModifier] = []
            private(set) var hierarchicalProjectiveShadow: ProjectiveShadow? = nil
            private(set) var currentProjectiveShadow: ProjectiveShadow? = nil
            var versions = DisplayList.ViewUpdater.Model.PlatformState.Versions()
            
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
            
            @inline(__always)
            init(
                globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>
            ) {
                unsafe self.globals = unsafe globals
            }
            
            mutating func reset() {
                fatalError("TODO")
            }
            
            func clipRect() -> FixedRoundedRect? {
                guard unsafe clips.count == 1 else {
                    return nil
                }
                
                fatalError("TODO")
            }
        }
        
        struct MergedViewRequirements: OptionSet {
            static let unknown1 = MergedViewRequirements(rawValue: 1 << 0)
            static let unknown2 = MergedViewRequirements(rawValue: 1 << 1)
            static let unknown4 = MergedViewRequirements(rawValue: 1 << 2)
            
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
        private(set) var zPosition = DisplayList.Version()
        private(set) var separatedState = DisplayList.Version()
        private(set) var separatedOptions = DisplayList.Version()
        var remoteEffects = DisplayList.Version()
        private(set) var hitTestsAsOpaque = DisplayList.Version()
        private(set) var serverResponderID = DisplayList.Version()
        private(set) var renderingTechnique = DisplayList.Version()
        private(set) var hierarchicalProjectiveShadow = DisplayList.Version()
        private(set) var currentProjectiveShadow = DisplayList.Version()
        
        init() {}
    }
}

extension DisplayList.Item {
    func canMergeWithClipMask(state: UnsafePointer<DisplayList.ViewUpdater.Model.State>) -> Bool {
        fatalError("TODO")
    }
    
    func canMergeWithClipRect(_: FixedRoundedRect, state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
        fatalError("TODO")
    }
    
    func canMergeWithTransform() {
        fatalError("TODO")
    }
    
    var canInheritShadowOrFilters: Bool {
        fatalError("TODO")
    }
    
    private func rewriteVibrancyFilterAsBackdrop(_: GraphicsFilter.VibrantColorMatrix, list: DisplayList) {
        fatalError("TODO")
    }
    
    fileprivate func discardContainingClips(state: inout DisplayList.ViewUpdater.Model.State) -> Bool {
        /*
         state = x23
         */
        guard unsafe !state.clips.isEmpty else {
            return true
        }
        
        fatalError("TODO")
    }
    
    private var canInheritIgnoresEvents: Bool {
        fatalError("TODO")
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
            fatalError("TODO")
        }
        
        // <+360>
        if unsafe state.opacity == 1 {
            // <+384>
            if unsafe state.rewriteVibrantColorMatrix {
                // <+664>
                fatalError("TODO")
            } else {
                // <+392>
                if let filter = unsafe state.filters.first {
                    switch filter {
                    case .colorMultiply(_):
                        // <+440>
                        fatalError("TODO")
                    default:
                        // <+664>
                        fatalError("TODO")
                    }
                }
                // <+960>
            }
        } else {
            // <+464>
            fatalError("TODO")
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
            requirements.formUnion(.unknown4)
        }
        
        if unsafe !state.clips.isEmpty {
            // <+1132>
            fatalError("TODO")
        }
        
        // <+1568>
        // x23
        _ = copy_1.version
        if !requirements.contains(.unknown2) {
            let transform = unsafe state.transform
            if (transform.a == 1) && (transform.b == 0) && (transform.c == 0) && (transform.d == 1) {
                // <+1780>
            } else {
                // <+1636>
                fatalError("TODO")
            }
        }
        
        // <+1780>
        if unsafe !requirements.contains(.unknown2) && ((state.shadow != nil) || (!state.filters.isEmpty)) {
           // <+1804>
            fatalError("TODO")
        }
        
        // <+1892>
        // version -> x24
        if unsafe !requirements.contains(.unknown2) && state.properties.contains(.ignoresEvents) {
            // <+1908>
            fatalError("TODO")
        }
        
        // <+1988>
        if !requirements.contains(.unknown2) {
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
                fatalError("TODO")
            case .chameleonColor(_):
                // <+2544>
                fatalError("TODO")
            default:
                // <+2628>
                requirements.formUnion(.unknown1)
                // <+2648>
            }
        case .effect(_, _):
            // <+2712>
            fatalError("TODO")
        case .states(_):
            // <+6396>
            fatalError()
        case .empty:
            // <+2644>
            requirements.remove(.unknown2)
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
        
        if unsafe !requirements.isSuperset(of: [.unknown1, .unknown2]) && !state.platformState.separatedModifiers.isEmpty,
           case .states(_) = item.value 
        {
            // <+88>
            fatalError("TODO")
        }
        
        // <+1172>에서 state에 값 할당하는거 놓치지 말기
        
        // <+684>
        switch item.value {
        case .content(let content):
            // <+896>
            switch content.value {
            case .shape(_, _, _):
                // <+908>
                fatalError("TODO")
            default:
                // <+1176>
                return
            }
        case .effect(_, _):
            // <+708>
            fatalError("TODO")
        default:
            // <+1176>
            return
        }
    }
}
