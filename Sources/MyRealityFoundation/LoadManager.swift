private import Dispatch
private import os.log
private import Combine
private import CoreRE

final class LoadManager {
    private let queue: DispatchQueue
    private let loadTracer: LoadTracer
    private let sceneResourceCache: __SceneResourceCache
    
    init() {
        assertUnimplemented()
    }
}

final class LoadTracer {
    private var currentId: UInt32
    private var loadTraces: [UInt32 : LoadTrace]
    private let logger: Logger
    private let logPrefix: String
    private let unknownLoadTypeMsg: String
    
    init() {
        assertUnimplemented()
    }
}

struct LoadTrace {
    private var id: UInt32
    private var loadType: CoreRE::LoadTraceType
    private var cancellable: AnyCancellable?
    private var cacheUsed: Bool
    private var logMsgTarget: String
    private var startTime: DispatchTime
}
