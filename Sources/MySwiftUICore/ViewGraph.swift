#warning("TODO")
internal import AttributeGraph
private import CoreGraphics
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
    private var sizeThatFitsObservers = ViewGraphGeometryObservers<SizeThatFitsMeasurer>()
    package private(set) var accessibilityEnabled = false
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
        
        // x29 - 0x68
        _ = self.sizeThatFitsObservers
        // sp + 0x60
        _ = self.features
        // sp + 0x48
        _ = self.data
        
        // sp, #0xc
        var featureNeedsUpdate = false
        // w25
        var updated = false
        // w23/w26
        var needsUpdate = false
        
        for _ in 0..<8 {
            self.runTransaction()
            // w25
            updated = (updated || self.updatePreferences())
            // w23
            needsUpdate = (needsUpdate || self.sizeThatFitsObservers.needsUpdate(graph: self))
            
            for feature in self.features {
                guard feature.flags == 0 else {
                    featureNeedsUpdate = true
                    continue
                }
                
                guard feature.needsUpdate(graph: self) else {
                    continue
                }
                
                feature.flags |= 1
                featureNeedsUpdate = true
            }
            
            // <+360>
            guard self.data.globalSubgraph.isDirty else {
                break
            }
            
            // needsUpdate = w26 (w23 아님)
        }
        
        // <+388>
        if updated {
            // <+392>
            if let delegate {
                delegate.preferencesDidChange()
            }
            
            if self._preferenceBridge != nil {
                let hostPreferenceKeys = data.$hostPreferenceKeys
                self.graphInvalidation(from: hostPreferenceKeys.identifier)
            }
            
            // <+564>
        } else {
            // <+552>
            guard (featureNeedsUpdate || needsUpdate) else {
                // <+728>
                return
            }
            // <+564>
        }
        
        // <+564>
        if featureNeedsUpdate {
            // <+568>
            for feature in self.features {
                feature.update(graph: self)
                feature.flags &= ~1
            }
        }
        
        // <+688>
        if needsUpdate {
            sizeThatFitsObservers.notify()
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
        fatalError("TODO")
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
    func update(graph: ViewGraph)
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
}

struct ViewGraphGeometryObservers<T: ViewGraphGeometryMeasurer> {
    private var store: [T.Size: ViewGraphGeometryObservers<T>.Observer] = [:]
    
    func notify() {
        fatalError("TODO")
    }
}

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
}

extension ViewGraphGeometryObservers {
    fileprivate struct Observer {
        fileprivate var storage: ViewGraphGeometryObservers.Observer.Storage
        fileprivate let callback: (T.Size, T.Size) -> Void // TODO
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
    
    static func measure(given: Proposal, in: ViewGraph) -> Size
    static func measure(proposal: Proposal, layoutComputer: LayoutComputer, insets: EdgeInsets) -> Size
    static var invalidValue: Size { get }
}
