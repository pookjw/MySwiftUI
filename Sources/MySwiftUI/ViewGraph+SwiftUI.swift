@_spi(Internal) internal import MySwiftUICore
private import AttributeGraph

extension ViewGraph {
    func setFocusStore(_ focusStore: FocusStore) {
        guard requestedOutputs.isSuperset(of: .focus) else {
            return
        }
        
        guard let focusViewGraphRef = unsafe self[FocusViewGraph.self] else {
            return
        }
        
        guard let attribute = unsafe focusViewGraphRef.pointee.$focusStore else {
            return
        }
        
        let changed = attribute.setValue(focusStore)
        
        if changed {
            if let delegate {
                delegate.graphDidChange()
            }
        }
    }
    
    func setFocusedItem(_ focusedItem: FocusItem?) {
        guard requestedOutputs.isSuperset(of: .focus) else {
            return
        }
        
        guard let focusViewGraphRef = unsafe self[FocusViewGraph.self] else {
            return
        }
        
        guard let attribute = unsafe focusViewGraphRef.pointee.$focusedItem else {
            return
        }
        
        let changed = attribute.setValue(focusedItem)
        
        if changed {
            if let delegate {
                delegate.graphDidChange()
            }
        }
    }
    
    func setFocusedValues(_ focusedValues: FocusedValues) {
        guard requestedOutputs.isSuperset(of: .focus) else {
            return
        }
        
        guard let focusViewGraphRef = unsafe self[FocusViewGraph.self] else {
            return
        }
        
        guard let attribute = unsafe focusViewGraphRef.pointee.$focusedValues else {
            return
        }
        
        let changed = attribute.setValue(focusedValues)
        
        if changed {
            if let delegate {
                delegate.graphDidChange()
            }
        }
    }
    
    func swipeActions() -> SwipeActions.Value? {
        return Update.dispatchImmediately(reason: nil) {
            // $s7SwiftUI9ViewGraphCAAE12swipeActionsAA05SwipeF0O5ValueVSgyFAIyXEfU_TA.8
            return Graph.withoutUpdate { 
                guard
                    let value = unsafe self[SwipeActions.Feature.self],
                    let attribute = unsafe value.pointee.swipeActions
                else {
                    return nil
                }
                
                return attribute.wrappedValue
            }
        }
    }
}
