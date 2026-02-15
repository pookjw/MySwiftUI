private import MySwiftUICore
internal import UIKit
private import _UIKitPrivate

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
                    fatalError("TODO")
                },
                {
                    fatalError("TODO")
                }()
            )
        ]
        fatalError("TODO")
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
}
