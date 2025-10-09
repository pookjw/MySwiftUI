#warning("TODO")
internal import AttributeGraph
package import CoreGraphics
internal import QuartzCore
private import Spatial

package final class ViewGraph: GraphHost {
    private let rootViewType: Any.Type
    private let makeRootView: (AnyAttribute, _ViewInputs) -> _ViewOutputs
    package internal(set) weak var delegate: ViewGraphDelegate? = nil
    private var features = unsafe ViewGraphFeatureBuffer(contents: UnsafeHeterogeneousBuffer())
    private var centersRootView = true
    private let rootView: AnyAttribute
    @Attribute private var rootTransform: ViewTransform
    @Attribute var transform: ViewTransform
    @Attribute private var zeroPoint: CGPoint
    @Attribute var proposedSize: ViewSize
    @Attribute var safeAreaInsets: _SafeAreaInsetsModifier
    @Attribute private var containerShape: UnevenRoundedRectangle
    @Attribute private var rootGeometry: ViewGeometry
    @Attribute private var position: CGPoint
    @Attribute private var dimensions: ViewSize
    @OptionalAttribute private var containerSize: ViewSize?
    @Attribute private var gestureTime: Time
    @Attribute private var gestureEvents: [EventID : any EventType]
    @Attribute private var inheritedPhase: _GestureInputs.InheritedPhase
    @Attribute private var gestureResetSeed: UInt32
    @OptionalAttribute private var rootPhase: GesturePhase<Void>?
    @OptionalAttribute private var gestureDebug: GestureDebug.Data?
    @OptionalAttribute private var gestureCategory: GestureCategory?
    @Attribute private var gesturePreferenceKeys: PreferenceKeys
    private var eventSubgraph: Subgraph? = nil
    @Attribute private var defaultLayoutComputer: LayoutComputer
    @WeakAttribute private var rootResponders: [ViewResponder]?
    @WeakAttribute fileprivate var rootLayoutComputer: LayoutComputer?
    @WeakAttribute var rootDisplayList: (DisplayList, DisplayList.Version)?
    private(set) var sizeThatFitsObservers = ViewGraphGeometryObservers<SizeThatFitsMeasurer>()
    package internal(set) var accessibilityEnabled = false
    package private(set) var requestedOutputs: ViewGraph.Outputs
    private var disabledOutputs = ViewGraph.Outputs(rawValue: 0)
    private var mainUpdates: Int = 0
    private(set) var nextUpdate = (views: NextUpdate(), gestures: NextUpdate())
    private weak var _preferenceBridge: PreferenceBridge? = nil
    private var bridgedPreferences: [(any PreferenceKey.Type, AnyAttribute)] = []
    
    package init<T: View>(rootViewType: T.Type = T.self, requestedOutputs: ViewGraph.Outputs = .defaults) {
        self.rootViewType = rootViewType
        self.requestedOutputs = requestedOutputs
        self.makeRootView = { _, _ in
            fatalError("TODO")
        }
        
        let data = GraphHost.Data()
        let oldCurrent = Subgraph.current
        Subgraph.current = data.globalSubgraph
        
        defer {
            Subgraph.current = oldCurrent
            CustomEventTrace.instantiateEnd(data.rootSubgraph)
        }
        
        CustomEventTrace.instantiateBegin(data.rootSubgraph)
        
        let rootView = Attribute(type: rootViewType)
        CustomEventTrace.recordNamedProperty(.rootView, rootView)
        self.rootView = rootView.identifier
        
        let tramsform = Attribute(RootTransform())
        CustomEventTrace.recordNamedProperty(.transform, tramsform)
        self._rootTransform = tramsform
        self._transform = tramsform
        
        self._zeroPoint = Attribute(value: .zero)
        
        let proposedSize = Attribute(value: ViewSize.zero)
        CustomEventTrace.recordNamedProperty(.size, proposedSize)
        self._proposedSize = proposedSize
        
        let containerSize = Attribute(value: ViewSize.zero)
        CustomEventTrace.recordNamedProperty(.containerSize, containerSize)
        self._containerSize = OptionalAttribute(containerSize)
        
        let safeAreaInsets: Attribute<_SafeAreaInsetsModifier>
        if isLinkedOnOrAfter(.v7) {
            safeAreaInsets = Attribute(
                value: _SafeAreaInsetsModifier(
                    elements: [],
                    nextInsets: nil
                )
            )
        } else {
            safeAreaInsets = Attribute(
                value: _SafeAreaInsetsModifier(
                    elements: [
                        SafeAreaInsets.Element(
                            regions: .container,
                            insets: .zero,
                            cornerInsets: nil
                        )
                    ],
                    nextInsets: nil
                )
            )
        }
        CustomEventTrace.recordNamedProperty(.safeArea, safeAreaInsets)
        self._safeAreaInsets = safeAreaInsets
        
        self._containerShape = Attribute(RootContainerShape())
        self._defaultLayoutComputer = Attribute(value: unsafe LayoutComputer.defaultValue)
        self._gestureTime = Attribute(value: Time.zero)
        self._gestureEvents = Attribute(value: [:])
        self._inheritedPhase = Attribute(value: _GestureInputs.InheritedPhase.defaultValue)
        self._gestureResetSeed = Attribute(value: 0)
        self._gesturePreferenceKeys = Attribute(value: PreferenceKeys())
        
        self._rootGeometry = Attribute(RootGeometry(proposedSize: self._proposedSize, safeAreaInsets: OptionalAttribute(self._safeAreaInsets)))
        self._position = self._rootGeometry.origin()
        self._dimensions = self._rootGeometry.size()
        
        super.init(data: data)
    }
    
    package var updatesWillBeVisible: Bool {
        fatalError("TODO")
    }
    
    package override var graphDelegate: (any ViewGraphDelegate)? {
        return delegate
    }
    
    package override var parentHost: GraphHost? {
        guard let preferenceBridge = _preferenceBridge else {
            return nil
        }
        
        return preferenceBridge.viewGraph
    }
    
    package override func isHiddenForReuseDidChange() {
        fatalError("TODO")
    }
    
    package final func append<T: ViewGraphFeature>(feature: T) {
        features.append(feature: feature)
    }
    
    package final func setRootView<Content: View>(_ rootView: Content) {
        Attribute(identifier: self.rootView).setValue(rootView)
    }
    
    package func updateOutputs(at time: Time) {
        self.beginNextUpdate(at: time)
        
        var w27 = false
        var sp = false
        var sp04 = false
        var w28 = false
        var w21 = false
        var w25 = false
        
        // sp + 0x8
        for _ in 0..<8 {
            self.runTransaction()
            
            let updated = self.updatePreferences()
            w28 = (w28 || updated)
            w21 = (w21 || updated)
            
            let needsUpdate = self.sizeThatFitsObservers.needsUpdate(graph: self)
            w27 = (needsUpdate || w27)
            w25 = (needsUpdate || w25)
            
            for feature in self.features {
                guard feature.flags == 0 else {
                    sp = true
                    sp04 = true
                    continue
                }
                
                guard feature.needsUpdate(graph: self) else {
                    continue
                }
                
                feature.flags |= 1
                sp = true
                sp04 = true
            }
            
            // <+384>
            guard self.data.globalSubgraph.isDirty else {
                break
            }
        }
        
        // <+416>
        var w8 = sp
        let x29_51 = w8
        w8 = (w8 && w25)
        let x29_52 = w8
        w8 = (w8 && w21)
        let sp_18 = w8
        w8 = (w8 || w28 || w27)
        
        guard w8 else {
            return
        }
        
        /*
         x0 = x29_51
         x1 = self
         w2 = 0
         x3 = sp_18
         x4 = x29_52
         ---
         x29_51 = x23
         self = x19
         0 = x22
         sp_18 = x24
         x29_52 = x21
         */
        _updateOutputs(x23: x29_51, x22: false, x24: sp_18, x21: x29_52)
    }
    
    // function signature specialization <Arg[0] = Stack Promoted from Box, Arg[3] = Stack Promoted from Box, Arg[4] = Stack Promoted from Box> of update() -> ()
    private func _updateOutputs(
        x23: Bool,
        x22: Bool, // 쓰이고는 있지만 분기 변경에 영향을 끼치지 않음
        x24: Bool,
        x21: Bool
    ) {
        // self = x19
        if x23 {
            for feature in self.features {
                if feature.flags != 0 {
                    feature.outputsDidChange(graph: self)
                }
            }
        }
        
        // <+216>
        if x24 {
            if let delegate {
                delegate.preferencesDidChange()
            }
            
            // x24
            if let preferenceBridge = _preferenceBridge {
                let identifier = data.$hostPreferenceKeys.projectedValue.identifier
                if let graph = preferenceBridge.viewGraph {
                    graph.graphInvalidation(from: identifier)
                }
            }
        }
        
        // <+420>
        for feature in self.features {
            if feature.flags != 0 {
                feature.update(graph: self)
                feature.flags &= 0xfffffffe
            }
        }
        
        if x21 {
            sizeThatFitsObservers.notify()
        }
    }
    
    func updateGraphPhase(oldParentPhase: _GraphInputs.Phase?, newParentPhase: _GraphInputs.Phase) {
        /*
         oldParentPhase = w23
         newParentPhase = w22
         */
        guard let oldParentPhase else {
            // <+52>
            data.phase = newParentPhase
            return
        }
        
        if abs(Int(newParentPhase.resetSeed) - Int(oldParentPhase.resetSeed)) >= 1 {
            // <+112>
            data.phase.resetSeed &+= 1
            
            if let delegate {
                delegate.graphDidChange()
            }
        }
        
        // <+264>
        if (oldParentPhase.isInserted != newParentPhase.isInserted) {
            data.phase.isBeingRemoved = newParentPhase.isBeingRemoved
        }
        
        // <+364>
    }
    
    func updatePreferenceBridge(environment: EnvironmentValues, deferredUpdate: @escaping () -> Void) {
        /*
         self = x23
         environment = x20, x21
         deferredUpdate = x22
         */
        // x21
        guard let preferenceBridge_1 = environment.preferenceBridge else {
            return
        }
        
        if
            let preferenceBridge_2 = _preferenceBridge,
            preferenceBridge_1 === preferenceBridge_2
        {
            // <+300>
        } else {
            // <+148>
            if GraphHost.isUpdating {
                // <+184>
                Update.enqueueAction(reason: nil) { 
                    deferredUpdate()
                }
            } else {
                // <+268>
                self.setPreferenceBridge(to: preferenceBridge_1, isInvalidating: false)
            }
        }
    }
    
    package var rootViewInsets: EdgeInsets {
        fatalError("TODO")
    }
    
    private func beginNextUpdate(at time: Time) {
        if data.time != time {
            data.time = time
            nextUpdate.views = ViewGraph.NextUpdate()
        }
        
        data.updateSeed += 1
        mainUpdates = Int(data.graph!.counter(options: [.unknown2, .unknown8]))
    }
    
    private func setPreferenceBridge(to: PreferenceBridge?, isInvalidating: Bool) {
        fatalError("TODO")
    }
}

extension ViewGraph {
    package struct Outputs: OptionSet {
        package let rawValue: UInt8
        
        package init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        
        package static var displayList: Outputs {
            return Outputs(rawValue: 1 << 0)
        }
        
        package static var platformItemList: Outputs {
            return Outputs(rawValue: 1 << 1)
        }
        
        package static var viewResponders: Outputs {
            return Outputs(rawValue: 1 << 2)
        }
        
        package static var layout: Outputs {
            return Outputs(rawValue: 1 << 4)
        }
        
        package static var focus: Outputs {
            return Outputs(rawValue: 1 << 5)
        }
        
        package static var all: Outputs {
            return [.displayList, .viewResponders, .layout, .focus]
        }
        
        package static var defaults: Outputs {
            return Outputs(rawValue: .max)
        }
    }
}

extension ViewGraph {
    package struct NextUpdate {
        var time: Time = .infinity
        var _internal: TimeInterval = .infinity
        private var _defaultIntervalWasRequested: Bool = false
        private var reasons: Set<UInt32> = []
        
        init() {}
    }
}

extension ViewGraph {
    // 원래 없음
    var rootDepthTransform: RootDepthTransform {
        return RootDepthTransform(
            transform: _transform,
            layoutDirection: OptionalAttribute(),
            proposedSize: _proposedSize,
            safeAreaInsets: OptionalAttribute(_safeAreaInsets),
            childLayoutComputer: OptionalAttribute()
        )
    }
}

extension ViewGraph: ViewGraphRenderHost {
    func renderDisplayList(_ displayList: DisplayList, asynchronously: Bool, time: Time, nextTime: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time {
        /*
         asynchronously = x25
         result pointer = x24
         displayList = ((x29 - 0x100) & (x29 - 0xf4) & w23)
         time = d8
         nextTime = d9
         targetTimestamp = x27 (value) / w28 (case)
         version = x21
         maxVersion = x19
         */
        // x29 = sp + 0x70
        // x22
        guard let delegate else {
            return Time(seconds: .nan)
        }
        
        // <+140>
        
        // w23(displayList.properties) = (x29 - 0x14 - 0x100)
        // x21(version) = (x29 - 0x10 - 0x100)
        // x19(maxVersion) = (x29 = 0x8 - 0x100)
        
        guard
            // x21
            let renderDelegate = delegate.as(ViewGraphRenderDelegate.self),
            // x23
            let viewRenderer = delegate.as(DisplayList.ViewRenderer.self)
        else {
            return Time(seconds: .nan) 
        }
        
        let renderDelegateBox = UncheckedSendable(renderDelegate)
        let viewRendererBox = UncheckedSendable(viewRenderer)
        
        @MainActor
        func renderOnMainThread() -> Time {
            let renderDelegate = renderDelegateBox.value
            let viewRenderer = viewRendererBox.value
            
            var context = ViewGraphRenderContext(contentsScale: 0, opaqueBackground: false)
            renderDelegate.updateRenderContext(&context)
            CustomEventTrace.animationTick(onMain: true, time: time)
            
            let renderingRootView = renderDelegate.renderingRootView
            return renderDelegate.withMainThreadRender(wasAsync: true) {
                // closure #1 () -> SwiftUI.Time in renderOnMainThread() -> SwiftUI.Time
                let environment = DisplayList.ViewRenderer.Environment(contentsScale: viewRenderer.configuration.contentsScale ?? context.contentsScale)
                return viewRenderer.render(rootView: renderingRootView, from: displayList, time: time, version: version, maxVersion: maxVersion, environment: environment)
            }
        }
        
        // <+276>
        if asynchronously {
            CustomEventTrace.animationTick(onMain: false, time: time)
            if
                !viewRenderer.configChanged,
                let renderer = viewRenderer.renderer
            {
                // x29 - 0xa8
                let renderAsyncTime = renderer.renderAsync(to: displayList, time: time, targetTimestamp: targetTimestamp, version: version, maxVersion: maxVersion)
                // d10
                if let renderAsyncTime {
                    // <+1772>
                    // d9
                    let d9: Time
                    if nextTime < renderAsyncTime {
                        d9 = nextTime
                    } else {
                        d9 = renderAsyncTime
                    }
                    
                    let d10 = viewRenderer.configuration.minFrameInterval
                    let d0: Time
                    if d9.seconds < d10 {
                        d0 = d9
                    } else {
                        d0 = Time(seconds: d10)
                    }
                    return d0
                }
            }
            
            // <+552>
            var nextTime = nextTime
            Update.syncMain {
                nextTime = renderOnMainThread()
            }
            return nextTime
        } else {
            // <+1164>
            return MainActor.assumeIsolated {
                return renderOnMainThread()
            }
        }
    }
}

extension ViewGraph {
    static func sizeThatFits(_: _ProposedSize, layoutComputer: LayoutComputer?, insets: EdgeInsets) -> CGSize {
        fatalError("TODO")
    }
}

fileprivate struct RootTransform: Rule {
    var value: ViewTransform {
        fatalError("TODO")
    }
}

package protocol ViewGraphFeature {
    func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph)
    func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph)
    func uninstantiate(graph: ViewGraph)
    func isHiddenForReuseDidChange(graph: ViewGraph)
    func allowsAsyncUpdate(graph: ViewGraph) -> Bool?
    mutating func needsUpdate(graph: ViewGraph) -> Bool
    mutating func update(graph: ViewGraph)
    func outputsDidChange(graph: ViewGraph)
}

extension ViewGraphFeature {
    package func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        // nop
    }
    
    package func uninstantiate(graph: ViewGraph) {
        // nop
    }
    
    package func isHiddenForReuseDidChange(graph: ViewGraph) {
        // nop
    }
    
    package func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        return false
    }
    
    package func needsUpdate(graph: ViewGraph) -> Bool {
        return false
    }
    
    package func update(graph: ViewGraph) {
        // nop
    }
    
    package func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        // nop
    }
    
    package func outputsDidChange(graph: ViewGraph) {
        // nop
    }
}

struct ViewGraphGeometryObservers<T: ViewGraphGeometryMeasurer> {
    private var store: [T.Size: ViewGraphGeometryObservers<T>.Observer] = [:]
    
    func addObserver(for proposal: T.Proposal, exclusive: Bool, callback: (T.Size, T.Size) -> Void) {
        fatalError("TODO")
    }
    
    func stopObserving(proposal: T.Proposal) {
        fatalError("TODO")
    }
    
    func removeAll() {
        fatalError("TODO")
    }
    
    func resetObserver(for proposal: T.Proposal) {
        fatalError("TODO")
    }
}

extension ViewGraphGeometryObservers {
    fileprivate final class Observer {
        fileprivate var storage: ViewGraphGeometryObservers.Observer.Storage
        private let callback: (T.Size, T.Size) -> Void
        
        init(
            storage: ViewGraphGeometryObservers.Observer.Storage,
            callback: @escaping (T.Size, T.Size) -> Void
        ) {
            self.storage = storage
            self.callback = callback
        }
        
        func reset() {
            storage = .invalid
        }
    }
}

extension ViewGraphGeometryObservers.Observer {
    fileprivate enum Storage {
        case value(T.Size)
        case pending(T.Size, T.Size)
        case none
        case invalid
    }
}

protocol ViewGraphGeometryMeasurer {
    associatedtype Proposal
    associatedtype Size: Hashable
    
    static func measure(given: Proposal, in graph: ViewGraph) -> Size
    static func measure(proposal: Proposal, layoutComputer: LayoutComputer, insets: EdgeInsets) -> Size
    static var invalidValue: Size { get }
}

#warning("TODO 아래 지우기")

extension ViewGraphGeometryObservers where T == SizeThatFitsMeasurer {
    mutating func needsUpdate(graph: ViewGraph) -> Bool {
        guard !graph.data.isHiddenForReuse else {
            return false
        }
        
        guard !store.isEmpty else {
            return false
        }
        
        let rootLayoutComputer = graph.$rootLayoutComputer
        
        for size in store.keys {
            guard graph.requestedOutputs.contains(.layout) else {
                fatalError("Cannot fetch layout computer without layout output")
            }
            
            graph.instantiateIfNeeded()
            
            // (d9, d8)
            let sizeThatFits = ViewGraph.sizeThatFits(
                _ProposedSize(size),
                layoutComputer: rootLayoutComputer?.wrappedValue,
                insets: graph.rootViewInsets
            )
            
            let observer = store[size]!
            let currentSize: CGSize
            switch observer.storage {
            case .value(let size):
                currentSize = size
            case .pending(let size, _):
                currentSize = size
            case .none, .invalid:
                let invalidValue = SizeThatFitsMeasurer.invalidValue
                store[size]!.storage = .pending(invalidValue, invalidValue)
                return true
            }
            
            if sizeThatFits != currentSize {
                store[size]!.storage = .pending(currentSize, sizeThatFits)
                return true
            }
        }
        
        return false
    }
    
    func notify() {
        fatalError("TODO")
    }
}

extension ViewGraphGeometryObservers where T == VolumeThatFitsMeasurer {
    mutating func needsUpdate(graph: ViewGraph) -> Bool {
        guard !graph.data.isHiddenForReuse else {
            return false
        }
        
        guard !store.isEmpty else {
            return false
        }
        
        for size in store.keys {
            // d10, d9
            let measuredSize = VolumeThatFitsMeasurer.measure(
                given: _ProposedSize3D(size),
                in: graph
            )
            
            let observer = store[size]!
            let currentSize: Size3D
            switch observer.storage {
            case .value(let size):
                currentSize = size
            case .pending(let size, _):
                currentSize = size
            case .none, .invalid:
                let invalidValue = VolumeThatFitsMeasurer.invalidValue
                store[size]!.storage = .pending(invalidValue, invalidValue)
                return true
            }
            
            if size != measuredSize {
                store[size]!.storage = .pending(currentSize, measuredSize)
                return true
            }
        }
        
        return false
    }
    
    func notify() {
        fatalError("TODO")
    }
}

package protocol ViewGraphRenderDelegate: AnyObject {
    @MainActor var renderingRootView: AnyObject {
        get
    }
    
    func updateRenderContext(_ context: inout ViewGraphRenderContext)
    
    @MainActor func withMainThreadRender(wasAsync: Bool, _ body: @MainActor () -> Time) -> Time
    
    func renderIntervalForDisplayLink(timestamp: Time) -> Double
}

package struct ViewGraphRenderContext: Sendable {
    package var contentsScale: CGFloat
    package var opaqueBackground: Bool
}
