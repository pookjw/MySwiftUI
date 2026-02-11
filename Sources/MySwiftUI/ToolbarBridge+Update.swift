// 558B6B1E48F37C8B0E16B128287879E0
private import MySwiftUICore

extension ToolbarBridge {
    func preferencesDidChange(_ preferences: PreferenceValues, context: __owned Toolbar.UpdateContext) -> Toolbar.Updates {
        /*
         self -> x20 -> x22
         context -> x1 -> sp + 0xb0
         preferences -> x0 -> x20
         */
        // sp + 0x118
        var updates = Toolbar.Updates(
            set: [],
            flag1: false,
            flag2: false,
            flag3: false,
            flag4: false
        )
        
        // x27
        let toolbarValue = preferences[ToolbarKey.self]
        // sp + 0x9c
        let toolbarMatches = toolbarTracker.seed.matches(toolbarValue.seed)
        
        if !toolbarMatches {
            // <+420>
            toolbarTracker.seed = toolbarValue.seed
            lastToolbarStorage = toolbarValue.value
        }
        
        // <+680>
        // sp + 0x100 (x19 + 0x100)
        let toolbarStorage = toolbarStorage ?? ToolbarKey.defaultValue
        // sp + 0x128
        let copy_1 = toolbarStorage
        // sp + 0x1c0
        let copy_2 = copy_1
        
        // <+884>
        allowedLocations.formUnion([])
        context.accessoryBarLocations = []
        
        // <+972>
        context.horizontalSizeClass = lastEnvironment.horizontalSizeClass
        context.verticalSizeClass = lastEnvironment.verticalSizeClass
        
        // <+1192>
        T.withUpdater(self, context) { strategy in
            // $s7SwiftUI13ToolbarBridgeC20preferencesDidChange_7contextAA0C0O7UpdatesVAA16PreferenceValuesV_AG13UpdateContextVntFyxXEfU0_TA
            /*
             strategy -> x0 -> sp + 0x48 
             self -> x1 -> x23 -> sp + 0x60
             preferences -> x2 -> x19
             updates -> x3 -> x22 -> sp + 0x68
             !toolbarMatches -> w4 -> sp + 0x38
             toolbarStorage -> x5 -> sp + 0x40
             context -> x6 -> sp + 0x30
             */
            self.adaptorTracker.didChange(preferences) { storage in
                // $s7SwiftUI13ToolbarBridgeC20preferencesDidChange_7contextAA0C0O7UpdatesVAA16PreferenceValuesV_AG13UpdateContextVntFyxXEfU0_yAA30UINavigationItemAdaptorStorageVXEfU_TA
                self.navigationAdaptor = storage
            }
            
            guard self.allowsUpdates else {
                return
            }
            
            // <+276>
            self.searchTracker.didChange(preferences) { item in
                // $s7SwiftUI13ToolbarBridgeC20preferencesDidChange_7contextAA0C0O7UpdatesVAA16PreferenceValuesV_AG13UpdateContextVntFyxXEfU0_yAA0C7StorageV10SearchItemVSgXEfU0_TA
                // self, strategy, updates
                self.searchItem = item
                guard strategy.updateSearch() else {
                    return
                }
                
                updates.set.update(with: .search)
            }
            
            // <+392>
            if !toolbarMatches {
                // <+412>
                // x26
                let barContext = strategy.makeBarContext(storage: toolbarStorage, preferences: preferences)
                // x27
                let copy_1 = context
                self.lastBarContext = barContext
                
                // <+568>
                updateStorage(newStorage: toolbarStorage, barContext: barContext, updateContext: context, strategy: strategy)
                
                let locations = strategy.updateLocations()
                fatalError("TODO")
                // <+640>, <+676> 놓치면 안 됨
            }
            
            // <+688>
            fatalError("TODO")
        }
        
        return updates
    }
    
    fileprivate final func updateStorage(newStorage: ToolbarStorage, barContext: Toolbar.BarContext, updateContext: Toolbar.UpdateContext, strategy: T) {
        fatalError("TODO")
    }
}
