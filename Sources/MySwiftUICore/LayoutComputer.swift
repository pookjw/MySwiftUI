#warning("TODO")

struct LayoutComputer {
    @inline(never)
    static nonisolated(unsafe) let defaultValue = LayoutComputer(DefaultEngine())
    
    @inline(never)
    static var defaultValue3D: LayoutComputer {
        fatalError("TODO")
    }
    
    private var box: AnyLayoutEngineBox
    private var seed: Int
    
    init<T: LayoutEngine>(_ engine: T) {
        // TODO: LayoutTrace Recorder
        self.box = LayoutEngineBox(engine: engine)
        self.seed = 0
    }
}

protocol LayoutEngine {}
struct DefaultEngine: LayoutEngine {}
struct DefaultEngine3D: LayoutEngine {}

fileprivate class AnyLayoutEngineBox {}

fileprivate class LayoutEngineBox<T>: AnyLayoutEngineBox {
    var engine: T
    
    init(engine: T) {
        self.engine = engine
    }
}

fileprivate class TracingLayoutEngineBox<T>: LayoutEngineBox<T> {}
