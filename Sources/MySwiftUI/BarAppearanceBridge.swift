// 6C1D64F000BEDAC8A453E0E2D82A1069

@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import _MySwiftUIShims

final class BarAppearanceBridge: NSObject {
    var platformStorage = BarAppearanceBridge.PlatformStorage() // 0xea0
    private(set) var updateContext: BarAppearanceBridge.UpdateContext? = nil // 0xea8
    var allowedBars: Set<ToolbarPlacement.Role> = [] // 0xeb0
    private(set) var lastEnvironment = EnvironmentValues() // 0x7c8
    private var lastBarUpdates: [ToolbarPlacement.Role: PlatformBarUpdates] = .init() // 0x7d0
    private(set) var lastNavigationTitleStorage: NavigationTitleStorage? = nil // 0x7d8
    private(set) var lastNavigationSubtitle: Text? = nil // 0x7e0
    private(set) var lastToolbarInputContent: ToolbarContentDescription? = nil // 0x7e8
    private var barBackgroundViewModels: [ToolbarPlacement.Role: BarEnvironmentViewModel] = [:] // 0x7f0
    var barConfigurations: [ToolbarPlacement.Role: ToolbarAppearanceConfiguration] = .init() // 0x7f8
    var toUpdateBars: Set<ToolbarPlacement.Role> = [] // 0xeb8
    var seedTracker = VersionSeedSetTracker() // 0xec0
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
            self.lastNavigationSubtitle = value?.title
            updateNavigationTitleStorage(preferences)
            
            // <+424>
            // inlined
            updateNavigationBar(preferences: preferences)
            updateConfigurations(preferences)
            updateBarsToConfiguration()
            
            result = self.pendingUpdates
        } else {
            // <+508>
        }
        
        // <+512>
        seedTracker.updateSeeds(to: preferences)
        
        // 뭐가 불리는지 검증
        if self.pendingUpdates.contains(.unknown1) {
            // <+560>
            fatalError()
            platformUpdateNavigationAdaptor()
        } else {
            fatalError()
        }
        
        // <+568>
        self.updateContext = nil
        
        // <+652>
        self.pendingUpdates = []
        return result
    }
    
    fileprivate func updateNavigationTitleStorage(_ preferences: PreferenceValues) {
        /*
         self -> x20 -> x29 - 0x120
         preferences -> x0 -> x22
         */
        // <+112>
        // x29 - 0xf0
        let old = self.lastNavigationTitleStorage
        // x29 - 0x88
        let new = preferences[NavigationTitleKey.self].value
        self.lastNavigationTitleStorage = new
        
        // <+316>
        if old?.titleVisibility != new?.titleVisibility {
            // <+404>
            fatalError("TODO")
        }
        
        // <+600>
    }
    
    fileprivate func updateConfigurations(_ preferenceValues: PreferenceValues) {
        /*
         self -> x20 -> x26
         preferenceValues -> x0 -> x19 + 0x70
         */
        // <+576>
        // self.updateContext -> x24
        // x20
        let targetController = updateContext?.targetController
        var roles = ToolbarPlacement.Role.allCases
        if let customPlacements = updateContext?.customPlacements {
            roles.append(contentsOf: customPlacements)
            
            guard !roles.isEmpty else {
                return
            }
        }
        
        // <+804>
        // self.updateContext -> x24 -> x19 + 0x40
        // roles -> x23, x19 + 0x38
        // self -> x26 -> x19 + 0xa8
        for role in roles {
            // <+892>
            // role -> x29 - 0x98
            // x20
            let allowedBars = self.allowedBars
            guard allowedBars.contains(role) else {
                continue
            }
            
            // <+988>
            // inlined
            let result = self.updateBarConfigurations(role: role, preferences: preferenceValues)
            guard result else {
                break
            }
        }
        
        // <+2596>
    } 
    
    fileprivate func updateBarsToConfiguration() {
        // self -> x20 -> x21
        // <+352>
        guard !self.toUpdateBars.isEmpty else {
            return
        }
        
        // <+396>
        // x23
        let roles: [ToolbarPlacement.Role] = [
            .navigationBar,
            .tabBar,
            .bottomBar,
            .bottomOrnament
        ]
        
        // <+532>
        // x19 + 0xb0
        let windowToolbar = ToolbarPlacement.Role.windowToolbar
        // x19 + 0xa0
        let bottomBar = ToolbarPlacement.Role.bottomBar
        // x19 + 0xd0
        let windowToolbarItems = ToolbarPlacement.Role.windowToolbarItems
        
        for role in roles {
            // role -> x29 - 0xd0
            guard self.allowedBars.contains(role) else {
                continue
            }
            
            // <+744>
            // x19 + 0x110
            let navigationBarRole = ToolbarPlacement.Role.navigationBar
            // x19 + 0x170
            let copy_1 = role
            // x19 + 0x198
            let copy_2 = navigationBarRole
            
            // <+788>
            if copy_1 != copy_2 {
                // <+996>
                fatalError("TODO")
            } else {
                // <+1164>
                // x26
                let set = Set<ToolbarPlacement.Role>(
                    [
                        windowToolbar,
                        windowToolbarItems
                    ]
                )
                fatalError("TODO")
            }
            
            fatalError("TODO")
        }
    }
    
    func platformUpdateNavigationAdaptor() {
        fatalError("TODO")
    }
    
    @inline(__always)
    func withUpdate<T>(_ block: (_ updateContext: BarAppearanceBridge.UpdateContext) -> T) -> T {
        guard let updateContext else {
            fatalError("Attempted to update outside of update path")
        }
        
        return block(updateContext)
    }
    
    func invalidate(bar: ToolbarPlacement.Role) {
        /*
         self -> x20
         bar -> x0 -> x19
         */
        if allowedBars.contains(bar) {
            allowedBars.update(with: bar)
        }
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
        private(set) var targetController: UIViewController // 0x0
        private(set) var containingController: UINavigationController? // 0x8
        private(set) var overrides: HostingControllerOverrides // 0x10
        private(set) var navigationAdaptor = UINavigationItemAdaptorStorage() // 0x48
        private(set) var customPlacements: [ToolbarPlacement.Role] = []
        
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

struct PlatformBarUpdates {
    private var backgroundVisibility: Visibility
    private var colorScheme: ColorScheme?
}

struct NavigationTitleStorage {
    var title: Text? // 0x0
    var transaction: Transaction? // 0x20 (1 = nil)
    var titleMode: ToolbarTitleDisplayMode? // 0x28
    var titleVisibility: Visibility? // 0x2c
    
    mutating func reduce(onto: @autoclosure () -> NavigationTitleStorage?) {
        // $s7SwiftUI22NavigationTitleStorageV6reduce4ontoyACSgyXK_tF03$s7a33UI19BarAppearanceBridgeC016updatec130C033_BF747AB022DCE7FC5B6AD0F035BC8E0DLL8updating11preferencesyAA0gC11UpdateFlagsV_AA16PreferenceValuesVtFyAC0S7ContextVXEfU_AA0G12dE10VSgyXEfu2_AA0jkL0CTf1cn_nTf4ng_n
        /*
         self -> x0 -> x19
         onto -> x1 -> x21
         */
        guard title == nil || titleMode == nil else {
            return
        }
        
        // x20
        guard let incoming = onto() else {
            return
        }
        
        // <+276>
        fatalError("TODO")
    } 
}

struct ToolbarContentDescription {
    var titleStorage: NavigationTitleStorage?
    var navigationProperties: ToolbarStorage.NavigationProperties?
    var toolbarStorage: ToolbarStorage?
    var seed: VersionSeed
    
    // TODO
}

class BarEnvironmentViewModel {
    // TODO
}

struct ToolbarAppearanceConfiguration: Equatable {
    static func == (lhs: ToolbarAppearanceConfiguration, rhs: ToolbarAppearanceConfiguration) -> Bool {
        fatalError("TODO")
    }
    
    private var allowsUpdates: Bool = true // 0x0
    private var visibility: Visibility = .automatic // 0x1
    private var foregroundStyle: AnyShapeStyle? = nil // 0x8
    private var background: AnyShapeStyle? = nil // 0x10
    private var backgroundVisibility: ToolbarBackgroundVisibility = .automatic // 0x18
    private var backgroundVisibilityOnScrollDistance: Double? = nil // 0x20/0x28
    private var backgroundOpacity: Double? = nil // 0x30/0x38
    private var colorScheme: ColorScheme? // 0x39 (actual), 0x38 (offset field)
    private var toolbarLegibility: ToolbarLegibility = .init(role: .unspecified) // 0x3a (actual), 0x30 (offset field)
    private var animation: Animation? = nil // 0x40 (actual), 0x34 (offset field)
    private var fullScreenVisibility: WindowToolbarFullScreenVisibility = .automatic // 0x48 (actual), 0x38 (offset field)
    
    // TODO
}
