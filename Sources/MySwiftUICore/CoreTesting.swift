private import _DarwinFoundation3._stdlib

package enum CoreTesting {
    @safe nonisolated(unsafe) package static var isRunning: Bool = {
        guard let value = unsafe getenv("XCODE_RUNNING_FOR_PREVIEWS") else {
            return false
        }
        
        return unsafe atoi(value) != 0
    }()
    
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
        // nop
    }
    
    package static func popNeedsRunLoopTur() {
        // nop
    }
}
