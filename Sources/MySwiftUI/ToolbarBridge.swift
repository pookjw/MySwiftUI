// A409749AC298CF150D90E447BB4FA064
internal import MySwiftUICore
internal import Foundation

@MainActor final class ToolbarBridge<T>: NSObject {
    private var platformVended = Toolbar.PlatformVended() // 0xcc8
    private var lastToolbarStorage: ToolbarStorage? = nil // 0x498
    private var lastInputToolbarStorage: ToolbarStorage? = nil // 0x4a0
    private var searchItem: ToolbarStorage.SearchItem? = nil // 0xcd0
    private var navigationAdaptor = UINavigationItemAdaptorStorage() // 0xcd8
    private var lastNavigationProperties: ToolbarStorage.NavigationProperties? = nil // 0xce0
    private var lastInputNavigationProperties: ToolbarStorage.NavigationProperties? = nil // 0xce8
    private var lastBarContext: Toolbar.BarContext? = nil // 0xcf0
    private var lastEnvironment = EnvironmentValues() // 0xcf8
    private var allowedLocations = Set<Toolbar.BarLocation>(Toolbar.BarLocation.allCases) // 0xd00
    private var accessoryBarLocations: [Toolbar.BarLocation] = [] // 0xd08
    private var toolbarTracker = VersionSeedTracker<ToolbarKey>(seed: .invalid) // 0x4a8
    private var searchTracker = VersionSeedTracker<SearchKey>(seed: .invalid) // 0x4b0
    private var navigationPropertiesTracker = VersionSeedTracker<NavigationPropertiesKey>(seed: .invalid) // 0x4b8
    private var navigationTitleTracker = VersionSeedTracker<NavigationTitleKey>(seed: .invalid) // 0x4c0
    private var adaptorTracker = VersionSeedTracker<UINavigationItemAdaptorKey>(seed: .invalid) // 0x4c8
    private var lastNavigationSeed = VersionSeed.invalid // 0x4d0
    private var storageByLocation: [Toolbar.BarLocation: Toolbar.LocationStorage] = .init() // 0x4d8
    
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
    
    fileprivate func adoptUpdates<Content: View>(_: Toolbar.Updates, hostingController: UIHostingController<Content>, context: Toolbar.UpdateContext) {
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
        let updates = preferencesDidChange(preferences, context: context)
        
        adoptUpdates(updates, hostingController: hostingController, context: context)
    }
    
    func preferencesDidChange(_: PreferenceValues, context: __owned Toolbar.UpdateContext) -> Toolbar.Updates {
        fatalError("TODO")
    }
    
    // TODO
}

struct ToolbarKey: HostPreferenceKey {
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

struct SearchKey: HostPreferenceKey {
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
