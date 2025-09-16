#warning("TODO")
package import AttributeGraph

package struct CustomEventTrace {
    static nonisolated(unsafe) var recorder: Recorder? = nil
    
    public static func instantiateBegin(_ subgraph: Subgraph) {
//        guard
//            enabledCategories[Int(CustomEventCategory.instantiation.rawValue)],
//            let recorder
//        else {
//            return
//        }
//        
//        // TODO
//        recorder.graph.addTraceEvent(recorder.cefOp, value: -1)
        fatalError("TODO")
    }
    
    public static func register(graph: Graph) {
//        fatalError("TODO")
    }
    
    public static var isEnabled: Bool {
        return recorder != nil
    }
    
    public static func setEnabledCategory(_ category: CustomEventCategory, enabled: Bool) {
        enabledCategories[Int(category.rawValue)] = enabled
    }
    
    public static func trace<T>(_ cateogry: CustomEventCategory, _: Int8, value: T) {
//        fatalError("TODO")
    }
    
    public static func getNextTrace(id: inout UInt32) -> UInt32 {
        fatalError("TODO")
    }
    
    public static func observableFireWithTransaction(transaction: UInt32, key: AnyKeyPath?, attribute: AnyAttribute) {
//        fatalError("TODO")
    }
    
    public static func transactionBegin(_: UInt32) {
//        fatalError("TODO")
    }
    
    public static func transactionEnd(_: UInt32) {
//        fatalError("TODO")
    }
    
    public static func transactionAppend(_: UInt32) {
//        fatalError("TODO")
    }
    
    public static func transactionEnqueue(_: UInt32) {
//        fatalError("TODO")
    }
    
    public static func transactionContinueAsNewTransaction(_: UInt32) {
//        fatalError("TODO")
    }
    
    public static func transactionContinueAsContinuation(_: GraphHost) {
//        fatalError("TODO")
    }
    
    public static func enqueueAction(_: UInt32, _: CustomEventTrace.ActionEventType.Reason?) {
//        fatalError("TODO")
    }
    
    public static func startAction(_: UInt32, _: CustomEventTrace.ActionEventType.Reason?) {
//        fatalError("TODO")
    }
    
    public static func finishAction(_: UInt32, _: CustomEventTrace.ActionEventType.Reason?) {
//        fatalError("TODO")
    }
    
    public static func additionalInfo(_: UInt32, info: AnyAttribute?) {
//        fatalError("TODO")
    }
    
    public static func setNeedsUpdate(values: ViewGraphRootValues, graph: Graph) {
//        fatalError("TODO")
    }
    
    fileprivate static func extractFunctionData(_: Animation.Function, _: inout Double, _: inout Double, _: inout Double, _: inout Double) {
//        fatalError("TODO")
    }
    
    public static func animationBegin(attribute: AnyAttribute?, propertyType: Any.Type, function: Animation.Function) {
//        fatalError("TODO")
    }
    
    public static func animationEnd(_: AnyAttribute?) {
//        fatalError("TODO")
    }
    
    public static func animationAttrUpdate(_: AnyAttribute?) {
//        fatalError("TODO")
    }
    
    public static func animationScheduleTick(attribute: AnyAttribute?, time: Time) {
//        fatalError("TODO")
    }
    
    public static func animationTick(onMain: Bool, time: Time) {
//        fatalError("TODO")
    }
    
    public static func animationRetarget(attribute: AnyAttribute?, propertyType: Any.Type, function: Animation.Function) {
//        fatalError("TODO")
    }
    
    public static func recordGraphHostRoot(_: Graph?, _: Subgraph, newRoot: Subgraph, _: GraphHost) {
//        fatalError("TODO")
    }
    
    public static func recordNamedProperty<T>(_: ViewGraphRootValues, _: Attribute<T>) {
//        fatalError("TODO")
    }
    
    public static func instantiateEnd(_: Subgraph) {
//        fatalError("TODO")
    }
    
    public static func instantiate<T>(root: Subgraph, closure: () -> T) -> T {
//        fatalError("TODO")
        return closure()
    }
    
    public static func uninstantiate<T>(root: Subgraph, closure: () -> T) -> T {
        // defer 있음
//        fatalError("TODO")
        return closure()
    }
    
    public static func dynamicBodyUpdate(buffer: _DynamicPropertyBuffer, hasValue: Bool, bodyChanged: Bool) {
//        fatalError("TODO")
    }
    
    fileprivate static nonisolated(unsafe) var enabledCategories: [Bool] = Array(repeating: false, count: 256)
}

extension CustomEventTrace {
    package enum ActionEventType {
        case enqueue
        case start
        case finish
        case gestureMetadata
    }
}

extension CustomEventTrace.ActionEventType {
    package enum Reason {
        case onAppear
        case onChange
        case onDisappear
        case gesture
        case didReleaseButton
        case animationLogicallyCompleted
        case animationRemoved
        case hoverChanged
        case scrollChanged
        case scrollPrefetch
        case signalPrefetch
        case navSelectionUpdate
        case splitSidebarVisibilityChanged
        case preferenceChange
        case onFocusChanged
        case navStackPush
        case navStackPop
    }
}

extension CustomEventTrace {
    // TODO: final인지 검증
    class Recorder {
        private(set) var graph: Graph
        private(set) var cefOp: UnsafeMutablePointer<Int8>
        
        init(graph: Graph) {
            // inlined
            fatalError("TODO")
        }
    }
}

package enum CustomEventCategory: Int8 {
    case unknown = 0
    case observable = 79
    case transaction = 84
    case action = 65
    case graph = 71
    case animation = 66
    case instantiation = 67
    case dynamicProperties = 68
}
