// 558B6B1E48F37C8B0E16B128287879E0
private import MySwiftUICore

extension ToolbarBridge {
    func preferencesDidChange(_ preferences: PreferenceValues, context: consuming Toolbar.UpdateContext) -> Toolbar.Updates {
        /*
         self -> x20 -> x22
         context -> x1 -> sp + 0xb0
         preferences -> x0 -> x20
         */
        // sp + 0x118
        var updates = Toolbar.Updates(
            locations: [],
            flag1: false,
            flag2: false,
            flag3: false,
            navigationProperties: Toolbar.Updates.NavigationProperties(flag: false)
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
                
                updates.locations.update(with: .search)
            }
            
            // <+392>
            if !toolbarMatches {
                // <+412>
                // x26
                let barContext = strategy.makeBarContext(storage: toolbarStorage, preferences: preferences)
                self.lastBarContext = barContext
                
                // <+568>
                updateStorage(newStorage: toolbarStorage, barContext: barContext, updateContext: context, strategy: strategy)
                // x20
                let locations = strategy.updateLocations()
                updates.locations = locations
                updates.flag2 = true
                
                let isAnimated: Bool
                if let lastToolbarStorage {
                    isAnimated = lastToolbarStorage.isAnimated
                } else {
                    isAnimated = false
                }
                updates.flag1 = isAnimated
            }
            
            // <+688>
            navigationPropertiesTracker.didChange(preferences) { properties in
                // $s7SwiftUI13ToolbarBridgeC20preferencesDidChange_7contextAA0C0O7UpdatesVAA16PreferenceValuesV_AG13UpdateContextVntFyxXEfU0_yAA0C7StorageV20NavigationPropertiesVSgXEfU1_TA
                /*
                 properties -> x0 -> x22
                 self -> x1 -> x21
                 updates -> x2 -> x19
                 strategy -> x3 -> x20
                 */
                self.lastNavigationProperties = properties
                updates.navigationProperties = strategy.updateProperties()
            }
            
            // <+792>
            // 검증 용 - 지워야함
            assert(updates.flag1 == false)
            assert(updates.flag2 == true)
            assert(updates.flag3 == true)
            assert(updates.navigationProperties.flag == true)
            fatalError()
            
            strategy.willReturnUpdates(updates, preferences: preferences)
        }
        
        return updates
    }
    
    fileprivate final func updateStorage(newStorage: ToolbarStorage, barContext: Toolbar.BarContext, updateContext: borrowing Toolbar.UpdateContext, strategy: T) {
        /*
         self -> x20 -> x22
         newStorage -> x0 -> x20
         barContext -> x1 -> sp + 0x20
         updateContext -> x2 -> x23
         strategy -> x3 -> sp + 0x28
         */
        // x24 -> sp + 0x1a8
        var dictionary: [Toolbar.BarLocation: Toolbar.LocationStorage] = .init()
        // sp + 0x160 (x29 - 0xf0)
        let copy_1 = newStorage
        // sp + 0xa0
        let copy_2 = newStorage
        copy_1.removeRequestedDefaultItems()
        
        // x20, sp + 0xa0
        var locations = Toolbar.BarLocation.allCases
        locations.append(contentsOf: updateContext.accessoryBarLocations)
        
        for location in locations {
            /*
             self -> x22 -> x23 -> sp + 0x18
             newStorage -> x20 -> x24 -> sp + 0x10
             location -> sp + 0x120
             */
            // x27
            let allowedLocations = self.allowedLocations
            
            guard let index = allowedLocations.firstIndex(of: location) else {
                continue
            }
            
            // <+420>
            // sp + 0xf8
            let allowedLocation = allowedLocations[index]
            // sp + 0xa0
            let copy_2 = allowedLocation
            // sp + 0xc8
            let copy_3 = location
            
            guard copy_2 == copy_3 else {
                continue
            }
            
            // <+1220>
            // sp + 0x1b0
            let copy_4 = copy_1
            
            // <+1244>
            // x22
            let items = self.filterAndSortMatchingItems(in: location, newStorage: copy_4, context: barContext)
            // x21
            let entries = strategy.makeEntries(in: location, from: items)
            // x23
            var storage = self.makeStorage(in: location, from: entries, strategy: strategy)
            strategy.willSetStorage(&storage, in: location, from: items)
            
            dictionary[copy_2] = storage
        }
        
        // <+1504>
        self.storageByLocation = dictionary
    }
    
    fileprivate final func filterAndSortMatchingItems(in location: Toolbar.BarLocation, newStorage: ToolbarStorage, context: Toolbar.BarContext) -> [ToolbarStorage.Entry] {
        /*
         location -> x0 -> x27
         newStorage -> x1 -> x20
         context -> x2 -> x19
         */
        // <+316>
        // sp + 0x1b38 (x29 - 0x68)
        var entries: [ToolbarStorage.Entry] = []
        // sp + 0x1b30
        var dictionary: [ToolbarStorage.Entry.ID: Int] = .init()
        // x23
        let toolbarEntries = newStorage.toolbarEntries
        
        // <+340>
        if !toolbarEntries.isEmpty {
            // <+360>
            fatalError("TODO")
        }
        
        // <+1784>
        entries.sort(priorities: dictionary)
        return entries
    }
    
    fileprivate final func makeStorage(in location: Toolbar.BarLocation, from entries: [ToolbarStorage.Entry], strategy: T) -> Toolbar.LocationStorage {
        /*
         self -> x20
         location -> x0 -> x23
         entries -> x1 -> sp + 0x1cc0
         strategy -> x2 -> sp + 0x1c80
         */
        // x25, x22, x19
        let storage: Toolbar.LocationStorage
        if let _storage = storageByLocation[location] {
            storage = _storage
        } else {
            storage = Toolbar.LocationStorage(entryIDs: [], entries: [:], vendedItems: [:])
        }
        
        // <+1040>
        fatalError("TODO")
    }
}

extension Array where Element == ToolbarStorage.Entry {
    mutating func sort(priorities: [ToolbarStorage.Entry.ID: Int]) {
        sort { _, _ in
            fatalError("TODO")
        }
    }
}
