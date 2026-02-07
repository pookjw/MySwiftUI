// 0E31079E853BF37F2F0477B683D77398
private import UIKit
internal import MySwiftUICore

enum Toolbar {}

extension Toolbar {
    struct UpdateContext {
        private var overrides = HostingControllerOverrides() // 0x0
        private weak var navigationController: UINavigationController? = nil // 0x38
        private weak var targetController: UIViewController? = nil // 0x40
        private weak var sceneSession: UISceneSession? = nil // 0x48
        private var horizontalSizeClass: UserInterfaceSizeClass? = .regular // 0x20 (offset field)
        private var verticalSizeClass: UserInterfaceSizeClass? = .regular // 0x24 (offset field)
        private var accessoryBarLocations: [Toolbar.BarLocation] = [] // 0x28 (offset field)
        
        init<Content: View>(hostingController: UIHostingController<Content>) {
            // <+280>
            // hostingController -> x20
            self.overrides = hostingController.overrides
            self.navigationController = hostingController.navigationController
            self.targetController = hostingController
            
            if
                let window = hostingController.host.window,
                let windowScene = window.windowScene
            {
                self.sceneSession = windowScene.session
            } else {
                self.sceneSession = nil
            }
        }
    }
    
    enum BarLocation {
        case accessoryBar(AnyHashable)
        case navigationBarTitle
        case navigationBarLargeTitle
        case navigationBarCenter
        case navigationBarTrailing
        case navigationBarSubtitle
        case navigationBarLargeSubtitle
        case navigationBarLeading
        case navigationBarPalette
        case navigationBarAccessory
        case navigationSplitViewLeading
        case navigationSplitViewTrailing
        case tabBarLeading
        case tabBarTrailing
        case _tabViewSidebarOverflowMenu
        case _tabViewSidebarBottomBar
        case search
        case bottomBar
        case keyboardBar
        case toolbar
        case touchBar
        case bottomOrnament
    }
    
    struct Updates {
        // TODO
    }
}

extension EnvironmentValues {
    var toolbarUpdateContext: Toolbar.UpdateContext? {
        get {
            return self[ToolbarUpdateContextKey.self]
        }
        set {
            self[ToolbarUpdateContextKey.self] = newValue
        }
    }
}

fileprivate struct ToolbarUpdateContextKey: EnvironmentKey {
    static nonisolated(unsafe) let defaultValue: Toolbar.UpdateContext? = nil
}
