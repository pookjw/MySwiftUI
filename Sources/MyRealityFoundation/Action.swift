@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol EntityAction {
    associatedtype EventParameterType = Never
    var isReversible: Bool { get }
    var isAdditive: Bool { get }
    var animatedValueType: (any AnimatableData.Type)? { get }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EntityAction {
    public var isReversible: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var isAdditive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public static func registerAction() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func subscribe(to eventType: ActionEventType, _ handler: @escaping @MainActor (ActionEvent<Self>) -> Void) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func unsubscribe(from eventType: ActionEventType) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func unsubscribeAll() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __register() {
        let typeName = _typeName(self, qualified: true)
        
        if let existing = unsafe AnimationResource.actionTypeMap[typeName] {
            if existing != self {
                preconditionFailure("Action type name \(typeName) already registered for type \(String(describing: existing))")
            }
            
            return
        }
        
        unsafe AnimationResource.actionTypeMap[typeName] = self
    }
    
    @preconcurrency @MainActor static func __subscribe(
        to event: ActionEventType,
        _ engine: __Engine?,
        _ block: (ActionEvent<Self>) -> Void
    ) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __unsubscribe(
        from event: ActionEventType,
        _ engine: __Engine?
    ) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EntityAction where Self : Decodable, Self : Encodable, Self.EventParameterType : Decodable, Self.EventParameterType : Encodable {
    public static func registerAction() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func subscribe(to eventType: ActionEventType, _ handler: @escaping @MainActor (ActionEvent<Self>) -> Void) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __registerCodable() {
        let typeName = _typeName(self, qualified: true)
        
        if let existing = unsafe AnimationResource.codableActionTypeMap[typeName] {
            if existing.parameter != self {
                preconditionFailure("Action type name \(typeName) already registered for type \(String(describing: existing))")
            }
            
            return
        }
        
        // <+200>
        unsafe AnimationResource.codableActionTypeMap[typeName] = (action: self, parameter: EventParameterType.self)
    }
}
