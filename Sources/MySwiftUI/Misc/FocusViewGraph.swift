@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph
private import UIKit

struct FocusViewGraph {
    @OptionalAttribute var focusedItem: FocusItem??
    @OptionalAttribute var focusedValues: FocusedValues?
    @OptionalAttribute var focusStore: FocusStore?
    @OptionalAttribute private var isFocusSystemEnabled: Bool?
    private var needsFocusUpdate: Bool
    private var wasFocusSystemEnabled: Bool
    private var needsFocusSystemEnabledUpdate: Bool
    
    init(graph: ViewGraph) {
        let oldSubgraph = Subgraph.current
        Subgraph.current = graph.globalSubgraph
        
        let focusedItem: OptionalAttribute<FocusItem?>
        let focusedValues: OptionalAttribute<FocusedValues>
        let focusStore: OptionalAttribute<FocusStore>
        let isFocusSystemEnabled: OptionalAttribute<Bool>
        let needsFocusUpdate = false
        let wasFocusSystemEnabled = false
        let needsFocusSystemEnabledUpdate = false
        
        if graph.requestedOutputs.isSuperset(of: .focus) {
            let focustedItemAttribute = Attribute<FocusItem?>(value: nil)
            CustomEventTrace.recordNamedProperty(.focustedItem, focustedItemAttribute)
            focusedItem = OptionalAttribute(focustedItemAttribute)
            
            let focusedValuesAttribute = Attribute(value: FocusedValues())
            CustomEventTrace.recordNamedProperty(.focustedValues, focusedValuesAttribute)
            focusedValues = OptionalAttribute(focusedValuesAttribute)
            
            let focusStoreAttribute = Attribute(value: FocusStore())
            CustomEventTrace.recordNamedProperty(.focusStore, focusStoreAttribute)
            focusStore = OptionalAttribute(focusStoreAttribute)
            
            _ = CoreTesting.isRunning
            isFocusSystemEnabled = OptionalAttribute(Attribute(value: false))
        } else {
            focusedItem = OptionalAttribute()
            focusedValues = OptionalAttribute()
            focusStore = OptionalAttribute()
            isFocusSystemEnabled = OptionalAttribute()
        }
        
        Subgraph.current = oldSubgraph
        self.needsFocusUpdate = needsFocusUpdate
        self.wasFocusSystemEnabled = wasFocusSystemEnabled
        self.needsFocusSystemEnabledUpdate = needsFocusSystemEnabledUpdate
        self._focusedItem = focusedItem
        self._focusedValues = focusedValues
        self._focusStore = focusStore
        self._isFocusSystemEnabled = isFocusSystemEnabled
    }
}

extension FocusViewGraph: ViewGraphFeature {
    func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        inputs.base[FocusedItemInputKey.self] = _focusedItem
        inputs.base[FocusedValuesInputKey.self] = _focusedValues
        inputs.base[FocusStoreInputKey.self] = _focusStore
        inputs.base[_GraphInputs.IsFocusSystemEnabledKey.self] = _isFocusSystemEnabled
    }
    
    func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func isHiddenForReuseDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        fatalError("TODO")
    }
    
    mutating func needsUpdate(graph: ViewGraph) -> Bool {
        let needsFocusUpdate = needsFocusUpdate
        
        if
            let delegate = graph.delegate,
            let uiView = delegate.uiView
        {
            let w8 = MainActor.assumeIsolated { UIFocusSystem.focusSystem(for: uiView) != nil }
            let w9 = (w8 || wasFocusSystemEnabled)
            self.needsFocusSystemEnabledUpdate = w9
            self.wasFocusSystemEnabled = w8
        }
        
        return needsFocusUpdate || needsFocusSystemEnabledUpdate
    }
    
    mutating func update(graph: ViewGraph) {
        if needsFocusUpdate {
            // <+164>
            needsFocusUpdate = false
            if let delegate = graph.delegate {
                if let focusHost = delegate.as(FocusHost.self) {
                    focusHost.focusDidChange()
                }
            }
        }
        
        // <+280>
        if
            needsFocusSystemEnabledUpdate,
            _isFocusSystemEnabled.base.identifier != .empty
        {
            // <+316>
            needsFocusSystemEnabledUpdate = false
            let wasFocusSystemEnabled = wasFocusSystemEnabled
            
            // OnFocusModifier
            graph.asyncTransaction(
                mutation: IsFocusSystemEnabledMutation(value: wasFocusSystemEnabled),
                style: .deferred
            )
        }
        
        // <+504>
    }
}

extension FocusViewGraph {
    fileprivate struct IsFocusSystemEnabledMutation: GraphMutation {
        var attr = WeakAttribute<Bool>()
        var value: Bool
        
        init(value: Bool) {
            self.value = value
        }
        
        func apply() {
            attr.projectedValue?.value = value
        }
        
        func combine<T>(with other: T) -> Bool where T : MySwiftUICore.GraphMutation {
            fatalError("TODO")
        }
    }
}

fileprivate struct FocusedItemInputKey: ViewInput {
    static var defaultValue: OptionalAttribute<FocusItem?> {
        return OptionalAttribute()
    }
}

struct FocusedValuesInputKey: ViewInput {
    static var defaultValue: OptionalAttribute<FocusedValues> {
        return OptionalAttribute()
    }
}

struct FocusStoreInputKey: ViewInput {
    static var defaultValue: OptionalAttribute<FocusStore> {
        return OptionalAttribute()
    }
}
