struct OrbitEntityActionHandler : ActionHandlerProtocol {
    typealias ActionType = OrbitEntityAction

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

    func computeOrbitTransform(event: Self.EventType, normalizedTime: Double, isAdditive: Bool) -> Transform {
        assertUnimplemented()
    }

    static func register(_ creationHandler: @escaping (Self.EventType) -> (any ActionHandlerProtocol)?) {
        assertUnimplemented()
    }
}
