#warning("TODO")

struct HitTestBindingFeature: ViewGraphFeature {
    func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
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
    
    func needsUpdate(graph: ViewGraph) -> Bool {
        fatalError("TODO")
    }
    
    func update(graph: ViewGraph) {
        fatalError("TODO")
    }
}
