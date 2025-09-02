#warning("TODO")
internal import MySwiftUICore
private import AttributeGraph

struct FocusViewGraph {
    private var _focusedItem: OptionalAttribute<FocusItem?>
    private var _focusedValues: OptionalAttribute<FocusedValues>
    private var _focusStore: OptionalAttribute<FocusStore>
    private var _isFocusSystemEnabled: OptionalAttribute<Bool>
    private var needsFocusUpdate: Bool
    private var wasFocusSystemEnabled: Bool
    private var needsFocusSystemEnabledUpdate: Bool
    
    @inline(never)
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
            fatalError("TODO")
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
