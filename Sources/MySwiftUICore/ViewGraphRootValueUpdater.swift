private import AttributeGraph
public import CoreGraphics
public import Spatial
private import _UIKitPrivate

@_spi(Internal) public protocol ViewGraphRootValueUpdater : ViewGraphDelegate {
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
    @_spi(Internal) public func initializeViewGraph() {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        let viewGraph = owner.viewGraph
        viewGraph.delegate = self
        
        let counter = viewGraph.data.graph!.counter(options: .unknown2)
        Signpost.viewHost.traceEvent(type: .event, object: self, "ViewHost: (%p) initialized PlatformHost [ %p ]", args: [counter, UInt(bitPattern: ObjectIdentifier(self))])
    }
    
    @_spi(Internal) public func invalidate() {
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
    
    @_spi(Internal) public func render(interval: Double, updateDisplayList: Bool, targetTimestamp: Time?) {
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
                // $s7SwiftUI25ViewGraphRootValueUpdaterPAAE6render8interval17updateDisplayList15targetTimestampySd_SbAA4TimeVSgtFyyXEfU_
                // x21
                let viewGraph = owner.viewGraph
                owner.currentTimestamp += interval
                
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
                
                if nextTime.seconds.isFinite {
                    var time: Double = (currentTimestamp.seconds < nextTime.seconds) ? nextTime.seconds : currentTimestamp.seconds
                    time -= currentTimestamp.seconds
                    time = (time <= 1e-6) ? 1e-6 : time
                    
                    self.requestUpdate(after: time)
                }
            }
        }
    }
    
    @_spi(Internal) public nonisolated func renderAsync(interval: Double, targetTimestamp: Time?) -> Time? {
        /*
         interval -> d0 -> d8
         targetTimestamp -> x0 -> x27/w28
         return pointer -> x8 -> x19
         */
        guard
            let owner = self.as((any ViewGraphOwner).self),
            let host = self.as((any ViewGraphRenderHost).self)
        else {
            return nil
        }
        
        Update.assertIsLocked()
        
        guard !self.isRendering && owner.valuesNeedingUpdate.isEmpty else {
            return nil
        }
        
        let viewGraph = owner.viewGraph
        
        guard !viewGraph.hasPendingTransactions else {
            return nil
        }
        
        // <+484>
        Update.begin()
        
        owner.currentTimestamp += interval
        let d8 = owner.currentTimestamp
        owner.renderingPhase = .renderingAsync
        
        guard let result = viewGraph.updateOutputsAsync(at: d8) else {
            owner.renderingPhase = .none
            Update.end()
            return nil
        }
        
        // <+620>
        let renderTime = host.renderDisplayList(
            result.list,
            asynchronously: true,
            time: d8,
            nextTime: viewGraph.nextUpdate.views.time,
            targetTimestamp: targetTimestamp,
            version: result.version,
            maxVersion: DisplayList.Version(forUpdate: ())
        )
        
        owner.renderingPhase = .none
        
        Update.end()
        return renderTime
    }
    
    @_spi(Internal) public func _preferenceValue<T : HostPreferenceKey>(_ key: T.Type) -> T.Value {
        return self._updateViewGraph { viewGraph in
            return viewGraph.preferenceValue(key)
        } ?? T.defaultValue
    }
    
    @_spi(Internal) public func _addPreference<T : HostPreferenceKey>(_ key: T.Type) -> T.Value {
        assertUnimplemented()
    }
    
    @_spi(Internal) public var responderNode: ResponderNode? {
        return _updateViewGraph { graph -> ResponderNode? in
            // $s7SwiftUI25ViewGraphRootValueUpdaterPAAE13responderNodeAA09ResponderI0CSgvgAgA0cD0CXEfU_
            guard let rootResponders = graph.rootResponders else {
                return nil
            }
            
            return rootResponders.last
        } ?? nil
    }
    
    @_spi(Internal) public func invalidateProperties(_ values: ViewGraphRootValues, mayDeferUpdate: Bool) {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        Update.locked {
            // $s7SwiftUI25ViewGraphRootValueUpdaterPAAE20invalidateProperties_14mayDeferUpdateyAA0cdE6ValuesV_SbtFyyXEfU_
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
    
    @_spi(Internal) public func _sizeThatFits(_ proposedSize: ProposedViewSize) -> CGSize {
        return self._updateViewGraph { viewGraph in
            // $s7SwiftUI25ViewGraphRootValueUpdaterPAAE13_sizeThatFitsySo6CGSizeVAA08ProposedC4SizeVFAfA0cD0CXEfU_TA
            return viewGraph.sizeThatFits(_ProposedSize(width: proposedSize.width, height: proposedSize.height))
        } ?? .zero
    }
    
    @_spi(Internal) public func updateTransform() {
        guard let owner = self.as(ViewGraphOwner.self) else {
            return
        }
        
        owner.viewGraph.invalidateTransform()
    }
    
    @_spi(Internal) public func updateFocusStore() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func updateFocusedItem() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func updateAccessibilityEnvironment() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func updateGraph<T>(body: (GraphHost) -> T) -> T {
        return _updateViewGraph(body: body)!
    }
    
    @_spi(Internal) public func graphDidChange() {
        Update.locked {
            if !self.isRendering {
                self.requestUpdate(after: 0)
            }
        }
    }
    
    @_spi(Internal) public func preferencesDidChange() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public nonisolated var isRendering: Bool {
        guard let owner = self.as((any ViewGraphOwner).self) else {
            return false
        }
        
        switch owner.renderingPhase {
        case .none:
            return false
        case .rendering, .renderingAsync:
            return true
        }
    }
    
    @_spi(Internal) public func updateGraph() {
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
            
            if valuesNeedingUpdate.contains(.focusedItem) {
                owner.valuesNeedingUpdate.subtract(.focusedItem)
                self.updateFocusedItem()
            }
            
            if valuesNeedingUpdate.contains(.focusedValues) {
                owner.valuesNeedingUpdate.subtract(.focusedValues)
                self.updateFocusedValues()
            }
        }
    }
    
    @_spi(Internal) public func _idealSize() -> CGSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func _updateViewGraph<T>(body: (ViewGraph) -> T) -> T? {
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
    
    @_spi(Internal) public func _explicitAlignment(of: HorizontalAlignment, at: CGSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func _explicitAlignment(of: VerticalAlignment, at: CGSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func _alignment(of: HorizontalAlignment, at: CGSize) -> CGFloat {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func _alignment(of: VerticalAlignment, at: CGSize) -> CGFloat {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func _explicitAlignment(of: DepthAlignment, at: Size3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func _alignment(of: DepthAlignment, at: Size3D) -> CGFloat {
        assertUnimplemented()
    }
}
