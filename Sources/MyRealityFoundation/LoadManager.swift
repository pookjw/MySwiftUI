private import Dispatch
private import os.log
private import Combine
private import CoreRE

final class LoadManager {
    private let queue: DispatchQueue
    private let loadTracer: LoadTracer
    private let sceneResourceCache: __SceneResourceCache
    
    init() {
        self.queue = DispatchQueue(label: "com.apple.RealityKit.load-queue")
        self.loadTracer = LoadTracer()
        self.sceneResourceCache = __SceneResourceCache()
    }
}

final class LoadTracer {
    private var currentId: UInt32 = 1 // 0x10
    private var loadTraces: [UInt32 : LoadTrace] = [:] // 0x18
    private let logger = Logger(subsystem: "com.apple.re", category: "Assets") // 0x20
    private let logPrefix: String = "" // 0x28
    private let unknownLoadTypeMsg: String = "(with unknown load type)" // 0x30
}

struct LoadTrace {
    private var id: UInt32
    private var loadType: CoreRE::LoadTraceType
    private var cancellable: AnyCancellable?
    private var cacheUsed: Bool
    private var logMsgTarget: String
    private var startTime: DispatchTime
}
