struct PlayAnimationActionHandler : ActionHandlerProtocol {
    private var controller: AnimationPlaybackController?
    
    typealias ActionType = PlayAnimationAction
    
    mutating func actionStarted(event: Self.EventType) {
        assertUnimplemented()
    }
    
    mutating func actionUpdated(event: Self.EventType) {
        assertUnimplemented()
    }
    
    mutating func actionEnded(event: Self.EventType) {
        assertUnimplemented()
    }
    
    mutating func actionSkipped(event: Self.EventType) {
        assertUnimplemented()
    }
    
    mutating func actionPaused(event: Self.EventType) {
        assertUnimplemented()
    }
    
    mutating func actionResumed(event: Self.EventType) {
        assertUnimplemented()
    }
    
    mutating func actionTerminated(event: Self.EventType) {
        assertUnimplemented()
    }
    
    static func register(_ creationHandler: @escaping (Self.EventType) -> (any ActionHandlerProtocol)?) {
        assertUnimplemented()
    }
}
