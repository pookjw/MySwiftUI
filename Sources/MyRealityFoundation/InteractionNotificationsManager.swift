final class InteractionNotificationsManager {
    @safe static nonisolated(unsafe) let sharedManager = InteractionNotificationsManager()
    
    @inline(__always) // 원래 없음
    private init() {
        assertUnimplemented()
    }
    
    deinit {
        assertUnimplemented()
    }
}
