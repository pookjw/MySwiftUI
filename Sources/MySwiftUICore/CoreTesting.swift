package enum CoreTesting {
    @safe nonisolated(unsafe) package static var isRunning: Bool = false
    
    package static var needsRender: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package static var needsRunLoopTurn: Bool {
        assertUnimplemented()
    }
    
    package static func pushNeedsRunLoopTurn() {
        // noop
    }
    
    package static func popNeedsRunLoopTurn() {
        // noop
    }
}
