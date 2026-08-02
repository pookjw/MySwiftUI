private import os.log

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol ActionHandlerProtocol {
    associatedtype ActionType : EntityAction
    
    typealias EventType = ActionEvent<Self.ActionType>
    
    mutating func actionStarted(event: Self.EventType)
    
    mutating func actionUpdated(event: Self.EventType)
    
    mutating func actionEnded(event: Self.EventType)
    
    mutating func actionSkipped(event: Self.EventType)
    
    mutating func actionPaused(event: Self.EventType)
    
    mutating func actionResumed(event: Self.EventType)
    
    mutating func actionTerminated(event: Self.EventType)
    
    static func register(_ creationHandler: @escaping (Self.EventType) -> (any ActionHandlerProtocol)?)
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ActionHandlerProtocol {
    public mutating func actionStarted(event: Self.EventType) {
        assertUnimplemented()
    }
    
    public mutating func actionUpdated(event: Self.EventType) {
        assertUnimplemented()
    }
    
    public mutating func actionEnded(event: Self.EventType) {
        assertUnimplemented()
    }
    
    public mutating func actionSkipped(event: Self.EventType) {
        assertUnimplemented()
    }
    
    public mutating func actionPaused(event: Self.EventType) {
        assertUnimplemented()
    }
    
    public mutating func actionResumed(event: Self.EventType) {
        assertUnimplemented()
    }
    
    public mutating func actionTerminated(event: Self.EventType) {
        assertUnimplemented()
    }
    
    public static func register(_ creationHandler: @escaping (Self.EventType) -> (any ActionHandlerProtocol)?) {
        assertUnimplemented()
    }
    
    static func __register(engine: __Engine?, _: (ActionEvent<Self.ActionType>) -> (any ActionHandlerProtocol)?) {
        assertUnimplemented()
    }
    
    static func __registerCommon(engine: __Engine?, _ block: @escaping (ActionEvent<Self.ActionType>) -> (any ActionHandlerProtocol)?) {
        // <+108>
        self.subscribe(engine)
        
        if unsafe AnimationResource.actionHandlerCreators[ObjectIdentifier(Self.ActionType.self)] != nil {
            // <+232>
            AnimationLogger.logger.log(level: .error, "Handler for \(String(describing: self)) already registered.")
        }
        
        // <+732>
        unsafe AnimationResource.actionHandlerCreators[ObjectIdentifier(Self.ActionType.self)] = { playbackController, eventData, reserved, startTime, duration, engine, instanceID, entity in
            // $s10RealityKit27AnimationPlaybackControllerC0A10Foundation15ActionEventDataVSbS2dAA8__EngineCSVAA6EntityCSgAD0G15HandlerProtocol_pSgIeggyyyygygr_AcFSbS2dAHSVAkMIegnnnnnnnnr_TRTA_1ff954
            guard let action: Self.ActionType = eventData.action() else {
                return nil
            }
            
            let event = unsafe ActionEvent<Self.ActionType>(
                playbackController: playbackController,
                action: action,
                parameter: eventData.parameter(type: Self.ActionType.self),
                targetEntity: entity,
                reversed: reserved,
                startTime: startTime,
                duration: duration,
                engine: engine,
                coreAnimationState: nil,
                deltaTime: nil,
                evaluationTime: nil,
                normalizedTime: nil,
                eventData: eventData,
                instanceID: instanceID
            )
            
            return block(event)
        }
    }
    
    static func subscribe(_ engine: __Engine?) {
//        Self.ActionType.__subscribe(
//            to: <#T##ActionEventType#>,
//            engine,
//            <#T##block: (ActionEvent<EntityAction>) -> Void##(ActionEvent<EntityAction>) -> Void#>
//        )
        assertUnimplemented()
    }
    
    static func actionHandler(_: ActionEvent<Self.ActionType>) -> Self? {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ActionHandlerProtocol where Self.ActionType : Decodable, Self.ActionType : Encodable, Self.ActionType.EventParameterType : Decodable, Self.ActionType.EventParameterType : Encodable {
    public static func register(_ creationHandler: @escaping (Self.EventType) -> (any ActionHandlerProtocol)?) {
        assertUnimplemented()
    }
}

@safe struct ActionEventData {
    private var eventID: Int?
    private var coreData: OpaquePointer
    private var codableTypeInfo: (action: any (EntityAction & Codable).Type, parameter: any Codable.Type)?
    
    func parameter<T : EntityAction>(type: T.Type) -> T.EventParameterType? {
        assertUnimplemented()
    }
    
    func action<T : EntityAction>() -> T? {
        assertUnimplemented()
    }
}
