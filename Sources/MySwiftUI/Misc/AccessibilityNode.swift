// EE68159C4F54001FA5A3813EBA5DD945

#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph

struct AccessibilityNodeList {
    //    private var nodes: [AccessibilityNode]
    private(set) var version: DisplayList.Version
}

extension _GraphInputs {
    @inline(__always)
    var accessibilityCapturesViewResponders: Bool {
        get {
            return self[AccessibilityCapturesViewResponders.self]
        }
        set {
            self[AccessibilityCapturesViewResponders.self] = newValue
        }
    }
}

fileprivate struct AccessibilityCapturesViewResponders: ViewInputBoolFlag {
    
}

struct AccessibilityNodesKey: PreferenceKey {
    static nonisolated(unsafe) let defaultValue = AccessibilityNodeList(/*nodes: [], */version: DisplayList.Version())
    
    static func reduce(value: inout AccessibilityNodeList, nextValue: () -> AccessibilityNodeList) {
        fatalError("TODO")
    }
}

struct AccessibilityViewResponderUpdater {
    @OptionalAttribute private var viewResponders: [ViewResponder]?
    @OptionalAttribute private var kind: ContentShapeKinds?
    private let token: AccessibilityAttachmentToken?
    private var idHash: Int
    private var attachment: WeakAttribute<AccessibilityGeometryStorage.Responders>?
    private var subgraph: Subgraph
    
    init(
        viewResponders: OptionalAttribute<[ViewResponder]>,
        kind: OptionalAttribute<ContentShapeKinds>,
        token: AccessibilityAttachmentToken?,
        idHash: Int,
        attachment: WeakAttribute<AccessibilityGeometryStorage.Responders>?,
        subgraph: Subgraph
    ) {
        self._viewResponders = viewResponders
        self._kind = kind
        self.token = token
        self.idHash = idHash
        self.attachment = attachment
        self.subgraph = subgraph
    }
}

struct AccessibilityGeometryStorage {
    // TODO
}

extension AccessibilityGeometryStorage {
    struct Responders {
        private var responders: [ViewResponder]
        private var seed: UInt32
    }
}
