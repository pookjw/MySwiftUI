#warning("TODO")
internal import AttributeGraph
private import CoreGraphics
package import QuartzCore

package final class ViewGraph: GraphHost {
    private let rootViewType: Any.Type
    private let makeRootView: (AnyAttribute, _ViewInputs) -> _ViewOutputs
    weak var delegate: ViewGraphDelegate? = nil
    private var features = ViewGraphFeatureBuffer(contents: UnsafeHeterogeneousBuffer())
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
    @WeakAttribute private var rootLayoutComputer: LayoutComputer?
    @WeakAttribute private var rootDisplayList: (DisplayList, DisplayList.Version)?
    private var sizeThatFitsObservers = ViewGraphGeometryObservers<SizeThatFitsMeasurer>()
    private var accessibilityEnabled = false
    package private(set) var requestedOutputs: ViewGraph.Outputs
    private var disabledOutputs = ViewGraph.Outputs(rawValue: 0)
    private var mainUpdates: Int = 0
    private var nextUpdate = (views: NextUpdate(), gestures: NextUpdate())
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
        self._defaultLayoutComputer = Attribute(value: LayoutComputer.defaultValue)
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
        private var time: Time = .infinity
        private var _internal: TimeInterval = .greatestFiniteMagnitude
        private var _defaultIntervalWasRequested: Bool = false
        private var reasons: Set<UInt32> = []
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
    
}

fileprivate struct RootTransform: Rule {
    var value: ViewTransform {
        fatalError("TODO")
    }
}

package protocol ViewGraphFeature {
    // TODO
}
