#warning("TODO")
private import AttributeGraph
private import CoreGraphics

package class ViewGraph: GraphHost {
    private let rootViewType: Any.Type
    private let makeRootView: (AnyAttribute, _ViewInputs) -> _ViewOutputs
    private weak var delegate: ViewGraphDelegate?
    private var features: ViewGraphFeatureBuffer
    private var centersRootView: Bool
    private let rootView: AnyAttribute
    @Attribute private var rootTransform: ViewTransform
    @Attribute private var transform: ViewTransform
    @Attribute private var zeroPoint: CGPoint
    @Attribute private var proposedSize: ViewSize
    @Attribute private var safeAreaInsets: _SafeAreaInsetsModifier
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
    private var eventSubgraph: Subgraph?
    @Attribute private var defaultLayoutComputer: LayoutComputer
    @WeakAttribute private var rootResponders: [ViewResponder]?
    @WeakAttribute private var rootLayoutComputer: LayoutComputer?
    @WeakAttribute private var rootDisplayList: (DisplayList, DisplayList.Version)?
    private var sizeThatFitsObservers: ViewGraphGeometryObservers<SizeThatFitsMeasurer>
    private var accessibilityEnabled: Bool
    private var requestedOutputs: ViewGraph.Outputs
    private var disabledOutputs: ViewGraph.Outputs
    private var mainUpdates: Int
    private var nextUpdate: (views: ViewGraph.NextUpdate, gestures: ViewGraph.NextUpdate)
    private weak var preferenceBridge: PreferenceBridge?
    private var bridgedPreferences: [(PreferenceKey.Type, AnyAttribute)]
    
    package override func addPrefence<T>(_ key: T.Type) where T : HostPreferenceKey {
        fatalError("TODO")
    }
    
    package init<T: View>(rootViewType: T.Type = T.self, requestedOutputs: ViewGraph.Outputs = .defaults) {
        // TODO: Trace 처리 안한 곳 있음, Trace Helper 추가
        self.delegate = nil
        self.features = ViewGraphFeatureBuffer(contents: UnsafeHeterogeneousBuffer())
        self.centersRootView = true
        self._containerSize = OptionalAttribute()
        self._rootPhase = OptionalAttribute()
        self._gestureDebug = OptionalAttribute()
        self._gestureCategory = OptionalAttribute()
        self.eventSubgraph = nil
        self._rootLayoutComputer = WeakAttribute()
        self._rootDisplayList = WeakAttribute()
        self._rootResponders = WeakAttribute()
        self.sizeThatFitsObservers = ViewGraphGeometryObservers<SizeThatFitsMeasurer>()
        self.accessibilityEnabled = false
        self.disabledOutputs = ViewGraph.Outputs(rawValue: 0)
        self.mainUpdates = 0
        self.nextUpdate = (views: NextUpdate(), gestures: NextUpdate())
        self.preferenceBridge = nil
        self.bridgedPreferences = []
        self.rootViewType = rootViewType
        self.requestedOutputs = requestedOutputs
        self.makeRootView = { _, _ in
            fatalError("TODO")
        }
        self.rootView = Attribute(type: rootViewType).identifier
        
        // 검증 필요
        let tramsform = Attribute(type: ViewTransform.self)
        self._rootTransform = tramsform
        self._transform = tramsform
        self._zeroPoint = Attribute(value: .zero)
        self._proposedSize = Attribute(value: ViewSize())
        self._safeAreaInsets = Attribute(value: _SafeAreaInsetsModifier())
        self._containerShape = Attribute(type: UnevenRoundedRectangle.self)
        self._rootGeometry = Attribute(type: ViewGeometry.self)
        
        super.init(data: GraphHost.Data())
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
        private var time: Time = .infinity
        private var _internal: TimeInterval = .greatestFiniteMagnitude
        private var _defaultIntervalWasRequested: Bool = false
        private var reasons: Set<UInt32> = []
    }
}
