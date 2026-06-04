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
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ActionHandlerProtocol where Self.ActionType : Decodable, Self.ActionType : Encodable, Self.ActionType.EventParameterType : Decodable, Self.ActionType.EventParameterType : Encodable {
    public static func register(_ creationHandler: @escaping (Self.EventType) -> (any ActionHandlerProtocol)?) {
        assertUnimplemented()
    }
}
