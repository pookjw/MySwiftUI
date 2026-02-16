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
                { @Sendable (strategy: UIKitToolbarStrategy) in
                    return {
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu_Sbycfu0_TA
                        return strategy.updateBarTitle()
                    }
                },
                Toolbar.BarLocation.navigationBarTitle
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu1_Sbycfu2_TA
                        return strategy.updateBarLargeTitle()
                    }
                },
                Toolbar.BarLocation.navigationBarLargeTitle
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu3_Sbycfu4_TA
                        return strategy.updateBarCenter()
                    }
                },
                Toolbar.BarLocation.navigationBarCenter
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu5_Sbycfu6_TA
                        return strategy.updateBarAccessory()
                    }
                },
                Toolbar.BarLocation.navigationBarAccessory
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu7_Sbycfu8_TA
                        return strategy.updateBarSubtitle()
                    }
                },
                Toolbar.BarLocation.navigationBarSubtitle
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu9_Sbycfu10_TA
                        return strategy.updateNavigationLargeSubtitle()
                    }
                },
                Toolbar.BarLocation.navigationBarLargeSubtitle
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu11_Sbycfu12_TA
                        return strategy.updateNavigationBarTrailing()
                    }
                },
                Toolbar.BarLocation.navigationBarTrailing
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu13_Sbycfu14_TA
                        return strategy.updateNavigationBarLeading()
                    }
                },
                Toolbar.BarLocation.navigationBarLeading
            ),
            
            (
                {
                    @Sendable (_: UIKitToolbarStrategy) in
                    return {
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu15_Sbycfu16_TA
                        return false
                    }
                },
                Toolbar.BarLocation.navigationBarPalette
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu17_Sbycfu18_TA
                        return strategy.updateSplitControllerLeadingItems()
                    }
                },
                Toolbar.BarLocation.navigationSplitViewLeading
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu19_Sbycfu20_TA
                        return strategy.updateSplitControllerTrailingItems()
                    }
                },
                Toolbar.BarLocation.navigationSplitViewTrailing
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu23_Sbycfu24_TA
                        return false
                    }
                },
                Toolbar.BarLocation.tabBarTrailing
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu23_Sbycfu24_TA
                        return false
                    }
                },
                Toolbar.BarLocation.tabBarLeading
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu25_Sbycfu26_TA
                        return strategy.updateBottomBar()
                    }
                },
                Toolbar.BarLocation.bottomBar
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu27_Sbycfu28_TA
                        fatalError()
                        return false
                    }
                },
                Toolbar.BarLocation.keyboardBar
            ),
            
            (
                {
                    @Sendable (_ strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu29_Sbycfu30_TA
                        fatalError()
                        return false
                    }
                },
                Toolbar.BarLocation.bottomOrnament
            ),
            
            (
                {
                    @Sendable (_ strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu31_Sbycfu32_TA
                        fatalError()
                        return false
                    }
                },
                Toolbar.BarLocation._tabViewSidebarOverflowMenu
            ),
            
            (
                {
                    @Sendable (_ strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu33_Sbycfu34_TA
                        fatalError()
                        return false
                    }
                },
                Toolbar.BarLocation._tabViewSidebarBottomBar
            ),
        ]
            .map { ($0.0(self), $0.1) }
        
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
                    // <+728>
                    bridge.platformVended.uiNavigationItem.customizationIdentifier = copy_3?.identifier
                    return true
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
        return withUpdate { bridge, _ in
            // $s7SwiftUI20UIKitToolbarStrategyV19updateBarLargeTitle33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            /*
             bridge -> x0 -> x21
             */
            // sp + 0x28
            var new: UIView?
            bridge.adjustEntries(in: .navigationBarLargeTitle) { _, _ in
                fatalError("TODO")
            }
            
            // x21
            let old = bridge.platformVended.uiNavigationItem._largeTitleView
            bridge.platformVended.uiNavigationItem._largeTitleView = new
            // x20
            let new2 = bridge.platformVended.uiNavigationItem._largeTitleView
            
            if let old {
                if let new2 {
                    // <+200>
                    return old !== new2
                } else {
                    // <+232>
                    return true
                }
            } else {
                // <+220>
                if let new2 {
                    // <+236>
                    return true
                } else {
                    // <+244>
                    return false
                }
            }
        }
    }
    
    fileprivate func updateBarCenter() -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV15updateBarCenter33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_
            // bridge -> x0 -> x21
            guard _SemanticFeature<Semantics_v4>.isEnabled else {
                return false
            }
            
            // <+96>
            // x21
            let old = bridge.platformVended.uiNavigationItem.centerItemGroups
            // x20
            let new = self.barButtonGroups(in: .navigationBarCenter)
            bridge.platformVended.uiNavigationItem.centerItemGroups = new
            
            let newEndIndex = new.endIndex
            
            if newEndIndex < 1 {
                // <+412>
                let oldEndIndex = old.endIndex
                return oldEndIndex > 0
            } else {
                // <+444>
                return true
            }
        }
    }
    
    fileprivate func updateBarAccessory() -> Bool {
        return withUpdate { bridge, _ in
            // $s7SwiftUI20UIKitToolbarStrategyV19updateBarLargeTitle33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            /*
             bridge -> x0 -> x21
             */
            // sp + 0x28
            var new: UIView?
            bridge.adjustEntries(in: .navigationBarLargeTitle) { _, _ in
                fatalError("TODO")
            }
            
            // x21
            let old = bridge.platformVended.uiNavigationItem._largeTitleAccessoryView
            bridge.platformVended.uiNavigationItem._largeTitleAccessoryView = new
            // x20
            let new2 = bridge.platformVended.uiNavigationItem._largeTitleAccessoryView
            
            if let old {
                if let new2 {
                    // <+200>
                    return old !== new2
                } else {
                    // <+232>
                    return true
                }
            } else {
                // <+220>
                if let new2 {
                    // <+236>
                    return true
                } else {
                    // <+244>
                    return false
                }
            }
        }
    }
    
    fileprivate func updateBarSubtitle() -> Bool {
        return withUpdate { bridge, _ in
            // $s7SwiftUI20UIKitToolbarStrategyV19updateBarLargeTitle33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            /*
             bridge -> x0 -> x21
             */
            // sp + 0x28
            var new: UIView?
            bridge.adjustEntries(in: .navigationBarLargeTitle) { _, _ in
                fatalError("TODO")
            }
            
            // x21
            let old = bridge.platformVended.uiNavigationItem._subtitleView
            bridge.platformVended.uiNavigationItem._subtitleView = new
            // x20
            let new2 = bridge.platformVended.uiNavigationItem._subtitleView
            
            if let old {
                if let new2 {
                    // <+200>
                    return old !== new2
                } else {
                    // <+232>
                    return true
                }
            } else {
                // <+220>
                if let new2 {
                    // <+236>
                    return true
                } else {
                    // <+244>
                    return false
                }
            }
        }
    }
    
    fileprivate func updateNavigationLargeSubtitle() -> Bool {
        return withUpdate { bridge, _ in
            // $s7SwiftUI20UIKitToolbarStrategyV19updateBarLargeTitle33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            /*
             bridge -> x0 -> x21
             */
            // sp + 0x28
            var new: UIView?
            bridge.adjustEntries(in: .navigationBarLargeTitle) { _, _ in
                fatalError("TODO")
            }
            
            // x21
            let old = bridge.platformVended.uiNavigationItem._largeSubtitleView
            bridge.platformVended.uiNavigationItem._largeSubtitleView = new
            // x20
            let new2 = bridge.platformVended.uiNavigationItem._largeSubtitleView
            
            if let old {
                if let new2 {
                    // <+200>
                    return old !== new2
                } else {
                    // <+232>
                    return true
                }
            } else {
                // <+220>
                if let new2 {
                    // <+236>
                    return true
                } else {
                    // <+244>
                    return false
                }
            }
        }
    }
    
    fileprivate func updateNavigationBarTrailing() -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV26updateNavigationBarLeading33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            let old = bridge.platformVended.uiNavigationItem.trailingItemGroups
            let new = self.barButtonGroups(in: .navigationBarTrailing)
            bridge.platformVended.uiNavigationItem.trailingItemGroups = new
            
            let newEndIndex = new.endIndex
            
            if newEndIndex < 1 {
                let oldEndIndex = old.endIndex
                return oldEndIndex > 0
            } else {
                return true
            }
        }
    }
    
    fileprivate func updateHeaderProperties() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateNavigationBarLeading() -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV26updateNavigationBarLeading33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            let old = bridge.platformVended.uiNavigationItem.leadingItemGroups
            let new = self.barButtonGroups(in: .navigationBarLeading)
            bridge.platformVended.uiNavigationItem.leadingItemGroups = new
            
            let newEndIndex = new.endIndex
            
            if newEndIndex < 1 {
                let oldEndIndex = old.endIndex
                return oldEndIndex > 0
            } else {
                return true
            }
        }
    }
    
    fileprivate func updateTitleMenuProvider() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateSplitControllerLeadingItems() -> Bool {
        /*
         leadingItemGroups
         */
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV33updateSplitControllerLeadingItems33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            let old = bridge.platformVended.uiSplitControllerNavigationItem.leadingItemGroups
            let new = self.barButtonGroups(in: .navigationSplitViewLeading)
            bridge.platformVended.uiSplitControllerNavigationItem.leadingItemGroups = new
            
            let newEndIndex = new.endIndex
            
            if newEndIndex < 1 {
                let oldEndIndex = old.endIndex
                return oldEndIndex > 0
            } else {
                return true
            }
        }
    }
    
    fileprivate func updateSplitControllerTrailingItems() -> Bool {
        /*
         leadingItemGroups
         */
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV33updateSplitControllerLeadingItems33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_Tm
            let old = bridge.platformVended.uiSplitControllerNavigationItem.trailingItemGroups
            let new = self.barButtonGroups(in: .navigationSplitViewTrailing)
            bridge.platformVended.uiSplitControllerNavigationItem.trailingItemGroups = new
            
            let newEndIndex = new.endIndex
            
            if newEndIndex < 1 {
                let oldEndIndex = old.endIndex
                return oldEndIndex > 0
            } else {
                return true
            }
        }
    }
    
    fileprivate func updateRenameDelegate() -> Bool {
        fatalError("TODO")
    }
    
    fileprivate func updateTabBottomBarEntry(placement: Toolbar.BarLocation) -> Bool {
        _ = placement
        fatalError("TODO")
    }
    
    fileprivate func updateBottomBar() -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV15updateBottomBar33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_TA
            guard (context.overrides.pushTarget?.navController ?? context.navigationController) != nil else {
                return false
            }
            
            // <+104>
            bridge.platformVended.uiToolbarItems = makeBarItems()
            return true
        }
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
    
    fileprivate func barButtonItems(in location: Toolbar.BarLocation) -> [UIBarButtonItem] {
        fatalError("TODO")
    }
    
    fileprivate func barButtonGroups(in location: Toolbar.BarLocation) -> [UIBarButtonItemGroup] {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV15barButtonGroups33_A409749AC298CF150D90E447BB4FA064LL2inSaySo05UIBarG9ItemGroupCGAA0D0O11BarLocationO_tFAiA0D6BridgeCyACG_AK13UpdateContextVtXEfU_TA.148
            /*
             bridge -> x0 -> x20
             context -> x1 -> x23
             location -> x2 -> x22
             */
            // x25
            let copy_1 = context
            // x23
            guard let targetController = copy_1.targetController else {
                return []
            }
            
            // targetController -> x23 -> x29 - 0x50
            var x290x48: UInt8 = 2
            // x29 - 0x58
            var results: [UIBarButtonItemGroup] = []
            
            if location == .navigationBarLeading {
                x290x48 = 0
            }
            
            let entryCount = bridge.entryCount(in: location)
            
            bridge.adjustEntries(in: location) { _, _ in
                fatalError("TODO")
            }
            
            return results
        }
    }
    
    fileprivate func makeBarItems() -> [UIBarButtonItem] {
        // sp + 0x10
        var array1: [UIBarButtonItem] = []
        // sp + 0x18
        var array2: [UIBarButtonItem] = []
        
        withUpdate { bridge, context in
            // $s7SwiftUI13ToolbarBridgeC13adjustEntries2in_yAA0C0O11BarLocationO_yAA0C7StorageV5EntryV_AG10VendedItemOSgztXEtFAA05UIKitC8StrategyV_Tg503$s7a4UI20nco7V12makeh60Items33_A409749AC298CF150D90E447BB4FA064LLSaySo15UIBarButtonm10CGyFyAA0D6d40CyACG_AA0D0O13UpdateContextVtXEfU_yAA0D7j2V5k6V_AM06L12R0OSgztXEfU_AA05UIBarM7ContextVSgSaySo011UIBarButtonM0CGAYTf1ncn_nTf4nngnn_n
            // x25, x28, x22
            let storage = bridge.storageByLocation[.bottomBar] ?? Toolbar.LocationStorage(entryIDs: [], entries: [:], vendedItems: [:])
            
            // <+260>
            fatalError("TODO")
        }
        
        guard !array2.isEmpty else {
            return Array(array1)
        }
        
        // <+84>
        fatalError("TODO")
    }
}
