private import MySwiftUICore

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
        fatalError("TODO")
    }
    
    func updateLocations() -> Set<Toolbar.BarLocation> {
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
            
            let w20: Bool
            if let copy_3 {
                // <+892>
            } else {
                // <+844>
            }
            fatalError("TODO")
        }
    }
    
    func updateProperties() -> Toolbar.Updates.NavigationProperties {
        fatalError("TODO")
    }
    
    func willSetStorage(_ storage: inout Toolbar.LocationStorage, in location: Toolbar.BarLocation, from entries: [ToolbarStorage.Entry]) {
        fatalError("TODO")
    }
    
    func willReturnUpdates(_ updates: Toolbar.Updates, preferences: PreferenceValues) {
        fatalError("TODO")
    }
}

