internal import UIKit

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
        /*
         storage -> x0 -> x23
         preferences -> x1 -> x22
         return register -> x8 -> x24
         */
        var result = Toolbar.BarContext(
            isCustomizable: storage.identifier != nil,
            hidesSystemItems: false,
            hasSystemItems: false, // 밑에 withUpdate에서 결정됨
            shouldOverrideDefaultPlacement: false,
            horizontalSizeClass: .regular,
            verticalSizeClass: .regular,
            automaticShouldPreferOrnament: false
        )
        
        withUpdate { bridge, context in
            // $s7SwiftUI15ToolbarStrategyPAAE14makeBarContext7storage11preferencesAA0C0O0fG0VAA0C7StorageV_AA16PreferenceValuesVtFyAA0C6BridgeCyxG_AH06UpdateG0VtXEfU_TA
            /*
             bridge -> x0 (안 씀)
             context -> x1 -> x22
             return register (result) -> x2 -> x23
             preferences -> x3 -> sp + 0x20
             storage -> x4 -> sp + 0x28
             */
            result.horizontalSizeClass = context.horizontalSizeClass
            result.verticalSizeClass = context.verticalSizeClass
            
            // w27
            let hasOrWillHaveSystemLeadingItems: Bool
            if let targetController = context.targetController {
                hasOrWillHaveSystemLeadingItems = targetController.hasOrWillHaveSystemLeadingItems(context)
            } else {
                hasOrWillHaveSystemLeadingItems = false
            }
            
            // <+260>
            assert(hasOrWillHaveSystemLeadingItems)
            fatalError()
            result.hasSystemItems = hasOrWillHaveSystemLeadingItems
            result.hidesSystemItems = preferences[NavigationBarBackButtonHiddenKey.self].value
            
            storage.placements
            fatalError("TODO")
        }
        
        return result
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

extension UIViewController {
    nonisolated func hasOrWillHaveSystemLeadingItems(_: Toolbar.UpdateContext) -> Bool {
        fatalError("TODO")
    }
}
