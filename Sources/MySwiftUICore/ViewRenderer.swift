package protocol ViewRendererHost: ViewGraphOwner, ViewGraphRootValueUpdater {
    
}

extension ViewRendererHost {
    package func preferenceValue<T: HostPreferenceKey>(_ type: T.Type) -> T.Value {
        fatalError("TODO")
    }
    
    package var isRootHost: Bool {
        // x19
        let viewGraph = viewGraph
        
        guard let viewGraph = viewGraph._preferenceBridge else {
            return true
        }
        
        fatalError("TODO")
    }
}
