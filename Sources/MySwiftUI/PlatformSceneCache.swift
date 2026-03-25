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
        /*
         self -> x20 -> x19
         scnePhase -> x0
         id -> x1/x2/x3 -> x23/x22/x21
         host -> x4 -> x28
         */
        guard var info = infoMap[id] else {
            return
        }
        
        info.scenes[HashableWeakBox(host)] = scnePhase
        infoMap[id] = info
        
        guard let graph = AppGraph.shared else {
            return
        }
        
        Update.ensure { 
            // $s7SwiftUI18PlatformSceneCacheC8setPhase_2id4hostyAA0dG0O_AA0D2IDOSo16UIViewControllerCtFyyXEfU_TA
            /*
             graph -> x0 -> x20
             self -> x1 -> x23
             */
            // <+172>
            let sceneList = graph.sceneList(namespace: .app)
            
            // x26
            var phases: [ScenePhase] = []
            for item in sceneList.items {
                guard let info = self.infoMap[item.id] else {
                    continue
                }
                
                // w25
                let phase: ScenePhase
                if isLinkedOnOrAfter(.v6) {
                    phase = info.scenes.values.max() ?? .background
                } else {
                    phase = info.scenes.values.min() ?? .background
                }
                
                phases.append(phase)
            }
            
            // <+580>
            // w19
            let phase: ScenePhase
            if isLinkedOnOrAfter(.v6) {
                phase = phases.max() ?? .background
            } else {
                phase = phases.min() ?? .background
            }
            
            let changed = graph.$rootScenePhase.setValue(phase)
            if changed {
                graph.graphDidChange()
            }
        }
    }
}

extension PlatformSceneCache {
    struct Info {
        fileprivate var scenes: [HashableWeakBox<UIViewController>: ScenePhase]
    }
}
