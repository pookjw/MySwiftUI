internal import MySwiftUICore

extension ViewGraph {
    func setFocusStore(_ focusStore: FocusStore) {
        guard requestedOutputs.isSuperset(of: .focus) else {
            return
        }
        
        guard let focusViewGraphRef = self[FocusViewGraph.self] else {
            return
        }
        
        guard let attribute = focusViewGraphRef.pointee.$focusStore else {
            return
        }
        
        let changed = attribute.setValue(focusStore)
        
        if changed {
            if let delegate {
                delegate.graphDidChange()
            }
        }
    }
}
