// A409749AC298CF150D90E447BB4FA064
internal import MySwiftUICore
internal import Foundation
private import _MySwiftUIShims
internal import _MySwiftUIShims

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
        /*
         self -> x20 -> x29 - 0x160
         environment -> x0 -> x20
         return pointer -> x8 -> x29 - 0x68
         context -> x1 -> x29 - 0x168
         */
        defer {
            self.lastEnvironment = environment
        }
        
        // <+768>
        // x29 - 0x108
        let updates = Toolbar.Updates(locations: [], flag1: false, flag2: false, navigationProperties: [])
        // x23
        var copy_1 = context
        // x28
        let horizontalSizeClass = environment.horizontalSizeClass
        copy_1.horizontalSizeClass = horizontalSizeClass
        // environment -> x29 - 0x168
        // x28
        let verticalSizeClass = environment.verticalSizeClass
        // self -> x27
        copy_1.verticalSizeClass = verticalSizeClass
        
        // <+884>
        if allowsUpdates {
            // x21
            if let horizontalSizeClass = lastEnvironment.horizontalSizeClass {
                // <+1388>
                if horizontalSizeClass != environment.horizontalSizeClass {
                    // <+1928>
                    fatalError("TOCO")
                }
            }
        }
        
        // <+996>
        // x29 - 0x140 (x19)
        var copy_2 = copy_1.overrides
        // environment -> x29 - 0x168 -> x25
        if (copy_2.navigation ?? copy_1.navigationController) != nil {
            // <+1076>
            // x19
            let uiSafeAreaTransitionState = self.uiSafeAreaTransitionState
            environment.safeAreaTransitionState = uiSafeAreaTransitionState
        }
        
        // <+1152>
        // x19
        let uiInputAccessoryGenerator = self.uiInputAccessoryGenerator
        environment.inputAccessoryGenerator = uiInputAccessoryGenerator
        
        // <+1248>
        return updates
    }
    
    var uiSafeAreaTransitionState: ToolbarSafeAreaTransitionState {
        return platformVended.uiSafeAreaTransitionState
    }
    
    var uiInputAccessoryGenerator: InputAccessoryGenerator? {
        return platformVended.uiInputAccessoryGenerator
    }
    
    @inline(__always)
    func layout() {
        guard let uiToolbar = platformVended.uiToolbar else {
            return
        }
        
        // $s7SwiftUI19UIHostingControllerC21layoutToolbarIfNeeded33_1D3224F5185670D36FFEB48E24E43C4FLLyyF (<+88>)
        fatalError("TODO")
    }
    
    fileprivate func adoptUpdates<Content: View>(
        _ updates: Toolbar.Updates,
        hostingController: UIHostingController<Content>,
        context: Toolbar.UpdateContext
    ) {
        /*
         updates.location -> x0 -> x29 - 0xb8
         updates.flag1/flag2/navigationProperties -> x1 -> x25
         hostingController -> x2 -> x26
         context -> x3 -> x23 -> x29 - 0xd0
         */
        let w28: Bool
        if updates.flag2 && !self.navigationAdaptor.adaptors.isEmpty {
            // <+104>
            fatalError("TODO")
        } else {
            // <+240>
            w28 = false
            // <+244>
        }
        
        // <+244>
        // x29 - 0xb0 (x19)
        let copy_1 = context
        
        // w19
        let isFromMySwiftUI: Bool
        if let navigationController = copy_1.overrides.navigation ?? copy_1.navigationController {
            isFromMySwiftUI = type(of: navigationController)._isFromMySwiftUI()
        } else {
            isFromMySwiftUI = false
        }
        
        // <+324>
        var w27 = false
        if isLinkedOnOrAfter(.v6_4) && isFromMySwiftUI {
            // <+356>
            w27 = allowsUpdates
        }
        
        // <+364>
        // x21
        let navigationItem = hostingController.navigationItem
        // x27
        let uiNavigationItem = self.platformVended.uiNavigationItem
        
        // <+428>
        // inlined
        navigationItem.adoptNavigationItem(uiNavigationItem, updates: updates, forceUpdate: w27, isFromSwiftUI: isFromMySwiftUI)
        
        // <+1092>
        if updates.navigationProperties.contains(.unknown0) {
            // <+1100>
            if !self.navigationAdaptor.adaptors.isEmpty {
                fatalError("TODO")
            }
        }
        
        // <+1192>
        if isLinkedOnOrAfter(.v7) && updates.flag1 {
            // <+1272>
            fatalError("TODO")
        } else {
            // <+1428>
            var _updates = updates
            _updates.navigationProperties = updates.navigationProperties.intersection(Toolbar.Updates.NavigationProperties(rawValue: 0x01))
            adoptSystemUpdates(_updates, hostingController: hostingController, context: context)
        }
    }
    
    fileprivate func adoptSystemUpdates<Content: View>(_ updates: Toolbar.Updates, hostingController: UIHostingController<Content>, context: Toolbar.UpdateContext) {
        /*
         updates.locations -> x0 -> x21
         updates.flag1/flag2/navigationProperties -> x1 -> x22
         hostingController -> x2 -> x19
         */
        if updates.locations.contains(.navigationSplitViewLeading) || updates.locations.contains(.navigationSplitViewTrailing) {
            // <+144>
            fatalError("TODO")
        }
        
        // <+160>
        if updates.locations.contains(.bottomBar) {
            // <+208>
            hostingController.toolbarItems = platformVended.uiToolbarItems
        }
        
        // <+320>
        if updates.flag2 {
            // <+324>
            updateToolbarVisibility(hostingController: hostingController)
            updateBottomOrnamentVisibility(hostingController: hostingController)
        }
        
        // <+340>
        if updates.locations.contains(._tabViewSidebarOverflowMenu) || updates.locations.contains(._tabViewSidebarBottomBar) {
            // <+436>
            updateTabBarSidebar(hostingController: hostingController, updates: updates)
        }
        
        // <+452>
    }
    
    fileprivate func updateToolbarVisibility<Content: View>(hostingController: UIHostingController<Content>) {
        /*
         hostingController -> x0 -> x19
         */
        guard let uiToolbar = platformVended.uiToolbar else {
            return
        }
        
        fatalError("TODO")
    }
    
    fileprivate func updateBottomOrnamentVisibility<Content: View>(hostingController: UIHostingController<Content>) {
        /*
         hostingController -> x0 -> x19
         */
        guard let bottomOrnament = platformVended.bottomOrnament else {
            return
        }
        
        fatalError("TODO")
    }
    
    fileprivate func updateTabBarSidebar<Content: View>(hostingController: UIHostingController<Content>, updates: Toolbar.Updates) {
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
    
    var navigationProperties: ToolbarStorage.NavigationProperties? {
        // <+228>
        // x27
        let copy_1 = lastNavigationProperties
        // x22
        let copy_2 = copy_1
        // x22 + x25
        let copy_3 = lastInputNavigationProperties
        
        let x24 = (copy_2 == nil)
        let x20 = (copy_3 == nil)
        
        if x24 {
            // <+408>
            if x20 {
                // <+536>
                return nil
            } else {
                // <+512>
                fatalError("TODO")
            }
        } else {
            // <+428>
            fatalError("TODO")
        }
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
                        return strategy.updateKeyboardBar()
                    }
                },
                Toolbar.BarLocation.keyboardBar
            ),
            
            (
                {
                    @Sendable (_ strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu29_Sbycfu30_TA
                        return strategy.updateBottomOrnament()
                    }
                },
                Toolbar.BarLocation.bottomOrnament
            ),
            
            (
                {
                    @Sendable (_ strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu31_Sbycfu32_TA
                        return strategy.updateTabSidebarOverflowMenu()
                    }
                },
                Toolbar.BarLocation._tabViewSidebarOverflowMenu
            ),
            
            (
                {
                    @Sendable (strategy: UIKitToolbarStrategy) in
                    return { () -> Bool in
                        // $s7SwiftUI20UIKitToolbarStrategyV15updateLocationsShyAA0D0O11BarLocationOGyFSbycACYbcfu33_Sbycfu34_TA
                        return strategy.updateTabBottomBarEntry(placement: ._tabViewSidebarBottomBar)
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
        guard _SemanticFeature<Semantics_v4>.isEnabled else {
            return []
        }
        
        let flag1 = updateTitleMenuProvider()
        var w21: UInt8 = flag1 ? 2 : 0
        let flag2 = updateHeaderProperties()
        w21 = (w21 & ~1) | (flag2 ? 1 : 0)
        let flag3 = updateRenameDelegate()
        let w8 = w21 | 4
        let w0 = flag3 ? w8 : w21
        return Toolbar.Updates.NavigationProperties(rawValue: w0)
    }
    
    func willSetStorage(_ storage: inout Toolbar.LocationStorage, in location: Toolbar.BarLocation, from entries: [ToolbarStorage.Entry]) {
        // nop
    }
    
    func willReturnUpdates(_ updates: Toolbar.Updates, preferences: PreferenceValues) {
        /*
         self -> x20 -> x19
         updates.locations -> x0 -> x25
         updates.flag1/2/navigationProperties -> x1 (안 씀)
         preferences -> x2 (안 씀)
         */
        return withUpdate { bridge, context in
            // <+372>
            let w28: Bool
            if (context.overrides.navigation ?? context.navigationController) != nil {
                // <+460>
                w28 = false
            } else {
                // <+1236>
                w28 = true
            }
            
            // <+468>
            if updates.locations.contains(.bottomBar) {
                // <+716>
                let w8 = (bridge.platformVended.uiToolbar != nil) ? w28 : true
                if w8 {
                    // <+568>
                    // x27
                    let copy_1 = context
                    // <+620>
                    bridge.platformVended.uiToolbar = nil
                    // <+1196>
                } else {
                    // <+772>
                    fatalError("TODO")
                }
            } else {
                // <+520>
                fatalError("TODO")
            }
            
            // <+1196>
            updateBottomOrnamentIfNeeded()
        }
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
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV22updateHeaderProperties33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_
            // bridge -> x0 -> x22
            // <+736>
            // x21
            let navigationProperties = bridge.navigationProperties
            // x25
            let copy_1 = bridge.lastEnvironment
            // x24
            let copy_2 = navigationProperties
            
            if let copy_2 {
                // <+916>
                fatalError("TODO")
            }
            
            // <+1140>
            // x23
            let copy_3 = copy_2
            
            if let copy_3 {
                // <+1224>
                fatalError("TODO")
            }
            
            // <+1292>
            bridge.platformVended.uiNavigationItem.documentProperties = nil
            return true
        }
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
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV23updateTitleMenuProvider33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_
            // self -> x0 -> x20
            // x21
            let navigationProperties = bridge.navigationProperties
            
            if let titleMenuProvider = bridge.platformVended.uiNavigationItem.titleMenuProvider {
                // <+356>
                fatalError("TODO")
            } else {
                // <+328>
                // <+400>
                bridge.platformVended.uiNavigationItem.titleMenuProvider = nil
                return (bridge.platformVended.uiNavigationItem.titleMenuProvider != nil)
            }
        }
    }
    
    fileprivate func updateSplitControllerLeadingItems() -> Bool {
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
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV20updateRenameDelegate33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_
            // bridge -> x0 -> x25
            // <+416>
            // x24
            let renameDelegate = bridge.platformVended.uiNavigationItem.renameDelegate ?? bridge.platformVended.uiNavigationItem._objc_renameDelegate
            // <+512>
            // x22
            if let navigationProperties = bridge.navigationProperties {
                // <+604>
                fatalError("TODO")
            } else {
                // <+552>
                // <+680>
            }
            
            // <+680>
            if let navigationProperties = bridge.navigationProperties {
                // <+768>
                fatalError("TODO")
            } else {
                // <+740>
                // <+1036>
            }
            
            // <+1036>
            bridge.platformVended.uiNavigationItem.renameDelegate = nil
            
            if (renameDelegate != nil) {
                // <+1072>
                return true
            } else {
                // <+1300>
                return false
            }
        }
    }
    
    fileprivate func updateTabBottomBarEntry(placement: Toolbar.BarLocation) -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV23updateTabBottomBarEntry33_A409749AC298CF150D90E447BB4FA064LL9placementSbAA0D0O0I8LocationO_tFSbAA0D6BridgeCyACG_AH13UpdateContextVtXEfU_TA
            /*
             bridge -> x0 -> x20
             placement -> x2 -> x23
             return pointer -> x8 -> x21
             */
            // <+1084>
            // x29 - 0x80
            let copy_1 = placement
            guard copy_1 == ._tabViewSidebarBottomBar else {
                return false
            }
            
            // <+1108>
            // x22
            let old = bridge.platformVended.uiTabViewSidebarBottomBarItem
            // x19
            let entries = bridge.entries(in: placement)
            
            // x22
            var new: ToolbarStorage.Item?
            if !entries.isEmpty {
                // <+1272>
                fatalError("TODO")
            } else {
                new = nil
            }
            
            // <+2100>
            if let old {
                // <+2420>
                fatalError("TODO")
            } else {
                // <+2296>
                // <+3036>
                if placement == ._tabViewSidebarBottomBar {
                    // <+3100>
                    bridge.platformVended.uiTabViewSidebarBottomBarItem = new
                }
                
                // <+3240>
                return new != nil
            }
        }
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
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV17updateKeyboardBar33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_
            /*
             bridge -> x0 -> x22
             context -> x1 -> x21
             */
            // x29 - 0x48
            var barItems: [UIBarButtonItem] = []
            // x24
            let copy_1 = context
            // x25
            let targetController = copy_1.targetController
            let w26 = (targetController != nil)
            
            bridge.adjustEntries(in: .keyboardBar) { _, _ in
                fatalError("TODO")
            }
            
            let uiInputAccessoryGenerator: InputAccessoryGenerator
            if let _uiInputAccessoryGenerator = bridge.platformVended.uiInputAccessoryGenerator {
                uiInputAccessoryGenerator = _uiInputAccessoryGenerator
            } else {
                uiInputAccessoryGenerator = InputAccessoryGenerator()
                bridge.platformVended.uiInputAccessoryGenerator = uiInputAccessoryGenerator
            }
            
            // <+324>
            uiInputAccessoryGenerator.barItems = barItems
            return true
        }
    }
    
    fileprivate func updateBottomOrnament() -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV20updateBottomOrnament33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_TA
            // x21
            let items = makeOrnamentItems()
            bridge.platformVended.ornamentItems = items
            return true
        }
    }
    
    fileprivate func updateTabSidebarOverflowMenu() -> Bool {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV28updateTabSidebarOverflowMenu33_A409749AC298CF150D90E447BB4FA064LLSbyFSbAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_TA
            // x21
            let old = bridge.platformVended.uiTabViewSidebarOverflowItems
            // x23 -> x20
            guard let new = self.barButtonItems(in: ._tabViewSidebarOverflowMenu) as? [UIKitBarButtonItem] else {
                return false
            }
            
            // <+160>
            bridge.platformVended.uiTabViewSidebarOverflowItems = new
            // x22
            let newEndIndex = new.endIndex
            
            if newEndIndex < 1 {
                // <+248>
                return old.endIndex > 0
            } else {
                // <+216>
                return true
            }
        }
    }
    
    fileprivate func barButtonItems(in location: Toolbar.BarLocation) -> [UIBarButtonItem] {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV14barButtonItems33_A409749AC298CF150D90E447BB4FA064LL2inSaySo05UIBarG4ItemCGAA0D0O11BarLocationO_tFAiA0D6BridgeCyACG_AK13UpdateContextVtXEfU_TA
            /*
             location -> x2 -> x22
             */
            // x25
            let copy_1 = context
            // x23 -> x29 - 0x50
            guard let targetController = copy_1.targetController else {
                return []
            }
            
            // <+152>
            var x290x48: UInt8 = 2
            // x29 - 0x58
            var results: [UIBarButtonItem] = []
            if location == .navigationBarLeading {
                x290x48 = 0
            }
            
            // <+228>
            let entryCount = bridge.entryCount(in: location) - 1
            bridge.adjustEntries(in: location) { _, _ in
                fatalError("TODO")
            }
            
            return results
        }
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
            if !storage.entries.isEmpty {
                // <+268>
                fatalError("TODO")
            }
            
            // <+848>
            bridge.storageByLocation[.bottomBar] = storage
        }
        
        guard !array2.isEmpty else {
            return Array(array1)
        }
        
        // <+84>
        fatalError("TODO")
    }
    
    fileprivate func makeOrnamentItems() -> [ToolbarStorage.Item] {
        return withUpdate { bridge, context in
            // $s7SwiftUI20UIKitToolbarStrategyV17makeOrnamentItemsSayAA0D7StorageV4ItemVGyFyAA0D6BridgeCyACG_AA0D0O13UpdateContextVtXEfU_
            // x19
            guard let storage = bridge.storageByLocation[.bottomOrnament] else {
                return []
            }
            
            // <+364>
            guard !storage.entryIDs.isEmpty else {
                return []
            }
            
            fatalError("TODO")
        }
    }
    
    fileprivate func updateBottomOrnamentIfNeeded() {
        // x21
        let items = makeOrnamentItems()
        if !items.isEmpty {
            createBottomOrnamentIfNeeded()
        }
        
        // <+208>
        withUpdate { bridge, context in
            if let bottomOrnament = bridge.platformVended.bottomOrnament {
                // <+292>
                fatalError("TODO")
            }
            
            // <+524>
        }
    }
    
    fileprivate func createBottomOrnamentIfNeeded() {
        fatalError("TODO")
    }
}

final class ToolbarSafeAreaTransitionState: SafeAreaTransitionState {
    fileprivate var count: Int // 0x10
    
    var isActive: Bool {
        return count > 0
    }
    
    init() {
        count = 0
    }
}

extension EnvironmentValues {
    fileprivate var inputAccessoryGenerator: InputAccessoryGenerator? {
        get {
            return self[InputAccessoryKey.self].base
        }
        set {
            self[InputAccessoryKey.self] = WeakBox(newValue)
        }
    }
    
    fileprivate struct InputAccessoryKey: EnvironmentKey {
        @safe static nonisolated(unsafe) let defaultValue = WeakBox<InputAccessoryGenerator>(nil)
    }
}
