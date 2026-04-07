// 76C8A4B3FC8EE0F99045B3425CD62255
package import CoreGraphics

package protocol ViewRendererHost : ViewGraphOwner, ViewGraphRootValueUpdater {
    var responderNode: ResponderNode? { get }
}

extension ViewRendererHost {
    package func updateViewGraph<T>(body: (ViewGraph) -> T) -> T {
        Update.begin()
        self.updateGraph()
        let result = body(self.viewGraph)
        Update.end()
        return result
    }
    
    package func preferenceValue<T : HostPreferenceKey>(_ type: T.Type) -> T.Value {
        return _preferenceValue(type)
    }
    
    package var isRootHost: Bool {
        // x19
        let viewGraph = viewGraph
        // x20
        if
            let preferenceBridge = viewGraph._preferenceBridge,
            preferenceBridge.viewGraph != nil
        {
            return false
        } else {
            return true
        }
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
    
    package func sizeThatFits(_ size: _ProposedSize) -> CGSize {
        return self._sizeThatFits(ProposedViewSize(width: size.width, height: size.height))
    }
}

extension EnvironmentValues {
    package var preferenceBridge: PreferenceBridge? {
        get {
            return self[PreferenceBridgeKey.self].base
        }
        set {
            self[PreferenceBridgeKey.self] = WeakBox(newValue)
        }
    }
    
    fileprivate struct PreferenceBridgeKey : EnvironmentKey {
        static var defaultValue: WeakBox<PreferenceBridge> {
            return WeakBox(nil)
        }
    }
}
