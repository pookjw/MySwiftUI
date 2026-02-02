package import AttributeGraph

package struct CustomEventTrace {
    static nonisolated(unsafe) var recorder: Recorder? = nil
    
    @inlinable
    public static func instantiateBegin(_ subgraph: Subgraph) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.instantiation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.instantiation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.InstantiationEventType.instantiateBegin.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: subgraph)
    }
    
    public static func register(graph: Graph) {
        fatalError("TODO")
    }
    
    public static var isEnabled: Bool {
        return unsafe recorder != nil
    }
    
    public static func setEnabledCategory(_ category: CustomEventCategory, enabled: Bool) {
        unsafe enabledCategories[Int(category.rawValue)] = enabled
    }
    
    public static func trace<T>(_ cateogry: CustomEventCategory, _: Int8, value: T) {
        fatalError("TODO")
    }
    
    public static func getNextTrace(id: inout UInt32) -> UInt32 {
        fatalError("TODO")
    }
    
    public static func observableFireWithTransaction(transaction: UInt32, key: AnyKeyPath?, attribute: AnyAttribute) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.observable.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.observable.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.ObservableEventType.firedWithTransaction.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (transaction, key, attribute))
    }
    
    public static func transactionBegin(_ transaction: UInt32) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.transaction.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.transaction.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.TransactionEventType.begin.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: transaction)
    }
    
    public static func transactionEnd(_ transaction: UInt32) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.transaction.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.transaction.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.TransactionEventType.end.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: transaction)
    }
    
    public static func transactionAppend(_ transaction: UInt32) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.transaction.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.transaction.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.TransactionEventType.append.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: transaction)
    }
    
    public static func transactionEnqueue(_ transaction: UInt32) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.transaction.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.transaction.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.TransactionEventType.enqueue.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: transaction)
    }
    
    public static func transactionContinueAsNewTransaction(_ transaction: UInt32) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.transaction.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.transaction.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.TransactionEventType.continueAsNewTransaction.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: transaction)
    }
    
    public static func transactionContinueAsContinuation(_ graphHost: GraphHost) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.transaction.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.transaction.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.TransactionEventType.continueAsContinuation.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: graphHost)
    }
    
    public static func enqueueAction(_ actionID: UInt32, _ reason: CustomEventTrace.ActionEventType.Reason?) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.action.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.action.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.ActionEventType.enqueue.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (actionID, reason?.rawValue))
    }
    
    public static func startAction(_ actionID: UInt32, _ reason: CustomEventTrace.ActionEventType.Reason?) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.action.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.action.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.ActionEventType.start.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (actionID, reason?.rawValue))
    }
    
    public static func finishAction(_ actionID: UInt32, _ reason: CustomEventTrace.ActionEventType.Reason?) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.action.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.action.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.ActionEventType.finish.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (actionID, reason?.rawValue))
    }
    
    public static func additionalInfo(_: UInt32, info: AnyAttribute?) {
        fatalError("TODO")
    }
    
    public static func setNeedsUpdate(values: ViewGraphRootValues, graph: Graph) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.graph.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.graph.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (values, graph))
    }
    
    public static func animationBegin(attribute: AnyAttribute?, propertyType: Any.Type, function: Animation.Function) {
        var d0: Double = 1.0
        var d1: Double = .nan
        var d2: Double = .nan
        var d3: Double = .nan
        CustomEventTrace.extractFunctionData(function, &d0, &d1, &d2, &d3)
        
        guard
            unsafe enabledCategories[Int(CustomEventCategory.animation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.animation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.AnimationEventType.animationBegin.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (attribute, propertyType, d0, d1, d2, d3))
    }
    
    public static func animationEnd(attribute: AnyAttribute?) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.animation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.animation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.AnimationEventType.animationEnd.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: attribute)
    }
    
    public static func animationAttrUpdate(_ attribute: AnyAttribute?) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.animation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.animation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.AnimationEventType.animationAttrUpdate.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: attribute)
    }
    
    public static func animationScheduleTick(attribute: AnyAttribute?, time: Time) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.animation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.animation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.AnimationEventType.animationScheduleTick.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (attribute, time.seconds))
    }
    
    public static func animationTick(onMain: Bool, time: Time) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.animation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.animation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.AnimationEventType.animationTick.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (onMain, time.seconds))
    }
    
    public static func animationRetarget(attribute: AnyAttribute?, propertyType: Any.Type, function: Animation.Function) {
        var d0: Double = 1.0
        var d1: Double = .nan
        var d2: Double = .nan
        var d3: Double = .nan
        CustomEventTrace.extractFunctionData(function, &d0, &d1, &d2, &d3)
        
        guard
            unsafe enabledCategories[Int(CustomEventCategory.animation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.animation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.AnimationEventType.animationRetarget.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (attribute, propertyType, d0, d1, d2, d3))
    }
    
    public static func recordGraphHostRoot(_ graph: Graph?, _ globalGraph: Subgraph, newRoot: Subgraph, _ host: GraphHost) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.instantiation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.instantiation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.InstantiationEventType.assign.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (host.hostKind().rawValue, graph, globalGraph, newRoot))
    }
    
    public static func recordNamedProperty<T>(_ values: ViewGraphRootValues, _ attribute: Attribute<T>) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.instantiation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.instantiation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.InstantiationEventType.recordNamedProperty.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (values, attribute))
    }
    
    public static func instantiateEnd(_ subgraph: Subgraph) {
        guard
            unsafe enabledCategories[Int(CustomEventCategory.instantiation.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.instantiation.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.InstantiationEventType.instantiateEnd.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: subgraph)
    }
    
    public static func instantiate<T>(root: Subgraph, closure: () -> T) -> T {
        CustomEventTrace.instantiateBegin(root)
        let result = closure()
        CustomEventTrace.instantiateEnd(root)
        return result
    }
    
    public static func uninstantiate<T>(root: Subgraph, closure: () -> T) -> T {
        fatalError("TODO")
    }
    
    public static func dynamicBodyUpdate(buffer: _DynamicPropertyBuffer, hasValue: Bool, bodyChanged: Bool) {
        /*
         buffer -> x19
         hasValue -> w23
         bodyChanged -> w20
         */
        guard
            unsafe enabledCategories[Int(CustomEventCategory.dynamicProperties.rawValue)],
            let recorder = unsafe recorder
        else {
            return
        }
        
        let cefOp = unsafe recorder.cefOp
        unsafe cefOp.advanced(by: 4).pointee = CustomEventCategory.dynamicProperties.rawValue
        unsafe cefOp.advanced(by: 5).pointee = CustomEventTrace.DynamicPropertyEventType.propertiesUpdated.rawValue
        unsafe recorder.graph.addTraceEvent(cefOp, value: (hasValue, bodyChanged))
    }
    
    fileprivate static nonisolated(unsafe) var enabledCategories: [Bool] = Array(repeating: false, count: 256)
    
    fileprivate static func extractFunctionData(_ function: Animation.Function, _ d0: inout Double, _ d1: inout Double, _ d2: inout Double, _ d3: inout Double) {
        fatalError("TODO")
    }
}

extension CustomEventTrace {
    @unsafe final class Recorder {
        private(set) var graph: Graph
        private(set) var cefOp: UnsafeMutablePointer<Int8>
        
        init(graph: Graph) {
            // inlined
            fatalError("TODO")
        }
    }
}

package enum CustomEventCategory: Int8, Hashable {
    case unknown = 0
    case observable = 0x4f
    case transaction = 0x54
    case action = 0x41
    case graph = 0x47
    case animation = 0x42
    case instantiation = 0x43
    case dynamicProperties = 0x44
}

extension CustomEventTrace {
    package enum ObservableEventType: Int8, Hashable {
        case firedWithTransaction = 0x46
    }
}

extension CustomEventTrace {
    package enum TransactionEventType: Int8, Hashable {
        case begin = 0x42
        case end = 0x45
        case append = 0x41
        case enqueue = 0x51
        case continueAsNewTransaction = 0x4e
        case continueAsContinuation = 0x43
    }
}

extension CustomEventTrace {
    package enum ActionEventType: Int8, Hashable {
        case enqueue = 0x45
        case start = 0x53
        case finish = 0x46
        case gestureMetadata = 0x47
    }
}

extension CustomEventTrace.ActionEventType {
    package enum Reason: UInt32, Hashable {
        case onAppear = 0x41
        case onChange = 0x43
        case onDisappear = 0x44
        case gesture = 0x47
        case didReleaseButton = 0x52
        case animationLogicallyCompleted = 0x53
        case animationRemoved = 0x54
        case hoverChanged = 0x55
        case scrollChanged = 0x56
        case scrollPrefetch = 0x57
        case signalPrefetch = 0x58
        case navSelectionUpdate = 0x59
        case splitSidebarVisibilityChanged = 0x5a
        case preferenceChange = 0x5b
        case onFocusChanged = 0x5c
        case navStackPush = 0x5d
        case navStackPop = 0x5e
    }
}

extension CustomEventTrace {
    package enum AnimationEventType: Int8, Hashable {
        case animationBegin = 0x1
        case animationEnd = 0x2
        case animationAttrUpdate = 0x3
        case animationScheduleTick = 0x4
        case animationTick = 0x5
        case animationRetarget = 0x6
    }
}

extension CustomEventTrace {
    package enum InstantiationEventType: Int8, Hashable {
        case assign = 0x41
        case instantiateBegin = 0x42
        case instantiateEnd = 0x43
        case uninstantiateBegin = 0x44
        case uninstantiateEnd = 0x45
        case recordNamedProperty = 0x46
    }
}

extension CustomEventTrace.InstantiationEventType {
    package enum Kind: Int8, Hashable {
        case graph = 0x0
        case app = 0x1
        case view = 0x2
        case gesture = 0x3
        case widget = 0x4
    }
}

extension CustomEventTrace {
    package enum DynamicPropertyEventType: Int8, Hashable {
        case propertiesUpdated = 0x41
    }
}
