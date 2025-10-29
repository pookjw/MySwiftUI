// E36588D6F4797F7C6EF26CC7E1C2D1CE

@globalActor public actor _ImpossibleActor {
    public static let shared = _ImpossibleActor()
    
    public nonisolated var unownedExecutor: UnownedSerialExecutor {
        return _ImpossibleExecutor.shared.asUnownedSerialExecutor()
    }
}

@_marker @_ImpossibleActor public protocol _RemoveGlobalActorIsolation {}

fileprivate final class _ImpossibleExecutor: SerialExecutor {
    static let shared = _ImpossibleExecutor()
    
    func enqueue(_ job: consuming ExecutorJob) {
        fatalError("_RemoveGlobalActorIsolation is not intended to be used as a stand-alone protocol with a global actor isolation.")
    }
}
