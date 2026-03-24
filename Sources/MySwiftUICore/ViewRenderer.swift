// 76C8A4B3FC8EE0F99045B3425CD62255

package protocol ViewRendererHost: ViewGraphOwner, ViewGraphRootValueUpdater {
}

extension ViewRendererHost {
    package func updateViewGraph<T>(body: (ViewGraph) -> T) -> T {
        Update.begin()
        self.updateGraph()
        let result = body(self.viewGraph)
        Update.end()
        return result
    }
    
    package func preferenceValue<T: HostPreferenceKey>(_ type: T.Type) -> T.Value {
        assertUnimplemented()
    }
    
    package var isRootHost: Bool {
        // x19
        let viewGraph = viewGraph
        
        guard let _ = viewGraph._preferenceBridge else {
            return true
        }
        
        assertUnimplemented()
    }
    
    func performExternalUpdate(_ action: () -> Void) {
        Update.assertIsLocked()
        
        let enclosingHosts = self.enclosingHosts
        
        for host in enclosingHosts {
            host.externalUpdateCount += 1
        }
        
        defer {
            for host in enclosingHosts {
                guard host.externalUpdateCount > 0 else {
                    fatalError("Unbalanced will/did update functions.")
                }
                
                host.externalUpdateCount -= 1
            }
        }
        
        action()
    }
    
    fileprivate var enclosingHosts: [any ViewRendererHost] {
        // self -> x20 -> x19
        // x22
        let viewGraph = viewGraph
        
        guard let parentHost = viewGraph.parentHost as? ViewRendererHost else {
            return [self]
        }
        
        // <+136>
        var hosts = parentHost.enclosingHosts
        hosts.append(self)
        return hosts
    }
}
