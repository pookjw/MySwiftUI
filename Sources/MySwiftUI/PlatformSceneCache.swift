// 5217AFC12DE59AF2278D800FE2D58ED1
internal import MySwiftUICore
internal import UIKit

final class PlatformSceneCache {
    @safe static nonisolated(unsafe) let shared = PlatformSceneCache()
    
    private var infoMap: [SceneID: PlatformSceneCache.Info] = [:]
    
    private init() {}
    
    func addHost(_ host: UIViewController, id: SceneID) {
        assertUnimplemented()
    }
    
    func removeHost(_ host: UIViewController, id: SceneID) {
        assertUnimplemented()
    }
    
    func setPhase(_ scnePhase: ScenePhase, id: SceneID, host: UIViewController) {
        assertUnimplemented()
    }
}

extension PlatformSceneCache {
    struct Info {
        private var scenes: [HashableWeakBox<UIViewController>: ScenePhase]
    }
}
