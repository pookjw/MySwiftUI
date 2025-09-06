#warning("TODO")
internal import MySwiftUICore
private import AttributeGraph

struct FocusViewGraph {
    @OptionalAttribute private var focusedItem: FocusItem??
    @OptionalAttribute private var focusedValues: FocusedValues?
    @OptionalAttribute private var focusStore: FocusStore?
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
    // TODO
}
