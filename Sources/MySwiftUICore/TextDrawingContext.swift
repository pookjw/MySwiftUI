internal import UIKit

final class TextDrawingContext {
    @safe static nonisolated(unsafe) let shared: TextDrawingContext = {
        assertUnimplemented()
    }()
    
    @AtomicBox private var ctx: NSStringDrawingContext
    
    private init() {
        assertUnimplemented()
    }
}
