private import AttributeGraph
package import CoreGraphics
package import Spatial
private import _UIKitPrivate

@_spi(Internal) public protocol ViewGraphRootValueUpdater: ViewGraphDelegate {
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
        
        let counter = viewGraph.data.graph!.counter(options: .unknown2)
        Signpost.viewHost.traceEvent(type: .event, object: self, "ViewHost: (%p) initialized PlatformHost [ %p ]", args: [counter, UInt(bitPattern: ObjectIdentifier(self))])
    }
    
    package func invalidate() {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        // x19 / x29 - 0x40 - 0x100
        let viewGraph = owner.viewGraph
        viewGraph.delegate = nil
        
        Signpost.viewHost.traceEvent(
            type: .event,
            object: self,
            "ViewHost: (%p) invalidated PlatformHost [ %p ]",
            args: [
                viewGraph.data.graph!.counter(options: .unknown2),
                UInt(bitPattern: ObjectIdentifier(self))
            ]
        )
    }
    
    package func render(interval: Double, updateDisplayList: Bool, targetTimestamp: Time?) {
        /*
         interval = d8
         */
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        Update.ensure {
            guard !isRendering else {
                return
            }
            
            Signpost.render.traceInterval(object: self, nil) {
                // closure #1 () -> () in SwiftUI.ViewGraphRootValueUpdater.render(interval: Swift.Double, updateDisplayList: Swift.Bool, targetTimestamp: Swift.Optional<SwiftUI.Time>) -> ()
                // x21
                let viewGraph = owner.viewGraph
                // nil 확인하는 코드가 없으며 nil이면 모두 0일 것이기에 Time.zero로 추정
                owner.currentTimestamp = (targetTimestamp ?? .zero) + interval
                
                // x29 - 0xc0, d8
                let currentTimestamp = owner.currentTimestamp
                
                viewGraph.flushTransactions()
                // x21
                Graph.withoutUpdate {
                    self.updateGraph()
                }
                
                owner.renderingPhase = .rendering
                
                // x29 - 0x164 ~
                let rootDisplayList: (DisplayList, DisplayList.Version) = Signpost.renderUpdate.traceInterval(object: viewGraph, nil) {
                    // <+628>
                    // x29 - #0x80
                    let data = viewGraph.data
                    Update.dispatchActions()
                    viewGraph.updateOutputs(at: currentTimestamp)
                    Update.dispatchActions()
                    viewGraph.flushTransactions()
                    
                    var rootDisplayList: (DisplayList, DisplayList.Version)
                    if updateDisplayList {
                        rootDisplayList = viewGraph.rootDisplayList ?? (DisplayList(), DisplayList.Version())
                    } else {
                        rootDisplayList = (DisplayList(), DisplayList.Version())
                    }
                    
                    // <+1152>
                    Update.assertIsLocked()
                    
                    guard data.globalSubgraph.isDirty(1) else {
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
                
                // <+2252>
                // d9
                var nextTime = viewGraph.nextUpdate.views.time
                
                if updateDisplayList, let owner = self.as(ViewGraphOwner.self) {
                    // <+2580>
                    let version = rootDisplayList.1
                    let maxVersion = DisplayList.Version(forUpdate: ())
                    Signpost.renderDisplayList.traceInterval(object: owner, nil) {
                        // <+2740>
                        nextTime = viewGraph.renderDisplayList(rootDisplayList.0, asynchronously: false, time: currentTimestamp, nextTime: nextTime, targetTimestamp: targetTimestamp, version: version, maxVersion: maxVersion)
                    }
                }
                
                // <+3160>
                owner.renderingPhase = .none
                
                if abs(nextTime.seconds) <= Double.greatestFiniteMagnitude {
                    self.requestUpdate(after: max(nextTime.seconds - currentTimestamp.seconds, 1e-6))
                }
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
        return _updateViewGraph { graph -> ResponderNode? in
            // $s7SwiftUI25ViewGraphRootValueUpdaterPAAE13responderNodeAA09ResponderI0CSgvgAgA0cD0CXEfU_
            guard let rootResponders = graph.rootResponders else {
                return nil
            }
            
            return rootResponders.last
        } ?? nil
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
                requestUpdate(after: 0)
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
    
    public func updateGraph<T>(body: (GraphHost) -> T) -> T {
        return _updateViewGraph(body: body)!
    }
    
    public func graphDidChange() {
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
        
        let ownerBox = UncheckedSendable(owner)
        let selfBox = UncheckedSendable(self)
        
        Update.syncMain {
            // closure #1 () -> () in SwiftUI.ViewGraphRootValueUpdater.updateGraph() -> ()
            let owner = ownerBox.value
            let `self` = selfBox.value
            
            // valuesNeedingUpdate = x20
            // owner = x21
            if valuesNeedingUpdate.contains(.rootView) {
                owner.valuesNeedingUpdate.subtract(.rootView)
                self.updateRootView()
            }
            
            if valuesNeedingUpdate.contains(.environment) {
                owner.valuesNeedingUpdate.subtract(.environment)
                self.updateEnvironment()
            }
            
            if valuesNeedingUpdate.contains(.transform) {
                owner.valuesNeedingUpdate.subtract(.transform)
                self.updateTransform()
            }
            
            if valuesNeedingUpdate.contains(.size) {
                owner.valuesNeedingUpdate.subtract(.size)
                self.updateSize()
            }
            
            if valuesNeedingUpdate.contains(.safeArea) {
                owner.valuesNeedingUpdate.subtract(.safeArea)
                self.updateSafeArea()
            }
            
            if valuesNeedingUpdate.contains(.containerSize) {
                owner.valuesNeedingUpdate.subtract(.containerSize)
                self.updateContainerSize()
            }
            
            if valuesNeedingUpdate.contains(.focusStore) {
                owner.valuesNeedingUpdate.subtract(.focusStore)
                self.updateFocusStore()
            }
            
            if valuesNeedingUpdate.contains(.focustedItem) {
                owner.valuesNeedingUpdate.subtract(.focustedItem)
                self.updateFocusedItem()
            }
            
            if valuesNeedingUpdate.contains(.focustedValues) {
                owner.valuesNeedingUpdate.subtract(.focustedValues)
                self.updateFocusedValues()
            }
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
        
        let result = Graph.withoutUpdate {
            self.updateGraph()
            return body(viewGraph)
        }
        
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
