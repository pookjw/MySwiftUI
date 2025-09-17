#warning("TODO")
private import AttributeGraph
package import CoreGraphics
package import StopwatchSupport
private import _UIKitPrivate

package protocol ViewGraphRootValueUpdater: ViewGraphDelegate {
    func updateRootView()
    func updateEnvironment()
    func updateTransform()
    func updateSize()
    func updateSafeArea()
    func updateContainerSize()
    func updateFocusStore()
    func updateFocusedItem()
    func updateFocusedValues()
    func updateAccessibilityEnvironment()
}

extension ViewGraphRootValueUpdater {
    package func initializeViewGraph() {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        let viewGraph = owner.viewGraph
        viewGraph.delegate = self
        
        let counter = viewGraph.data.graph!.counter(options: .unknown)
        Signpost.viewHost.traceEvent(type: .event, object: self, "ViewHost: (%p) initialized PlatformHost [ %p ]", args: [counter, UInt(bitPattern: ObjectIdentifier(self))])
    }
    
    package func invalidate() {
        fatalError("TODO")
    }
    
    package func render(interval: Double, updateDisplayList: Bool, targetTimestamp: Time?) {
        /*
         interval = d8
         updateDisplayList = x26
         targetTimestamp = x20
         */
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        Update.begin()
        defer {
            Update.end()
        }
        
        guard !isRendering else {
            return
        }
        
        Signpost.render.traceInterval(object: self, nil) {
            // closure #1 () -> () in SwiftUI.ViewGraphRootValueUpdater.render(interval: Swift.Double, updateDisplayList: Swift.Bool, targetTimestamp: Swift.Optional<SwiftUI.Time>) -> ()
            let viewGraph = owner.viewGraph
            owner.currentTimestamp = (targetTimestamp ?? .zero) + interval
            
            let currentTimestamp = owner.currentTimestamp
            
            viewGraph.flushTransactions()
            // x21
            let update = Graph.clearUpdate()
            self.updateGraph()
            Graph.setUpdate(update)
            
            owner.renderingPhase = .rendering
            
            Signpost.renderUpdate.traceInterval(object: viewGraph, nil) {
                // <+628>
                let data = viewGraph.data
                Update.dispatchActions()
                fatalError("TODO")
            }
            fatalError("TODO")
        }
    }
    
    package func renderAsync(interval: Double, targetTimestamp: Time?) {
        fatalError("TODO")
    }
    
    package func _preferenceValue<T: HostPreferenceKey>(_ key: T.Type) -> T.Value {
        fatalError("TODO")
    }
    
    package func _addPreference<T: HostPreferenceKey>(_ key: T.Type) -> T.Value {
        fatalError("TODO")
    }
    
    package var responderNode: ResponderNode? {
        fatalError("TODO")
    }
    
    package func invalidateProperties(_ values: ViewGraphRootValues, mayDeferUpdate: Bool) {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        Update.ensure {
            /*
             values = x26
             mayDeferUpdate = x27
             */
            let viewGraph = owner.viewGraph
            let valuesNeedingUpdate = owner.valuesNeedingUpdate
            
            if !valuesNeedingUpdate.isSuperset(of: values) {
                owner.valuesNeedingUpdate = valuesNeedingUpdate.union(values)
                viewGraph.setNeedsUpdate(mayDeferUpdate: mayDeferUpdate, values: valuesNeedingUpdate.union(values))
            }
        }
    }
    
    package func _sizeThatFits(_ proposedSize: ProposedViewSize) -> CGSize {
        fatalError("TODO")
    }
    
    package func updateTransform() {
        fatalError("TODO")
    }
    
    package func updateFocusStore() {
        fatalError("TODO")
    }
    
    package func updateFocusedItem() {
        fatalError("TODO")
    }
    
    package func updateAccessibilityEnvironment() {
        fatalError("TODO")
    }
    
    package func updateGraph<T>(body: (GraphHost) -> T) -> T {
        fatalError("TODO")
    }
    
    package func graphDidChange() {
        fatalError("TODO")
    }
    
    package func preferencesDidChange() {
        fatalError("TODO")
    }
    
    package var isRendering: Bool {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return false
        }
        
        return (owner.renderingPhase != .none)
    }
    
    package func updateGraph() {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        let valuesNeedingUpdate = owner.valuesNeedingUpdate
        guard !valuesNeedingUpdate.isEmpty else {
            return
        }
        
        Update.syncMain {
            // closure #1 () -> () in SwiftUI.ViewGraphRootValueUpdater.updateGraph() -> ()
            
            // valuesNeedingUpdate = x20
            // owner = x21
            if !valuesNeedingUpdate.isEmpty {
                owner.valuesNeedingUpdate.remove(.rootView)
                self.updateRootView()
            }
            
            owner.valuesNeedingUpdate.remove(.environment)
            owner.valuesNeedingUpdate.remove(.transform)
            owner.valuesNeedingUpdate.remove(.size)
            owner.valuesNeedingUpdate.remove(.safeArea)
            owner.valuesNeedingUpdate.remove(.containerSize)
            owner.valuesNeedingUpdate.remove(.focusStore)
            owner.valuesNeedingUpdate.remove(.focustedItem)
        }
    }
    
    package func _idealSize() -> CGSize {
        fatalError("TODO")
    }
    
    package func _updateViewGraph<T>(body: (ViewGraph) -> T) -> T? {
        fatalError("TODO")
    }
    
    package func _explicitAlignment(of: HorizontalAlignment, at: CGSize) -> CGFloat? {
        fatalError("TODO")
    }
    
    package func _explicitAlignment(of: VerticalAlignment, at: CGSize) -> CGFloat? {
        fatalError("TODO")
    }
    
    package func _alignment(of: HorizontalAlignment, at: CGSize) -> CGFloat {
        fatalError("TODO")
    }
    
    package func _alignment(of: VerticalAlignment, at: CGSize) -> CGFloat {
        fatalError("TODO")
    }
    
    package func _explicitAlignment(of: DepthAlignment, at: SPSize3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    package func _alignment(of: DepthAlignment, at: SPSize3D) -> CGFloat {
        fatalError("TODO")
    }
}
