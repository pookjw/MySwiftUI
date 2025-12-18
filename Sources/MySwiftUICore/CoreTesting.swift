private import _DarwinFoundation3._stdlib

package enum CoreTesting {
    @safe package static nonisolated(unsafe) var isRunning: Bool = {
        guard let value = unsafe getenv("XCODE_RUNNING_FOR_PREVIEWS") else {
            return false
        }
        
        return unsafe atoi(value) != 0
    }()
    
    package static var needsRender: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    package static var needsRunLoopTurn: Bool {
        fatalError("TODO")
    }
    
    package static func pushNeedsRunLoopTurn() {
        // nop
    }
    
    package static func popNeedsRunLoopTur() {
        // nop
    }
}
