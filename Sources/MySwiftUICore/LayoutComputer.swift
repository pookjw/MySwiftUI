#warning("TODO")
private import AttributeGraph

struct LayoutComputer {
    @inline(never)
    static nonisolated(unsafe) let defaultValue = LayoutComputer(LayoutComputer.DefaultEngine())
    @inline(never)
    static nonisolated(unsafe) let defaultValue3D = LayoutComputer(LayoutComputer.DefaultEngine3D())
    
    private var box: AnyLayoutEngineBox
    private var seed: Int
    
    init<T: LayoutEngine>(_ engine: T) {
        if unsafe LayoutTrace.recorder != nil {
            self.box = TracingLayoutEngineBox(engine: engine)
        } else {
            self.box = LayoutEngineBox(engine: engine)
        }
        
        self.seed = 0
    }
}

protocol LayoutEngine {
    // TODO
}

extension LayoutComputer {
    struct DefaultEngine: LayoutEngine {}
    struct DefaultEngine3D: LayoutEngine {}
}

fileprivate class AnyLayoutEngineBox {}

fileprivate class LayoutEngineBox<T>: AnyLayoutEngineBox {
    var engine: T
    
    init(engine: T) {
        self.engine = engine
    }
}

fileprivate class TracingLayoutEngineBox<T>: LayoutEngineBox<T> {
    var attribute: AnyAttribute?
    
    override init(engine: T) {
        fatalError("TODO")
    }
}
