// 6C1D64F000BEDAC8A453E0E2D82A1069

@_spi(Internal) internal import MySwiftUICore
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
        /*
         self -> x20 -> x21
         environment -> x0 -> x19
         */
        if let configuration = barConfigurations[.navigationBar] {
            // <+180>
            fatalError("TODO")
        }
        
        // <+408>
        fatalError("TODO")
    }
    
    func addPreferences(to graph: ViewGraph) {
        /*
         self -> x20 -> x19
         graph -> x0 -> x20
         */
        graph.addPreference(NavigationTitleKey.self)
        seedTracker.addPreference(NavigationTitleKey.self)
        
        graph.addPreference(ToolbarRoleKey.self)
        seedTracker.addPreference(ToolbarRoleKey.self)
        
        graph.addPreference(NavigationSubtitleKey.self)
        seedTracker.addPreference(NavigationSubtitleKey.self)
        
        graph.addPreference(NavigationBarBackButtonHiddenKey.self)
        seedTracker.addPreference(NavigationBarBackButtonHiddenKey.self)
        
        graph.addPreference(ToolbarKey.self)
        seedTracker.addPreference(ToolbarKey.self)
    }
    
    func updateAllowedBars(_: Set<ToolbarPlacement.Role>, viewGraph: ViewGraph) {
        fatalError("TODO")
    }
    
    func preferencesDidChange<Content: View>(_ preferenceValues: PreferenceValues, hostingController: UIHostingController<Content>) {
        /*
         self -> x20 -> x19
         preferenceValues -> x0 -> x20
         hostingController -> x1 -> x21
         */
        let updateContext = BarAppearanceBridge.UpdateContext(hostingController: hostingController)
        let updates = preferencesDidChange(preferenceValues, updateContext: updateContext)
        fatalError("TODO")
    }
    
    func preferencesDidChange(_ preferences: PreferenceValues, updateContext: BarAppearanceBridge.UpdateContext) -> BarAppearanceBridge.Updates {
        /*
         self -> x20 -> x19
         preferences -> x0 -> x21
         updateContext -> x1 -> x20
         */
        // x29 - 0xb0
        let copy_1 = updateContext
        self.updateContext = copy_1
        // w25
        let hasChanges = self.seedTracker.hasChanges(in: preferences)
        
        // x22
        var result = self.pendingUpdates
        
        if hasChanges {
            // <+284>
            self.pendingUpdates = result.union(.unknown1)
            // x24
            let subtitle = preferences[NavigationSubtitleKey.self]
            // x29 - 0xb0
            let value = subtitle.value
            self.lastNavigationSubtitle = value
            updateNavigationTitleStorage(preferences)
            
            // <+424>
            // inlined
            updateNavigationBar(updating: NavigationBarUpdateFlags(), preferences: preferences)
            updateConfigurations(preferences)
            updateBarsToConfiguration()
            
            result = self.pendingUpdates
        } else {
            // <+508>
        }
        
        // <+512>
        seedTracker.updateSeeds(to: preferences)
        
        if self.pendingUpdates.contains(.unknown1) {
            // <+560>
            platformUpdateNavigationAdaptor()
        }
        
        // <+568>
        self.updateContext = nil
        
        // <+652>
        self.pendingUpdates = []
        return result
    }
    
    fileprivate func updateNavigationTitleStorage(_ preferences: PreferenceValues) {
        self.update { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC016updateNavigationC033_BF747AB022DCE7FC5B6AD0F035BC8E0DLL8updating11preferencesyAA0gC11UpdateFlagsV_AA16PreferenceValuesVtFyAC0S7ContextVXEfU_
            /*
             updateContext -> x0 -> x19 + 0x118
             self -> x1 -> x22
             preferences -> x2 -> x19 + 0x110
             */
            // <+720>
            fatalError("TODO")
        }
    }
    
    fileprivate func updateNavigationBar(updating: NavigationBarUpdateFlags, preferences: PreferenceValues) {
        fatalError("TODO")
    }
    
    fileprivate func update(_ block: (_ updateContext: BarAppearanceBridge.UpdateContext) -> Void) {
        guard let updateContext else {
            fatalError("Attempted to update outside of update path")
        }
        
        block(updateContext)
    }
    
    fileprivate func updateConfigurations(_ preferenceValues: PreferenceValues) {
        fatalError("TODO")
    } 
    
    fileprivate func updateBarsToConfiguration() {
        fatalError("TODO")
    }
    
    func platformUpdateNavigationAdaptor() {
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
        private var targetController: UIViewController // 0x0
        private var containingController: UINavigationController? // 0x8
        private var overrides: HostingControllerOverrides // 0x10
        private var navigationAdaptor = UINavigationItemAdaptorStorage() // 0x48
        private var customPlacements: [ToolbarPlacement.Role] = []
        
        init<Content: View>(hostingController: UIHostingController<Content>) {
            // hostingController -> x21
            self.targetController = hostingController
            // x22
            var navigationController = hostingController.navigationController ?? hostingController.overrides.navigation
            
            // <+116>
            var x23: UIViewController? = hostingController.splitViewController ?? hostingController.overrides.split
            
            if let _x23 = x23, let _navigationController = navigationController {
                // <+188>
                // x24
                if let parent = _navigationController.parent {
                    // x25
                    if let casted = parent as? UINavigationController {
                        // <+240>
                        // x20
                        if let parent2 = casted.parent {
                            // <+260>
                            let isEqual = parent2 == _x23
                            x23 = isEqual ? navigationController : parent
                            navigationController = isEqual ? casted : navigationController
                        } else {
                            // <+328>
                            x23 = parent
                        }
                    } else {
                        // <+328>
                        x23 = parent
                    }
                } else {
                    // <+336>
                }
            }
            
            // <+340>
            self.containingController = navigationController
            self.overrides = hostingController.overrides
            
            // <+356>
            if let toolbarBridge = hostingController.toolbarBridge {
                self.navigationAdaptor = toolbarBridge.navigationAdaptor
            }
        }
    }
    
    struct Updates: OptionSet {
        static var unknown1: BarAppearanceBridge.Updates {
            return BarAppearanceBridge.Updates(rawValue: 1 << 1)
        }
        
        let rawValue: Int
    }
}

struct NavigationBarUpdateFlags {
    // TODO
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
