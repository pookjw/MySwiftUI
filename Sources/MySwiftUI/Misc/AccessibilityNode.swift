// EE68159C4F54001FA5A3813EBA5DD945

#warning("TODO")
internal import MySwiftUICore

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
