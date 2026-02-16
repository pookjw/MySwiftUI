// A409749AC298CF150D90E447BB4FA064

private import MySwiftUICore
internal import UIKit
private import _UIKitPrivate
private import os.log

struct UIKitToolbarStrategy: ToolbarStrategy {
    var updater: ToolbarBridge<UIKitToolbarStrategy>? // 0x0
    var updateContext: Toolbar.UpdateContext? // 0x14 (offset field)
    
    init() {
    }
    
    func makeContent(entry: ToolbarStorage.Entry) -> (String, Toolbar.VendedItem?) {
        fatalError("TODO")
    }
    
    func updateVended(_ vended: Toolbar.VendedItem, to entry: ToolbarStorage.Entry) {
        fatalError("TODO")
    }
    
    func makeEntries(in location: Toolbar.BarLocation, from entries: [ToolbarStorage.Entry]) -> [ToolbarStorage.Entry] {
        /*
         entries -> x20 -> x1
         */
        guard !entries.isEmpty else {
            return []
        }
        
        // <+180>
        fatalError("TODO")
    }
    
    func updateLocations() -> Set<Toolbar.BarLocation> {
        let array: [(() -> Bool, Toolbar.BarLocation)] = [
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu_Sbycfu0_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu_Sbycfu0_TATm
                    return updateBarTitle()
                },
                .navigationBarTitle
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu1_Sbycfu2_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu1_Sbycfu2_TATm
                    return updateBarLargeTitle()
                },
                .navigationBarLargeTitle
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateBarCenter()
                },
                .navigationBarCenter
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu5_Sbycfu6_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu1_Sbycfu2_TATm
                    return updateHeaderProperties()
                },
                .navigationBarAccessory
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu7_Sbycfu8_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu1_Sbycfu2_TATm
                    return updateHeaderProperties()
                },
                .navigationBarSubtitle
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu9_Sbycfu10_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu1_Sbycfu2_TATm
                    return updateHeaderProperties()
                },
                .navigationBarLargeSubtitle
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu11_Sbycfu12_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateTitleMenuProvider()
                },
                .navigationBarTrailing
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu13_Sbycfu14_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateNavigationBarLeading()
                },
                .navigationBarLeading
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu15_Sbycfu16_TA
                    return updateRenameDelegate()
                },
                .navigationBarPalette
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu17_Sbycfu18_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateSplitControllerLeadingItems()
                },
                .navigationSplitViewLeading
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu19_Sbycfu20_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateSplitControllerLeadingItems()
                },
                .navigationSplitViewTrailing
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu23_Sbycfu24_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu15_Sbycfu16_TA
                    return updateTabBottomBarEntry(placement: .tabBarTrailing)
                },
                .tabBarTrailing
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu25_Sbycfu26_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateTabBottomBarEntry(placement: .tabBarLeading)
                },
                .tabBarLeading
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu23_Sbycfu24_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu15_Sbycfu16_TA
                    return updateBottomBar()
                },
                .bottomBar
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu27_Sbycfu28_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu_Sbycfu0_TATm
                    return updateKeyboardBar()
                },
                .keyboardBar
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu31_Sbycfu32_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateBottomOrnament()
                },
                .bottomOrnament
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu29_Sbycfu30_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TATm
                    return updateTabSidebarOverflowMenu()
                },
                ._tabViewSidebarOverflowMenu
            ),
            
            (
                {
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu33_Sbycfu34_TA
                    // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu33_Sbycfu34_
                    return updateTabBottomBarEntry(placement: ._tabViewSidebarBottomBar)
                },
                ._tabViewSidebarBottomBar
            ),
        ]
        
        // <+2436>
        // x23
        var locations = Set<Toolbar.BarLocation>()
        
        for (block, location) in array {
            // <+2560>
            let updated = block()
            if updated {
                locations.update(with: location)
            }
        }
        
        // <+2704>
        if let log = Log.toolbar {
            log.log(level: .default, "Changed toolbar locations: \(locations.description)")
        }
        
        return locations
    }
    
    func updateSearch() -> Bool {
        return withUpdate { updater, updateContext in
            // $s7SwiftUI20UIKitToolbarStrategyV12updateSearchSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_TA
            /*
             updater -> x0 -> x19
             updateContext -> x1 -> sp + 0xbd8
             */
            // x23
            let copy_1 = updater.searchItem
            // x27
            let copy_2 = copy_1
            
            // x26
            let uiSearchController: SwiftUISearchController?
            if let copy_2 {
                // <+516>
                if let _uiSearchController = updater.platformVended.uiSearchController {
                    uiSearchController = _uiSearchController
                } else {
                    uiSearchController = SwiftUISearchController()
                    updater.platformVended.uiSearchController = uiSearchController
                }
            } else {
                uiSearchController = nil
            }
            
            // <+600>
            // x28
            let uiNavigationItem = updater.platformVended.uiNavigationItem
            // x19
            let searchController_1 = uiNavigationItem.searchController
            uiNavigationItem.searchController = uiSearchController
            let searchController_2 = uiNavigationItem.searchController
            
            let w24: Bool
            if let searchController_1 {
                if let searchController_2 {
                    // <+724>
                    w24 = (searchController_2 !== searchController_1)
                } else {
                    // <+764>
                    w24 = true
                }
            } else {
                // <+748>
                if let searchController_2 {
                    // <+768>
                    w24 = true
                } else {
                    // <+776>
                    w24 = false
                }
            }
            
            // <+780>
            // x21
            let copy_3 = copy_1
            
            let hidesSearchBarWhenScrolling: Bool
            if let copy_3 {
                // <+892>
                switch copy_3.environment.searchFieldPlacement {
                case .navigationBarDrawer(let mode):
                    switch mode {
                    case .automatic:
                        hidesSearchBarWhenScrolling = true
                    case .always:
                        hidesSearchBarWhenScrolling = false
                    }
                case .automatic:
                    hidesSearchBarWhenScrolling = true
                case .toolbar:
                    hidesSearchBarWhenScrolling = true
                case .toolbarPrincipal:
                    hidesSearchBarWhenScrolling = true
                case .sidebarList:
                    hidesSearchBarWhenScrolling = true
                case .navigationColumn:
                    hidesSearchBarWhenScrolling = true
                case .none:
                    hidesSearchBarWhenScrolling = true
                }
            } else {
                // <+844>
                hidesSearchBarWhenScrolling = true
            }
            uiNavigationItem.hidesSearchBarWhenScrolling = hidesSearchBarWhenScrolling
            
            // <+988>
            configureNavigationItem(uiNavigationItem, searchItem: copy_1, controller: uiSearchController)
            // x20
            let copy_4 = copy_1
            
            guard let copy_4 else {
                return w24
            }
            
            // <+1184>
            fatalError("TODO")
        }
    }
    
    func updateProperties() -> Toolbar.Updates.NavigationProperties {
        fatalError("TODO")
    }
    
    func willSetStorage(_ storage: inout Toolbar.LocationStorage, in location: Toolbar.BarLocation, from entries: [ToolbarStorage.Entry]) {
        // nop
    }
    
    func willReturnUpdates(_ updates: Toolbar.Updates, preferences: PreferenceValues) {
        /*
         updates.locations -> x0
         locations.flag1/2/3/navigationProperties -> x1
         preferences -> x2
         */
        fatalError("TODO")
    }
    
    func configureNavigationItem(_ navigationItem: UINavigationItem, searchItem: ToolbarStorage.SearchItem?, controller: SwiftUISearchController?) {
        // controller는 안 씀
        /*
         navigationItem -> x0 -> sp + 0x520
         searchItem -> x1 -> x21
         */
        // <+240>
        // x26
        let copy_1 = searchItem
        // w26
        let role: SearchFieldPlacement.Role?
        if let copy_1 {
            // <+356>
            role = copy_1.environment.searchFieldPlacement
        } else {
            // <+308>
            role = nil
        }
        
        // <+444>
        let copy_2 = searchItem
        // w8
        let searchToolbarBehavior: SearchToolbarBehavior
        if let copy_2 {
            // <+560>
            searchToolbarBehavior = copy_2.environment.searchToolbarBehavior
        } else {
            // <+504>
            searchToolbarBehavior = .automatic
        }
        
        var preferredSearchBarPlacement: UINavigationItem.SearchBarPlacement?
        if let role {
            switch searchToolbarBehavior.role {
            case .automatic:
                // <+684>
                preferredSearchBarPlacement = nil
            case .minimize:
                switch role {
                case .automatic, .toolbar:
                    // <+676>
                    preferredSearchBarPlacement = .msui_integratedCentered
                default:
                    // <+684>
                    preferredSearchBarPlacement = nil
                }
            }
        } else {
            // <+684>
            preferredSearchBarPlacement = nil
        }
        
        if preferredSearchBarPlacement == nil {
            // <+684>
            if let role, _SemanticFeature<Semantics_v4>.isEnabled {
                switch role {
                case .navigationBarDrawer(let mode):
                    preferredSearchBarPlacement = .stacked
                case .automatic:
                    preferredSearchBarPlacement = .automatic
                case .toolbar:
                    preferredSearchBarPlacement = .automatic
                case .toolbarPrincipal:
                    preferredSearchBarPlacement = .inline
                case .sidebarList:
                    // <+788>
                    break
                case .navigationColumn:
                    preferredSearchBarPlacement = .stacked
                case .none:
                    // <+788>
                    break
                }
            }
        }
        
        if let preferredSearchBarPlacement {
            navigationItem.preferredSearchBarPlacement = preferredSearchBarPlacement
        }
        
        // <+788>
        if _SemanticFeature<Semantics_v7>.isEnabled {
            let shouldUpdate: Bool
            switch role {
            case .navigationBarDrawer(_):
                shouldUpdate = false
            case .automatic:
                shouldUpdate = true
            case .toolbar:
                shouldUpdate = true
            case .toolbarPrincipal:
                shouldUpdate = false
            case .sidebarList:
                shouldUpdate = true
            case .navigationColumn:
                shouldUpdate = true
            case .none:
                shouldUpdate = true
            case .some(.none):
                shouldUpdate = false
            }
            
            let copy_3 = searchItem
            if let copy_3, copy_3.allowsGlobalSearch {
                navigationItem.msui_searchBarPlacementAllowsExternalIntegration = true
            }
        }
        
        // <+968>
    }
    
    fileprivate func updateBarTitle() -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV14updateBarTitle33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_
            // x29 - 0x60
            var titleView: UIView? = nil
            bridge.adjustEntries(in: .navigationBarTitle) { entry, item in
                // titleView을 설정해 주는듯
                fatalError("TODO")
            }
            
            bridge.platformVended.uiNavigationItem.titleView = titleView
            
            // sp + 0xe0
            let copy_1 = bridge.lastToolbarStorage
            // x29 - 0xc0
            let copy_2 = bridge.lastInputToolbarStorage
            
            if let copy_1 {
                // <+220>
                // sp + 0x24
                let isAnimated = copy_1.isAnimated
                if let copy_2 {
                    // <+264>
                    fatalError("TODO")
                } else {
                    // <+676>
                    // sp + 0x90
                    let copy_3 = bridge.lastToolbarStorage
                    // sp + 0x48
                    let copy_4 = copy_3
                    // sp + 0x90
                    let copy_5 = copy_1
                    // isAnimated -> w25
                    // <+728>
                    
                    fatalError("TODO")
                }
            } else {
                // <+596>
                if let copy_2 {
                    // <+604>
                    fatalError("TODO")
                } else {
                    // <+820>
                    fatalError("TODO")
                }
            }
            
            fatalError("TODO")
        }
    }
    
    fileprivate func updateBarLargeTitle() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateBarCenter() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateHeaderProperties() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateNavigationBarLeading() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateTitleMenuProvider() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateSplitControllerLeadingItems() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateRenameDelegate() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateTabBottomBarEntry(placement: Toolbar.BarLocation) -> Bool {
        _ = placement
        fatalError("TODO")
    }
    
    fileprivate func updateBottomBar() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateKeyboardBar() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateBottomOrnament() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateTabSidebarOverflowMenu() -> Bool {
        fatalError("TODO")
    }
}
