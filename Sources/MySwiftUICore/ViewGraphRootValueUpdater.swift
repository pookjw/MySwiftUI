#warning("TODO")
private import AttributeGraph
package import CoreGraphics
package import StopwatchSupport

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
        fatalError("TODO")
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
