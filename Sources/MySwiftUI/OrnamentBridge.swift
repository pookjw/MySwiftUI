// E4F8DC7FC027B5DEBED25AF2F78DD489
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import MRUIKit

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
    
    final func didMoveToWindow() {
        updateSceneOrnamentFrameMonitor()
    }
    
    fileprivate final func updateSceneOrnamentFrameMonitor() {
        let platterOrnamentManager: AnyObject?
        if
            shouldMonitorAllSceneOrnaments,
            let window = hostingController!.host.window,
            let windowScene = window.windowScene
        {
           // <+160>
            platterOrnamentManager = windowScene._mrui_platterOrnamentManager
        } else {
            // <+200>
            platterOrnamentManager = nil
        }
        
        // <+204>
        fatalError("TODO")
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
