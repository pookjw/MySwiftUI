#warning("TODO")
private import CoreGraphics

extension DisplayList.ViewUpdater {
    enum Model {
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
            if state.opacity == 1 {
                // <+384>
                if state.rewriteVibrantColorMatrix {
                    // <+664>
                    fatalError("TODO")
                } else {
                    // <+392>
                    if let filter = state.filters.first {
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
            var copy_1 = item
            // <+1020>
            fatalError("TODO")
        }
        
        static func finalizePlatformMerge(
            item: inout DisplayList.Item,
            into: inout DisplayList.ViewUpdater.Model.State,
            requirements: DisplayList.ViewUpdater.Model.MergedViewRequirements
        ) {
            fatalError("TODO")
        }
        
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
            fileprivate private(set) var opacity: Float = 1
            private var blend: GraphicsBlendMode = unsafe .normal
            private var transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
            private var clips: [DisplayList.ViewUpdater.Model.Clip] = []
            fileprivate private(set) var filters: [GraphicsFilter] = []
            private var shadow: Indirect<ResolvedShadowStyle>? = nil
            private var properties: DisplayList.Properties = []
            fileprivate private(set) var rewriteVibrantColorMatrix: Bool = false
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
