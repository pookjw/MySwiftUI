// A409749AC298CF150D90E447BB4FA064
internal import MySwiftUICore
internal import Foundation

final class ToolbarBridge<T: ToolbarStrategy>: NSObject {
    var platformVended = Toolbar.PlatformVended() // 0xb28
    private var lastToolbarStorage: ToolbarStorage? = nil // 0x2f8
    private var lastInputToolbarStorage: ToolbarStorage? = nil // 0x300
    private(set) var searchItem: ToolbarStorage.SearchItem? = nil // 0xb30
    private var navigationAdaptor = UINavigationItemAdaptorStorage() // 0xb38
    private var lastNavigationProperties: ToolbarStorage.NavigationProperties? = nil // 0xb40
    private var lastInputNavigationProperties: ToolbarStorage.NavigationProperties? = nil // 0xb48
    private var lastBarContext: Toolbar.BarContext? = nil // 0xb50
    private var lastEnvironment = EnvironmentValues() // 0xb58
    private var allowedLocations = Set<Toolbar.BarLocation>(Toolbar.BarLocation.allCases) // 0xb60
    private var accessoryBarLocations: [Toolbar.BarLocation] = [] // 0xb68
    private var toolbarTracker = VersionSeedTracker<ToolbarKey>(seed: .invalid) // 0x308
    private var searchTracker = VersionSeedTracker<SearchKey>(seed: .invalid) // 0x310
    private var navigationPropertiesTracker = VersionSeedTracker<NavigationPropertiesKey>(seed: .invalid) // 0x318
    private var navigationTitleTracker = VersionSeedTracker<NavigationTitleKey>(seed: .invalid) // 0x320
    private var adaptorTracker = VersionSeedTracker<UINavigationItemAdaptorKey>(seed: .invalid) // 0x328
    private var lastNavigationSeed = VersionSeed.invalid // 0x330
    private var storageByLocation: [Toolbar.BarLocation: Toolbar.LocationStorage] = .init() // 0x338
    
    override init() {
        super.init()
    }
    
    static func update<Content: View>(environment: inout EnvironmentValues, toolbarBridge: ToolbarBridge<T>?, hostingController: UIHostingController<Content>) {
        /*
         environment -> x19
         toolbarBridge -> x20
         hostingController -> x25
         */
        // x23
        let context = Toolbar.UpdateContext(hostingController: hostingController)
        
        if let toolbarBridge {
            let updates = toolbarBridge.update(environment: &environment, context: context)
            toolbarBridge.adoptUpdates(updates, hostingController: hostingController, context: context)
        }
        
        // <+280>
        environment.toolbarUpdateContext = context
    }
    
    func viewWillAppear<Content: View>(hostingController: UIHostingController<Content>) {
        fatalError("TODO")
    }
    
    func safeAreaDidChange<Content: View>(hostingController: UIHostingController<Content>) {
        fatalError("TODO")
    }
    
    func update(environment: inout EnvironmentValues, context: Toolbar.UpdateContext) -> Toolbar.Updates {
        fatalError("TODO")
    }
    
    fileprivate func adoptUpdates<Content: View>(_ updates: Toolbar.Updates, hostingController: UIHostingController<Content>, context: Toolbar.UpdateContext) {
        fatalError("TODO")
    }
    
    func preferencesDidChange<Content>(_ preferences: PreferenceValues, hostingController: UIHostingController<Content>) {
        /*
         hostingController -> x1 -> x21
         preferences -> x0 -> x22
         */
        // x24
        let context = Toolbar.UpdateContext(hostingController: hostingController)
        // x23
        let copy_1 = context
        // x22
        let updates = preferencesDidChange(preferences, context: copy_1)
        
        adoptUpdates(updates, hostingController: hostingController, context: copy_1)
    }
    
    func preferencesDidChange(_ preferences: PreferenceValues, context: consuming Toolbar.UpdateContext) -> Toolbar.Updates {
        /*
         self -> x20 -> x22
         context -> x1 -> sp + 0xb0
         context -> x0 -> x20
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
                let context = strategy.makeBarContext(storage: toolbarStorage, preferences: preferences)
                // x27
                let copy_1 = context
                self.lastBarContext = copy_1
                
                // <+568>
                fatalError("TODO")
                // <+640>, <+676> 놓치면 안 됨
            }
            
            // <+688>
            fatalError("TODO")
        }
        
        return updates
    }
    
    final var toolbarStorage: ToolbarStorage? {
        /*
         return pointer -> x8 -> x19
         self.lastToolbarStorage (pointer) -> x8
         */
        // sp + 0xf0
        let lastToolbarStorage = lastToolbarStorage
        // sp + 0x140
        let lastInputToolbarStorage = lastInputToolbarStorage
        
        // <+112>
        if let lastToolbarStorage {
            if let lastInputToolbarStorage {
                // <+140>
                // 둘이 합쳐서 반환하는 것 같음
                fatalError("TODO")
            } else {
                // <+556>
                return lastToolbarStorage
            }
        } else {
            // <+476>
            if let lastInputToolbarStorage {
                // <+484>
                return lastInputToolbarStorage
            } else {
                // <+628>
                return nil
            }
        }
    }
    
    final var allowsUpdates: Bool {
        var result = true
        
        for adaptor in navigationAdaptor.adaptors {
            fatalError("TODO")
        }
        
        return result
    }
    
    // TODO
}

extension ToolbarBridge: ToolbarNamespace {
}

struct ToolbarKey: HostPreferenceKey {
    static nonisolated(unsafe) let defaultValue = ToolbarStorage(
        identifier: nil,
        selection: nil,
        isAnimated: false,
        entries: [],
        shouldPlaceDefaultNavigationItems: true,
        requestedRemovedDefaultItems: []
    )
    
    static func reduce(value: inout ToolbarStorage, nextValue: () -> ToolbarStorage) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

struct SearchKey: HostPreferenceKey {
    static nonisolated(unsafe) let defaultValue: ToolbarStorage.SearchItem? = nil
    
    static func reduce(value: inout ToolbarStorage.SearchItem?, nextValue: () -> ToolbarStorage.SearchItem?) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

struct NavigationPropertiesKey: HostPreferenceKey {
    static var defaultValue: Never {
        fatalError("TODO")
    }
    
    static func reduce(value: inout Never, nextValue: () -> Never) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

struct UINavigationItemAdaptorKey: HostPreferenceKey {
    static nonisolated(unsafe) let defaultValue = UINavigationItemAdaptorStorage()
    
    static func reduce(value: inout UINavigationItemAdaptorStorage, nextValue: () -> UINavigationItemAdaptorStorage) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}
