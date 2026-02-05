internal import MySwiftUICore

struct EditModeScopeFeature: ViewGraphFeature {
    mutating func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    mutating func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
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
    
    mutating func needsUpdate(graph: ViewGraph) -> Bool {
        fatalError("TODO")
    }
    
    mutating func update(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func outputsDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
}
