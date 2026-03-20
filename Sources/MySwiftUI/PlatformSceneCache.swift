// 5217AFC12DE59AF2278D800FE2D58ED1
internal import MySwiftUICore
internal import UIKit

final class PlatformSceneCache {
    @safe static nonisolated(unsafe) let shared = PlatformSceneCache()
    
    private var infoMap: [SceneID: PlatformSceneCache.Info] = [:]
    
    private init() {}
    
    func addHost(_ host: UIViewController, id: SceneID) {
        let box = HashableWeakBox(host)
        
        if
            let info = self.infoMap[id],
            info.scenes[box] != nil
        {
            return
        }
        
        // <+308>
        var info: PlatformSceneCache.Info
        if let _info = self.infoMap[id] {
            info = _info
            info.scenes[box] = .active
            // <+656>
        } else {
            // <+420>
            info = PlatformSceneCache.Info(scenes: [box: .active])
        }
        
        // <+656>
        self.infoMap[id] = info
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
        fileprivate var scenes: [HashableWeakBox<UIViewController>: ScenePhase]
    }
}
