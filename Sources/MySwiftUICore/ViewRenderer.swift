// 76C8A4B3FC8EE0F99045B3425CD62255
package import AttributeGraph
package import Spatial

package protocol ViewRendererHost : ViewGraphOwner, ViewGraphRootValueUpdater {
    var responderNode: ResponderNode? { get }
}

extension ViewRendererHost {
    package func stateForIdentifier<ID : Hashable, Value, Content : View>(_ identifier: ID, type: Value.Type, in content: Content.Type) -> Binding<Value>? {
        assertUnimplemented()
    }
    
    package func findIdentifier<ID : Hashable, Result>(_ identifier: ID, root: AnyAttribute?, filter: (AnyAttribute) -> Result?) -> Result? {
        assertUnimplemented()
    }
    
    package func scrapeContent() -> ScrapeableContent {
        assertUnimplemented()
    }

    package var rootSizeInfo: RootSizeInfo? {
        assertUnimplemented()
    }

    package var nextGestureUpdateTime: Time {
        assertUnimplemented()
    }

    package func sendEvents(_ events: [EventID : EventType], rootNode: ResponderNode, at time: Time) -> GesturePhase<Void> {
        assertUnimplemented()
    }

    package func resetEvents() {
        assertUnimplemented()
    }

    package func gestureCategory() -> GestureCategory? {
        assertUnimplemented()
    }
    
    package func performExternalUpdate(_ action: () -> Void) {
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
    
    package func updateViewGraph<T>(body: (ViewGraph) -> T) -> T {
        Update.begin()
        self.updateGraph()
        let result = body(self.viewGraph)
        Update.end()
        return result
    }

    package func startProfiling() {
        assertUnimplemented()
    }

    package func stopProfiling() {
        assertUnimplemented()
    }

    package func `as`<T>(_ type: T.Type) -> T? {
        assertUnimplemented()
    }

    package func didRender() {
        assertUnimplemented()
    }

    package func invalidateDisplacementState() {
        assertUnimplemented()
    }

    package func advanceTimeForTest(interval: Double) {
        assertUnimplemented()
    }

    package func preferenceValue<T : HostPreferenceKey>(_ type: T.Type) -> T.Value {
        return _preferenceValue(type)
    }

    package func idealSize() -> CGSize {
        assertUnimplemented()
    }

    package func sizeThatFits(_ size: _ProposedSize) -> CGSize {
        return self._sizeThatFits(ProposedViewSize(width: size.width, height: size.height))
    }

    package func idealSize3D() -> Size3D {
        assertUnimplemented()
    }

    package func sizeThatFits(_ size: _ProposedSize3D) -> Size3D {
        assertUnimplemented()
    }

    package func explicitAlignment(of alignment: DepthAlignment, at size: Size3D) -> CGFloat? {
        assertUnimplemented()
    }

    package func alignment(of alignment: DepthAlignment, at size: Size3D) -> CGFloat {
        assertUnimplemented()
    }

    package func explicitAlignment(of alignment: HorizontalAlignment, at size: CGSize) -> CGFloat? {
        assertUnimplemented()
    }

    package func explicitAlignment(of alignment: VerticalAlignment, at size: CGSize) -> CGFloat? {
        assertUnimplemented()
    }

    package func alignment(of alignment: HorizontalAlignment, at size: CGSize) -> CGFloat {
        assertUnimplemented()
    }

    package func alignment(of alignment: VerticalAlignment, at size: CGSize) -> CGFloat {
        assertUnimplemented()
    }

    package var centersRootView: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
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
    
    package func sendTestEvents(_ events: [EventID : EventType]) {
        assertUnimplemented()
    }

    package func resetTestEvents() {
        assertUnimplemented()
    }

    package func rootContentPath(kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }

    package func resetProfile() {
        assertUnimplemented()
    }

    package func archiveJSON(name: String?) {
        assertUnimplemented()
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

package struct RootSizeInfo {
    private var animatedSize: ViewSize
    private var nonAnimatedSize: ViewSize
    private var proposedSize: ViewSize
}
