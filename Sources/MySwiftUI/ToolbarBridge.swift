// A409749AC298CF150D90E447BB4FA064
internal import MySwiftUICore
internal import Foundation

final class ToolbarBridge<T: ToolbarStrategy>: NSObject {
    var platformVended = Toolbar.PlatformVended() // 0xb28
    var lastToolbarStorage: ToolbarStorage? = nil // 0x2f8
    private(set) var lastInputToolbarStorage: ToolbarStorage? = nil // 0x300
    var searchItem: ToolbarStorage.SearchItem? = nil // 0xb30
    var navigationAdaptor = UINavigationItemAdaptorStorage() // 0xb38
    var lastNavigationProperties: ToolbarStorage.NavigationProperties? = nil // 0xb40
    private var lastInputNavigationProperties: ToolbarStorage.NavigationProperties? = nil // 0xb48
    var lastBarContext: Toolbar.BarContext? = nil // 0xb50
    var lastEnvironment = EnvironmentValues() // 0xb58
    var allowedLocations = Set<Toolbar.BarLocation>(Toolbar.BarLocation.allCases) // 0xb60
    private var accessoryBarLocations: [Toolbar.BarLocation] = [] // 0xb68
    var toolbarTracker = VersionSeedTracker<ToolbarKey>(seed: .invalid) // 0x308
    var searchTracker = VersionSeedTracker<SearchKey>(seed: .invalid) // 0x310
    var navigationPropertiesTracker = VersionSeedTracker<NavigationPropertiesKey>(seed: .invalid) // 0x318
    private var navigationTitleTracker = VersionSeedTracker<NavigationTitleKey>(seed: .invalid) // 0x320
    var adaptorTracker = VersionSeedTracker<UINavigationItemAdaptorKey>(seed: .invalid) // 0x328
    private var lastNavigationSeed = VersionSeed.invalid // 0x330
    var storageByLocation: [Toolbar.BarLocation: Toolbar.LocationStorage] = .init() // 0x338
    
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
    
    var toolbarStorage: ToolbarStorage? {
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
    
    var allowsUpdates: Bool {
        var result = true
        
        for adaptor in navigationAdaptor.adaptors {
            fatalError("TODO")
        }
        
        return result
    }
    
    func adjustEntries(in location: Toolbar.BarLocation, _ transform: (ToolbarStorage.Entry, inout Toolbar.VendedItem?) -> Void) {
        /*
         location -> x0 -> x21
         self -> x1 -> x19
         */
        // x23, x25, x26
        let storage = storageByLocation[location] ?? Toolbar.LocationStorage(entryIDs: [], entries: .init(), vendedItems: .init())
        // location -> x21 -> x29 - 0xeo
        // <+532>
        
        if !storage.entries.isEmpty {
            // <+540>
            fatalError("TODO")
        }
        
        // <+1692>
        storageByLocation[location] = storage
    }
    
    func entryCount(in location: Toolbar.BarLocation) -> Int {
        // location -> x0 -> x19
        let storage = storageByLocation[location] ?? Toolbar.LocationStorage(entryIDs: [], entries: [:], vendedItems: [:])
        return storage.entries.count
    }
    
    func entries(in location: Toolbar.BarLocation) -> [String: ToolbarStorage.Entry] {
        let storage = storageByLocation[location] ?? Toolbar.LocationStorage(entryIDs: [], entries: [:], vendedItems: [:])
        return storage.entries
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
    static nonisolated(unsafe) let defaultValue: ToolbarStorage.NavigationProperties? = nil
    
    static func reduce(value: inout ToolbarStorage.NavigationProperties?, nextValue: () -> ToolbarStorage.NavigationProperties?) {
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
