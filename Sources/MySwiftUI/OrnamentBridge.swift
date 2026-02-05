// E4F8DC7FC027B5DEBED25AF2F78DD489
@_spi(Internal) private import MySwiftUICore

class OrnamentBridge<Content: View> {
    weak var hostingController: UIHostingController<Content>? = nil
    private var ornamentsSeed: VersionSeed = .empty // 0x120
    private var ornaments: [Namespace.ID: OrnamentBridge<Content>.PresentationState] = .init() // 0x8a0
    private var sceneOrnamentFrameMonitor: SceneOrnamentFrameMonitor? = nil // 0x128
    private var shouldMonitorAllSceneOrnaments: Bool = false // 0x130
    
    init() {
    }
    
    final func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(OrnamentPresentation.Key.self)
    }
    // TODO
}

extension OrnamentBridge {
    struct PresentationState {
        private var presentation: OrnamentPresentation
//        private var ornament: SwiftUIOrnament<AnyView>
    }
}

fileprivate class SceneOrnamentFrameMonitor {
    // TODO
}

struct OrnamentPresentation {
    // TODO
}

extension OrnamentPresentation {
    struct Key: HostPreferenceKey {
        static var defaultValue: Never {
            fatalError("TODO")
        }
        
        static func reduce(value: inout Never, nextValue: () -> Never) {
            fatalError("TODO")
        }
        
        static var _isReadableByHost: Bool {
            fatalError("TODO")
        }
        
        static var _includesRemovedValues: Bool {
            fatalError("TODO")
        }
    }
}
