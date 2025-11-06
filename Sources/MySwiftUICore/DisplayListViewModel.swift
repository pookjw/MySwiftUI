#warning("TODO")
private import CoreGraphics

extension DisplayList.ViewUpdater {
    enum Model {
        struct PlatformState {
            private var zPosition: CGFloat = 0
            private var renderingTechnique: RenderingTechnique = .texture
            private var separatedState: SeparatedState = .none
            private var separatedOptions = SeparatedOptionValues()
            private var remoteEffects = RemoteEffectsPlatformState()
            private var hitTestsAsOpaque: Bool = false
            private var serverResponderID: UInt32? = nil
            private var separatedModifiers: [any _DisplayList_SeparatedItemModifier] = []
            private var hierarchicalProjectiveShadow: ProjectiveShadow? = nil
            private var currentProjectiveShadow: ProjectiveShadow? = nil
            private var versions = DisplayList.ViewUpdater.Model.PlatformState.Versions()
            
            init() {}
        }
        
        struct Clip {
            private var path: Path
            private var transform: CGAffineTransform?
            private var style: FillStyle
        }
        
        @unsafe struct State {
            private var globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>
            private(set) var opacity: Float = 1
            private var blend: GraphicsBlendMode = unsafe .normal
            private var transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
            private(set) var clips: [DisplayList.ViewUpdater.Model.Clip] = []
            private(set) var filters: [GraphicsFilter] = []
            private var shadow: Indirect<ResolvedShadowStyle>? = nil
            private var properties: DisplayList.Properties = []
            private(set) var rewriteVibrantColorMatrix: Bool = false
            private var backdropAwareColorMatrices: Bool = false
            private var compositingGroup: Bool = false
            private var backdropGroupID: BackdropGroupID? = nil
            private var stateHashes: [StrongHash] = []
            private var platformState = DisplayList.ViewUpdater.Model.PlatformState()
            private var versions = DisplayList.ViewUpdater.Model.State.Versions()
            
            init(
                globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>
            ) {
                unsafe self.globals = unsafe globals
            }
        }
        
        struct MergedViewRequirements: OptionSet {
            static let unknown4 = MergedViewRequirements(rawValue: 1 << 2)
            
            let rawValue: UInt8
        }
    }
}

extension DisplayList.ViewUpdater.Model.State {
    struct Globals {
        private var updater: DisplayList.ViewUpdater
        private var time: Time
        private var maxVersion: DisplayList.Version
        private var environment: DisplayList.ViewRenderer.Environment
        
        init(updater: DisplayList.ViewUpdater, time: Time, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) {
            self.updater = updater
            self.time = time
            self.maxVersion = maxVersion
            self.environment = environment
        }
    }
    
    struct Versions {
        private var opacity = DisplayList.Version()
        private var blend = DisplayList.Version()
        private var transform = DisplayList.Version()
        private var clips = DisplayList.Version()
        private var filters = DisplayList.Version()
        private var shadow = DisplayList.Version()
        private var properties = DisplayList.Version()
        
        init() {}
    }
}

extension DisplayList.ViewUpdater.Model.PlatformState {
    struct Versions {
        private var zPosition = DisplayList.Version()
        private var separatedState = DisplayList.Version()
        private var separatedOptions = DisplayList.Version()
        private var remoteEffects = DisplayList.Version()
        private var hitTestsAsOpaque = DisplayList.Version()
        private var serverResponderID = DisplayList.Version()
        private var renderingTechnique = DisplayList.Version()
        private var hierarchicalProjectiveShadow = DisplayList.Version()
        private var currentProjectiveShadow = DisplayList.Version()
        
        init() {}
    }
}
