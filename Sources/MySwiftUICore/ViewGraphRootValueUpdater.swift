#warning("TODO")
private import AttributeGraph
package import CoreGraphics
package import Spatial
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
        
        let counter = viewGraph.data.graph!.counter(options: .unknown4)
        Signpost.viewHost.traceEvent(type: .event, object: self, "ViewHost: (%p) initialized PlatformHost [ %p ]", args: [counter, UInt(bitPattern: ObjectIdentifier(self))])
    }
    
    package func invalidate() {
        fatalError("TODO")
    }
    
    package func render(interval: Double, updateDisplayList: Bool, targetTimestamp: Time?) {
        /*
         interval = d8
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
            // nil 확인하는 코드가 없으며 nil이면 모두 0일 것이기에 Time.zero로 추정
            owner.currentTimestamp = (targetTimestamp ?? .zero) + interval
            
            // x29 - 0xc0, d8
            let currentTimestamp = owner.currentTimestamp
            
            viewGraph.flushTransactions()
            // x21
            let update = Graph.clearUpdate()
            self.updateGraph()
            unsafe Graph.setUpdate(update)
            
            owner.renderingPhase = .rendering
            
            // x29 - 0x164 ~
            let rootDisplayList: (DisplayList, DisplayList.Version) = Signpost.renderUpdate.traceInterval(object: viewGraph, nil) {
                // <+628>
                // x29 - #0x80
                let data = viewGraph.data
                Update.dispatchActions()
                viewGraph.updateOutputs(at: currentTimestamp)
                viewGraph.flushTransactions()
                
                var rootDisplayList: (DisplayList, DisplayList.Version)
                if updateDisplayList {
                    rootDisplayList = viewGraph.rootDisplayList ?? (DisplayList(), DisplayList.Version())
                } else {
                    rootDisplayList = (DisplayList(), DisplayList.Version())
                }
                
                // <+1152>
                Update.assertIsLocked()
                
                guard data.globalSubgraph.isDirty else {
                    return rootDisplayList
                }
                
                Update.dispatchActions()
                viewGraph.updateOutputs(at: currentTimestamp)
                viewGraph.flushTransactions()
                
                if updateDisplayList {
                    rootDisplayList = viewGraph.rootDisplayList ?? (DisplayList(), DisplayList.Version())
                } else {
                    rootDisplayList = (DisplayList(), DisplayList.Version())
                }
                
                Update.assertIsLocked()
                return rootDisplayList
            }
            
            // d9
            let nextTime = viewGraph.nextUpdate.views.time
            
            if updateDisplayList, let owner = self.as(ViewGraphOwner.self) {
                let version = DisplayList.Version()
                let maxVersion = DisplayList.Version(forUpdate: ())
                Signpost.renderDisplayList.traceInterval(object: owner, nil) {
                    // <+2740>
                    _ = viewGraph.renderDisplayList(rootDisplayList.0, asynchronously: false, time: currentTimestamp, nextTime: nextTime, targetTimestamp: targetTimestamp, version: version, maxVersion: maxVersion)
                }
            }
            
            // <+3160>
            owner.renderingPhase = .none
            
            if abs(nextTime.seconds) <= Double.greatestFiniteMagnitude {
                self.requestUpdate(after: max(nextTime.seconds - currentTimestamp.seconds, 1e-6))
            }
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
        
        Update.locked {
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
        return _updateViewGraph(body: body)!
    }
    
    package func graphDidChange() {
        Update.locked {
            if !self.isRendering {
                self.requestUpdate(after: 0)
            }
        }
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
            
            if valuesNeedingUpdate.contains(.rootView) {
                owner.valuesNeedingUpdate.remove(.environment)
                updateEnvironment()
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
        guard let owner = self.as(ViewGraphOwner.self) else {
            return nil
        }
        
        let viewGraph = owner.viewGraph
        
        Update.begin()
        
        let old = Graph.clearUpdate()
        self.updateGraph()
        let result = body(viewGraph)
        unsafe Graph.setUpdate(old)
        
        Update.end()
        
        return result
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
    
    package func _explicitAlignment(of: DepthAlignment, at: Size3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    package func _alignment(of: DepthAlignment, at: Size3D) -> CGFloat {
        fatalError("TODO")
    }
}
