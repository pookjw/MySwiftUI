// 7D9EDEF832940A362646A6E979F296C8

internal import AttributeGraph
package import CoreGraphics
internal import QuartzCore
private import Spatial

package final class ViewGraph: GraphHost {
    @inline(__always)
    static var current: ViewGraph {
        return GraphHost.currentHost as! ViewGraph
    }
    
    private let rootViewType: Any.Type
    private let makeRootView: (AnyAttribute, _ViewInputs) -> _ViewOutputs
    package internal(set) weak var delegate: ViewGraphDelegate? = nil
    private(set) var features = ViewGraphFeatureBuffer(contents: UnsafeHeterogeneousBuffer())
    private(set) var centersRootView = true
    private let rootView: AnyAttribute
    @Attribute private(set) var rootTransform: ViewTransform
    @Attribute var transform: ViewTransform
    @Attribute private var zeroPoint: CGPoint
    @Attribute var proposedSize: ViewSize
    @Attribute var safeAreaInsets: _SafeAreaInsetsModifier
    @Attribute private var containerShape: UnevenRoundedRectangle
    @Attribute private var rootGeometry: ViewGeometry
    @Attribute private var position: CGPoint
    @Attribute private var dimensions: ViewSize
    @OptionalAttribute var containerSize: ViewSize?
    @Attribute private var gestureTime: Time
    @Attribute private var gestureEvents: [EventID : any EventType]
    @Attribute private var inheritedPhase: _GestureInputs.InheritedPhase
    @Attribute private var gestureResetSeed: UInt32
    @OptionalAttribute private var rootPhase: GesturePhase<Void>?
    @OptionalAttribute private var gestureDebug: GestureDebug.Data?
    @OptionalAttribute private var gestureCategory: GestureCategory?
    @Attribute private var gesturePreferenceKeys: PreferenceKeys
    private var eventSubgraph: Subgraph? = nil
    @Attribute private(set) var defaultLayoutComputer: LayoutComputer
    @WeakAttribute var rootResponders: [ViewResponder]?
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
        // <+224>
        self.rootViewType = rootViewType
        self.requestedOutputs = requestedOutputs
        
        // x29 - 0xc8
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
        
        // <+588>
        let tramsform = Attribute(RootTransform())
        CustomEventTrace.recordNamedProperty(.transform, tramsform)
        self._rootTransform = tramsform
        self._transform = tramsform
        
        // <+752>
        self._zeroPoint = Attribute(value: .zero)
        
        // <+824>
        let proposedSize = Attribute(value: ViewSize.zero)
        CustomEventTrace.recordNamedProperty(.size, proposedSize)
        self._proposedSize = proposedSize
        
        // <+976>
        let containerSize = Attribute(value: ViewSize.zero)
        CustomEventTrace.recordNamedProperty(.containerSize, containerSize)
        self._containerSize = OptionalAttribute(containerSize)
        
        // <+1148>
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
        
        // <+1644>
        self._containerShape = Attribute(RootContainerShape())
        // <+1724>
        self._defaultLayoutComputer = Attribute(value: LayoutComputer.defaultValue)
        // <+1816>
        self._gestureTime = Attribute(value: Time.zero)
        // <+1864>
        self._gestureEvents = Attribute(value: [:])
        // <+1936>
        self._inheritedPhase = Attribute(value: _GestureInputs.InheritedPhase.defaultValue)
        // <+1984>
        self._gestureResetSeed = Attribute(value: 0)
        // <+2024>
        self._gesturePreferenceKeys = Attribute(value: PreferenceKeys())
        // <+2068>
        self._rootGeometry = Attribute(RootGeometry(proposedSize: self._proposedSize, safeAreaInsets: OptionalAttribute(self._safeAreaInsets)))
        // <+2148>
        self._position = self._rootGeometry.origin()
        // <+2168>
        self._dimensions = self._rootGeometry.size()
        
        // <+2244>
        self.makeRootView = { [zeroPoint = _zeroPoint, proposedSize = _proposedSize, containerShape = _containerShape, safeAreaInsets = _safeAreaInsets] attribute, inputs in
            // x29 = sp + 0x490
            /*
             attribute = sp, #0xc
             inputs = x29 - 0xc0 (sp + 0x3d0) 
             
             T = sp + 0x10
             protocol witness T: View = sp + 0x18
             _containerShape = x25
             _safeAreaInsets = x28
             */
            // sp + 0x310
            var copy_1 = inputs
            // sp + 0x370
            var copy_2 = inputs
            copy_2.position = zeroPoint
            copy_2.containerPosition = zeroPoint
            copy_2.size = proposedSize
            
            copy_2.setContainerShape(containerShape, isSystemShape: true)
            copy_1 = copy_2
            
            // inlined
            let outputs = _SafeAreaInsetsModifier.makeDebuggableView(modifier: _GraphValue(safeAreaInsets), inputs: copy_1) { [oldInputs = inputs] _, inputs in
                /*
                 inputs = x19
                 oldInputs = x3
                 T = x20
                 protocol conformance T: View = x22
                 */
                // x29 = sp + 0x320
                // $s7SwiftUI9ViewGraphC04rootC4Type16requestedOutputsACxm_AC0H0VtcAA0C0RzlufcAA01_cH0VSo11AGAttributea_AA01_C6InputsVtcfU_AjA01_D0V_ANtcfU_Tf0nnnsnn_n
                var copy = inputs
                copy.position = oldInputs.position
                copy.containerPosition = oldInputs.containerPosition
                copy.size = oldInputs.size
                
                // <+252>
                // inlined
                return T.makeDebuggableView(view: _GraphValue(Attribute<T>(identifier: attribute)), inputs: copy)
            }
            
            return outputs
        }
        
        super.init(data: data)
    }
    
    deinit {
        removePreferenceOutlets(isInvalidating: true)
        features.contents.destroy()
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
        self.rootView.unsafeCast(to: Content.self).value = rootView
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
            guard self.data.globalSubgraph.isDirty(1) else {
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
        w8 = sp04
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
        self.mainUpdates &-= 1
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
                Update.enqueueAction(reason: nil, deferredUpdate)
            } else {
                // <+268>
                self.setPreferenceBridge(to: preferenceBridge_1, isInvalidating: false)
            }
        }
    }
    
    package override func instantiateOutputs() {
        let outputs = data.rootSubgraph.apply {
            // self = x22
            // x29 - 0x80
            let original = _ViewInputs(
                data.inputs,
                position: $position,
                size: $dimensions,
                transform: $transform,
                containerPosition: $zeroPoint,
                hostPreferenceKeys: data.$hostPreferenceKeys
            )
            // x29 - 0xe0
            var inputs = original
            
            // w27
            let requestedOutputs = requestedOutputs
            
            if requestedOutputs.contains(.layout) {
                // <+176>
                inputs.requestsLayoutComputer = true
                inputs.needsGeometry = true
                inputs.containerSize = _containerSize
            }
            
            // <+200>
            inputs.preferences.add(HostPreferencesKey.self)
            
            // <+408>
            if requestedOutputs.contains(.displayList) {
                unsafe inputs.preferences.add(DisplayList.Key.self)
            }
            
            // <+600>
            if requestedOutputs.contains(.viewResponders) {
                inputs.preferences.add(ViewRespondersKey.self)
            }
            
            // <+792>
            if let preferenceBridge = _preferenceBridge {
                preferenceBridge.wrapInputs(&inputs)
            }
            
            _ViewDebug.initialize(inputs: &inputs)
            
            if inputs.needsGeometry {
                inputs.makeRootMatchedGeometryScope()
            }
            
            if inputs.base.options.contains(.needsStableDisplayListIDs) {
                // <+1560>
                inputs.base.pushStableType(rootViewType)
            }
            
            // <+980>
            $rootGeometry.mutateBody(as: RootGeometry.self, invalidating: true) { geometry in
                geometry.$layoutDirection = inputs.layoutDirection
            }
            
            for feature in self.features {
                feature.modifyViewInputs(inputs: &inputs, graph: self)
            }
            
            var outputs = makeRootView(rootView, inputs)
            
            for feature in self.features {
                feature.modifyViewOutputs(outputs: &outputs, inputs: inputs, graph: self)
            }
            
            return outputs
        }
        
        // <+148>
        $rootGeometry.mutateBody(as: RootGeometry.self, invalidating: true) { geometry in
            geometry.$childLayoutComputer = outputs.layoutComputer
        }
        
        if
            requestedOutputs.contains(.displayList),
            let displayList: Attribute<DisplayList> = unsafe outputs.preferences[DisplayList.Key.self] // x25
        {
            // <+256>
            self._rootDisplayList = data.rootSubgraph.apply {
                let attribute = Attribute(RootDisplayList(content: displayList, time: data.$time))
                return WeakAttribute(attribute)
            }
        }
        
        // <+448>
        if requestedOutputs.contains(.viewResponders) {
            let value: Attribute<[ViewResponder]>? = outputs.preferences[ViewRespondersKey.self]
            self.$rootResponders = value
        }
        
        // <+504>
        if requestedOutputs.contains(.layout) {
            self._rootLayoutComputer = WeakAttribute(outputs.layoutComputer)
        }
        
        // <+524>
        let preferenceValues: Attribute<PreferenceValues>? = outputs.preferences[HostPreferencesKey.self]
        self.hostPreferenceValues = WeakAttribute(preferenceValues)
        self.makePreferenceOutlets(outputs: outputs)
    }
    
    package override func uninstantiateOutputs() {
        fatalError("TODO")
    }
    
    package var rootViewInsets: EdgeInsets {
        fatalError("TODO")
    }
    
    func setSize(_ size: ViewSize) {
        guard $proposedSize.setValue(size) else {
            return
        }
        
        if let delegate {
            delegate.graphDidChange()
        }
    }
    
    fileprivate func setPreferenceBridge(to bridge: PreferenceBridge?, isInvalidating: Bool) {
        /*
         self = x19
         bridge = x21
         isInvalidating = x22
         */
        guard _preferenceBridge !== bridge else {
            return
        }
        
        fatalError("TODO")
    }
    
    private func beginNextUpdate(at time: Time) {
        if data.time != time {
            data.time = time
            nextUpdate.views = ViewGraph.NextUpdate()
        }
        
        data.updateSeed &+= 1
        mainUpdates = Int(data.graph!.counter(options: [.unknown1, .unknown3]))
    }
    
    private func makePreferenceOutlets(outputs: _ViewOutputs) {
        /*
         self = x21
         outputs = x22
         */
        // x19
        guard _preferenceBridge != nil else {
            return
        }
        
        fatalError("TODO")
    }
    
    func setSafeAreaInsets(_ elements: [SafeAreaInsets.Element]) -> Bool {
        /*
         elements = x21
         */
        let changed = $safeAreaInsets.setValue(_SafeAreaInsetsModifier(elements: elements, nextInsets: nil))
        guard changed else {
            return false
        }
        
        if let delegate {
            delegate.graphDidChange()
        }
        
        return true
    }
    
    package subscript<T: ViewGraphFeature>(_ type: T.Type) -> UnsafeMutablePointer<T>? {
        return unsafe features[type]
    }
    
    private func removePreferenceOutlets(isInvalidating: Bool) {
        // isInvalidating = x19
        guard _preferenceBridge != nil else {
            return
        }
        
        fatalError("TODO")
    }
    
    package var viewGraphInputs: _GraphInputs {
        // return register -> x19
        // sp + 0x90
        var copy_1 = data.inputs
        
        guard let preferenceBridge = _preferenceBridge else {
            return copy_1
        }
        
        copy_1.customInputs = preferenceBridge.bridgedViewInputs
        return copy_1
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
            return Outputs(rawValue: .max)
        }
        
        package static var defaults: Outputs {
            return [.displayList, .viewResponders, .layout, .focus]
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
            safeAreaInsets: OptionalAttribute($safeAreaInsets),
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
        let unchecked = UncheckedSendable(displayList)
        
        @MainActor
        func renderOnMainThread() -> Time {
            let renderDelegate = renderDelegateBox.value
            let viewRenderer = viewRendererBox.value
            
            var context = ViewGraphRenderContext(contentsScale: 0, opaqueBackground: false)
            renderDelegate.updateRenderContext(&context)
            CustomEventTrace.animationTick(onMain: true, time: time)
            
            let renderingRootView = renderDelegate.renderingRootView
            return renderDelegate.withMainThreadRender(wasAsync: false) { [displayList = unchecked.value] in
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
        if
            let delegate = ViewGraph.current.delegate,
            let provider = delegate.as(RootTransformProvider.self)
        {
            return provider.rootTransform()
        } else {
            return ViewTransform()
        }
    }
}

package protocol ViewGraphFeature {
    mutating func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph)
    mutating func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph)
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
        return true
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
    private var store: [T.Proposal: ViewGraphGeometryObservers<T>.Observer] = [:]
    
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
    associatedtype Proposal: Hashable
    associatedtype Size: Equatable
    
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
                size,
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
                given: size,
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
            
            if measuredSize != currentSize {
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
    
    @MainActor func updateRenderContext(_ context: inout ViewGraphRenderContext)
    
    @MainActor func withMainThreadRender(wasAsync: Bool, _ body: @MainActor () -> Time) -> Time
    
    func renderIntervalForDisplayLink(timestamp: Time) -> Double
}

package struct ViewGraphRenderContext: Sendable {
    package var contentsScale: CGFloat
    package var opaqueBackground: Bool
}

fileprivate struct RootDisplayList: AsyncAttribute, Rule {
    @Attribute var content: DisplayList
    @Attribute var time: Time
    
    var value: (DisplayList, DisplayList.Version) {
        // $s14AttributeGraph0A0VyACyxGqd__c5ValueQyd__RszAA4RuleRd__lufcADSPyqd__GXEfU_ySv_So11AGAttributeatcyXEfU_ySv_AJtcfu_7SwiftUI11DisplayListV_AM7VersionVt_AK04RoothI033_7D9EDEF832940A362646A6E979F296C8LLVTt1g5
        let displayList = content
        let version = DisplayList.Version(forUpdate: ())
        
        displayList.applyViewGraphTransform(time: $time, version: version)
        
        return (displayList, version)
    }
}

extension ViewGraphHost {
    package func tearDown(delegate: ViewGraphRootValueUpdater) {
        delegate.invalidate()
        Update.ensure { 
            let viewGraph = viewGraph
            viewGraph.setPreferenceBridge(to: nil, isInvalidating: false)
            viewGraph.invalidate()
        }
    }
}
