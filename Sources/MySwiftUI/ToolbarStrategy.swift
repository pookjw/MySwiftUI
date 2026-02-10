protocol ToolbarStrategy: ToolbarNamespace {
    var updater: ToolbarBridge<Self>? { get set }
    var updateContext: Toolbar.UpdateContext? { get set }
    
    init()
    
    func makeContent(entry: ToolbarStorage.Entry) -> (String, Toolbar.VendedItem?)
    func updateVended(_ vended: Toolbar.VendedItem, to entry: ToolbarStorage.Entry)
    func makeEntries(in location: Toolbar.BarLocation, from entries: [ToolbarStorage.Entry]) -> [ToolbarStorage.Entry]
    func updateLocations() -> Set<Toolbar.BarLocation>
    func updateSearch() -> Bool
    func updateProperties() -> Toolbar.Updates.NavigationProperties
    func willSetStorage(_ storage: inout Toolbar.LocationStorage, in location: Toolbar.BarLocation, from entries: [ToolbarStorage.Entry])
    func willReturnUpdates(_ updates: Toolbar.Updates, preferences: PreferenceValues)
}

extension ToolbarStrategy {
    func makeBarContext(storage: ToolbarStorage, preferences: PreferenceValues) -> Toolbar.BarContext {
        fatalError("TODO")
    }
    
    func withUpdate<T>(_ block: (ToolbarBridge<Self>, Toolbar.UpdateContext) -> T) -> T {
        guard let updater else {
            fatalError()
        }
        
        guard let updateContext else {
            fatalError("Attempted to update outside withUpdater() call")
        }
        
        return block(updater, updateContext)
    }
    
    static func withUpdater<T>(_ bridge: ToolbarBridge<Self>, _ context: Toolbar.UpdateContext, body: (Self) -> T) -> T {
        /*
         bridge -> x0 -> x27
         context -> x1 -> x24
         body -> x2/x3 -> sp + 0x18/sp + 0xe0
         */
        // x25
        var strategy = Self.init()
        strategy.updater = bridge
        strategy.updateContext = context
        
        return body(strategy)
    }
}
