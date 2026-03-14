// E4F8DC7FC027B5DEBED25AF2F78DD489
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import MRUIKit

class OrnamentBridge<Content: View> {
    weak var hostingController: UIHostingController<Content>? = nil {
        didSet {
            updateSceneOrnamentFrameMonitor()
        }
    }
    
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
        // platterOrnamentManager -> sp + 0x8
        if let sceneOrnamentFrameMonitor {
            // <+224>
            fatalError("TODO")
        } else {
            guard let platterOrnamentManager else {
                return
            }
            
            // <+328>
            fatalError("TODO")
        }
    }
    
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x20 -> x24
         preferences -> x0 -> x20
         */
        // <+944>
        // x27
        let presentation = preferences[OrnamentPresentation.Key.self]
        // x22
        let oldSeed = self.ornamentsSeed
        // x26
        let newSeed = presentation.seed
        
        guard !oldSeed.matches(newSeed) else {
            return
        }
        
        // <+1108>
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

fileprivate final class SceneOrnamentFrameMonitor {
    weak var ornamentManager: MRUIPlatterOrnamentManager?
    var onFramesMayHaveChanged: (() -> Void)?
    var observations: [ObjectIdentifier: [NSKeyValueObservation]]
    
    init(ornamentManager: MRUIPlatterOrnamentManager?, onFramesMayHaveChanged: (() -> Void)?, observations: [ObjectIdentifier : [NSKeyValueObservation]]) {
        self.ornamentManager = ornamentManager
        self.onFramesMayHaveChanged = onFramesMayHaveChanged
        self.observations = observations
    }
    
    deinit {
        fatalError("TODO")
    }
    
    func observe(ornament: MRUIPlatterOrnament) {
        fatalError("TODO")
    }
    
    @objc func ornamentAdde(_: Notification) {
        fatalError("TODO")
    }
    
    @objc func ornamentRemoved(_: Notification) {
        fatalError("TODO")
    }
}

enum OrnamentPosition {
    case fixed(sceneAnchor: UnitPoint, offset: CGSize)
    case computed(attachmentAnchor: OrnamentAttachmentAnchor.Storage, contentAlignment: Alignment3D, layoutDirection: LayoutDirection)
}

struct OrnamentPresentation {
    private var content: AnyView
    private var viewID: Namespace.ID
    private var isVisible: Bool
    private var position: OrnamentPosition
    private var zOffset: CGFloat?
    private var isInternal: Bool
    private var environment: EnvironmentValues
    private var onDismiss: () -> Void
    private var transaction: Transaction?
    private var usesRemoteVisibility: Bool
    
    // TODO
}

extension OrnamentPresentation {
    struct Key: HostPreferenceKey {
        @safe static nonisolated(unsafe) let defaultValue: [Namespace.ID: OrnamentPresentation] = [:]
        
        static func reduce(value: inout [Namespace.ID: OrnamentPresentation], nextValue: () -> [Namespace.ID: OrnamentPresentation]) {
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
