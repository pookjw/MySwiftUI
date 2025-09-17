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
        Update.begin()
        defer {
            Update.end()
        }
        
        guard !isRendering else {
            return
        }
        
//        Signpost.render.traceInterval(object: <#T##AnyObject?#>, <#T##message: StaticString##StaticString#>, <#T##args: [any CVarArg]##[any CVarArg]#>, closure: <#T##() -> T#>)
        fatalError("TODO")
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
        fatalError("TODO")
    }
    
    package func updateGraph() {
        fatalError("TODO")
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
