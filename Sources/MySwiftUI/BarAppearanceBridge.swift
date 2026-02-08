internal import MySwiftUICore
internal import UIKit

final class BarAppearanceBridge: NSObject {
    var platformStorage = BarAppearanceBridge.PlatformStorage() // 0xea0
    private var updateContext: BarAppearanceBridge.UpdateContext? = nil // 0xea8
    private(set) var allowedBars: Set<ToolbarPlacement.Role> = [] // 0xeb0
    private var lastEnvironment = EnvironmentValues() // 0x7c8
    private var lastBarUpdates: [ToolbarPlacement.Role: PlatformBarUpdates] = .init() // 0x7d0
    private var lastNavigationTitleStorage: NavigationTitleStorage? = nil // 0x7d8
    private var lastNavigationSubtitle: Text? = nil // 0x7e0
    private var lastToolbarInputContent: ToolbarContentDescription? = nil // 0x7e8
    private var barBackgroundViewModels: [ToolbarPlacement.Role: BarEnvironmentViewModel] = [:] // 0x7f0
    private var barConfigurations: [ToolbarPlacement.Role: ToolbarAppearanceConfiguration] = .init() // 0x7f8
    private var toUpdateBars: Set<ToolbarPlacement.Role> = [] // 0xeb8
    private var seedTracker = VersionSeedSetTracker() // 0xec0
    private var pendingUpdates: BarAppearanceBridge.Updates = [] // 0xec8
    
    override init() {
        super.init()
    }
    
    func viewWillAppear<Content: View>(hostingController: UIHostingController<Content>) {
        fatalError("TODO")
    }
    
    func didMoveToWindow<Content: View>(hostingController: UIHostingController<Content>) {
        fatalError("TODO")
    }
    
    final func update(environment: inout EnvironmentValues) {
        fatalError("TODO")
    }
    
    func addPreferences(to graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func updateAllowedBars(_: Set<ToolbarPlacement.Role>, viewGraph: ViewGraph) {
        fatalError("TODO")
    }
    // TODO
}

extension BarAppearanceBridge {
    struct PlatformStorage {
        var uiShouldUpdateNavigationController: Bool = true
        var uiIsHidingBackButton: Bool = false
        var uiHasNavigationContent: Bool? = nil
        var uiHasBottomBarContent: Bool? = nil
        weak var uiTargetController: UIViewController? = nil
        var uiShouldUpdateNavigationTitle: Bool = true
    }
    
    struct UpdateContext {
        private var targetController: UIViewController
        private var containingController: UINavigationController?
        private var overrides: HostingControllerOverrides
        private var navigationAdaptor: UINavigationItemAdaptorStorage
        private var customPlacements: [ToolbarPlacement.Role]
    }
    
    struct Updates: OptionSet {
        let rawValue: Int
    }
}

struct PlatformBarUpdates {
    private var backgroundVisibility: Visibility
    private var colorScheme: ColorScheme?
}

struct NavigationTitleStorage {
    var title: Text?
    var transaction: Transaction?
    var titleMode: ToolbarTitleDisplayMode?
    var titleVisibility: Visibility?
}

public struct ToolbarTitleDisplayMode {
    // TODO
}

struct ToolbarContentDescription {
    // TODO
}

class BarEnvironmentViewModel {
    // TODO
}

struct ToolbarAppearanceConfiguration {
    // TODO
}
