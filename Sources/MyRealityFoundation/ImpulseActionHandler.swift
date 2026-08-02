struct ImpulseActionHandler : ActionHandlerProtocol {
    typealias ActionType = ImpulseAction

    func actionStarted(event: Self.EventType) {
        assertUnimplemented()
    }

    func actionUpdated(event: Self.EventType) {
        assertUnimplemented()
    }

    func actionEnded(event: Self.EventType) {
        assertUnimplemented()
    }

    func actionSkipped(event: Self.EventType) {
        assertUnimplemented()
    }

    func actionPaused(event: Self.EventType) {
        assertUnimplemented()
    }

    func actionResumed(event: Self.EventType) {
        assertUnimplemented()
    }

    func actionTerminated(event: Self.EventType) {
        assertUnimplemented()
    }

    static func register(_ creationHandler: @escaping (Self.EventType) -> (any ActionHandlerProtocol)?) {
        assertUnimplemented()
    }
}
