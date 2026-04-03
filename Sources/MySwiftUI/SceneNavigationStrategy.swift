// FB4D19B065EC4D2CC549DBA6E2D239A5
internal import Foundation
private import MySwiftUICore
internal import UIKit
private import os.log

struct SceneNavigationStrategy_Phone {
    // $s7SwiftUI29SceneNavigationStrategy_PhoneV6shared_WZ
    nonisolated(unsafe) static var shared = SceneNavigationStrategy_Phone(sceneNavigationEnabled: false, sceneRequestCache: SceneRequestCache())
    
    var sceneNavigationEnabled: Bool
    private var sceneRequestCache: SceneRequestCache
    
    fileprivate func withSceneList<T>(namespace: SceneList.Namespace, do: (SceneList) -> T?) -> T? {
        guard let appGraph = AppGraph.shared else {
            return nil
        }
        
        let sceneList = appGraph.sceneList(namespace: namespace)
        return `do`(sceneList)
    }
    
    fileprivate func performSceneActivation(
        item: SceneList.Item,
        activity: NSUserActivity,
        matchingSession: UISceneSession?,
        activationBehavior: SceneActivationBehavior,
        errorHandler: ((SceneNavigationStrategy_Phone.Error) -> Void)?
    ) {
        /*
         item -> x0 -> x21
         activity -> x1 -> x19 + 0xa0
         matchingSession -> x2 -> x25
         activationBehavior -> x3 -> x19 + 0x70
         errorHandler -> x4/x5 -> x19 + 0xb8 / x19 + 0xc0
         */
        // <+764>
        if let scenes = Log.scenes {
            scenes.log(level: .info, "Performing scene activation for item \(item.sceneTypeDescription, privacy: .public): \(item.identifyingDescription, privacy: .public)")
        }
        
        // <+1280>
//        item.windowLayoutProvider ?? item.defaultPlacementProvider.
        assertUnimplemented()
    }
    
    func sceneListItem<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        presenting: T.Type,
        where: (SceneList.Item) -> Bool
    ) -> SceneList.Item? {
        assertUnimplemented()
    }
    
    func sceneListItem<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        id: String,
        presenting: T.Type,
        where: (SceneList.Item) -> Bool
    ) -> SceneList.Item? {
        assertUnimplemented()
    }
    
    func openWindow<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        presenting: T,
        withBehavior: SceneActivationBehavior
    ) {
        assertUnimplemented()
    }
    
    @MainActor func openWindow(namespace: SceneList.Namespace, id: String, withBehavior: SceneActivationBehavior) {
        /*
         namespace -> x0/x1/x2 -> x22/x23/x24
         id -> x3/x4 -> x21/x25
         */
        // <+304>
        guard UIApplication.shared.supportsMultipleScenes else {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Unable to open a window when the app does not support multiple scenes")
            return
        }
        
        let sceneList = self.withSceneList(namespace: namespace) { sceneList in
            // $s7SwiftUI29SceneNavigationStrategy_PhoneV04withC4List33_FB4D19B065EC4D2CC549DBA6E2D239A5LL9namespace2doxSgAA0cH0V9NamespaceO_AhJXEtlFAJyXEfU_TA.40
            return sceneList
        }
        
        guard let sceneList else {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "No Scene with id '%s' is defined", id)
            return
        }
        
        // <+452>
        var targetItem: SceneList.Item?
        itemsLoop: for item in sceneList.items {
            // <+528>
            guard id == item.id.sessionID else {
                continue
            }
            
            // <+800>
            switch item.value {
            case .windowGroup(_):
                targetItem = item
                break itemsLoop
            case .immersiveSpace(_):
                assertUnimplemented()
            case .volume(_):
                assertUnimplemented()
            case .documentGroup(_):
                assertUnimplemented()
            case .settings(_):
                assertUnimplemented()
            case .menuBarExtra(_):
                assertUnimplemented()
            case .customScene(_):
                assertUnimplemented()
            case .singleWindow(_):
                assertUnimplemented()
            case .documentIntroduction(_):
                assertUnimplemented()
            case .alertDialog(_):
                assertUnimplemented()
            }
        }
        
        // <+1324>
        // targetItem -> x20
        guard let targetItem else {
            // <+1660>
            unsafe os_log(.fault, log: .runtimeIssuesLog, "No Scene with id '%s' is defined", id)
            return
        }
        
        // <+1368>
        // x23 (x19 + 0x30)
        let copy_1 = targetItem
        // x19 + 0xa0
        let copy_2 = copy_1.value
        
        switch copy_2 {
        case .windowGroup(_), .volume(_), .singleWindow(_):
            // <+1428>
            break
        case .immersiveSpace(_), .documentGroup(_), .settings(_), .menuBarExtra(_), .customScene(_), .documentIntroduction(_), .alertDialog(_):
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Unable to present a window for Scene id '%s'", id)
            return
        }
        
        // <+1428>
        // x19 + 0xa0
        let copy_3 = copy_1.value
        if case .singleWindow(_) = copy_3 {
            // <+1464>
            for session in UIApplication.shared.openSessions {
                if
                    let userInfo = session.userInfo,
                    let sessionID = userInfo["com.apple.SwiftUI.sceneID"] as? String,
                    sessionID == id
                {
                    // <+2768>
                    let userActivity = self.userActivityForOpeningWindow(id: copy_1.id)
                    self.performSceneActivation(item: copy_1, activity: userActivity, matchingSession: session, activationBehavior: .push(sceneSessionToBeReplaced: session), errorHandler: nil)
                    return
                }
            }
            
            // <+2556>
            // <+2600>
        } else {
            // <+2600>
        }
        
        // <+2600>
        let userActivity = self.userActivityForOpeningWindow(id: copy_1.id)
        self.performSceneActivation(item: copy_1, activity: userActivity, matchingSession: nil, activationBehavior: .default, errorHandler: nil)
    }
    
    func openWindow<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        id: String,
        presenting: T,
        withBehavior: SceneActivationBehavior
    ) {
        assertUnimplemented()
    }
    
    func openImmersiveSpace(
        namespace: SceneList.Namespace,
        id: String,
        remoteSessionInfo: RemoteScenes.SessionInfo?,
        initialData: Data?
    ) async -> SceneNavigationStrategy_Phone.Result {
        assertUnimplemented()
    }
    
    func openImmersiveSpace<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        presenting: T
    ) async -> SceneNavigationStrategy_Phone.Result {
        assertUnimplemented()
    }
    
    func openImmersiveSpace<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        id: String,
        presenting: T
    ) async -> SceneNavigationStrategy_Phone.Result {
        assertUnimplemented()
    }
    
    fileprivate func handleSceneActivation<T : Codable & Hashable>(
        item: SceneList.Item,
        value: T,
        activationBehavior: SceneActivationBehavior,
        errorHandler: ((SceneNavigationStrategy_Phone.Error) -> Void)?
    ) {
        assertUnimplemented()
    }
    
    fileprivate func applyActivationBehavior(
        _ activationBehavior: SceneActivationBehavior,
        for item: SceneList.Item,
        to options: UIWindowScene.ActivationRequestOptions
    ) {
        assertUnimplemented()
    }
    
    fileprivate func makeWindowLayout(item: SceneList.Item) -> AnyWindowLayout? {
        assertUnimplemented()
    }
    
    fileprivate func userActivityForOpeningWindow(id: SceneID) -> NSUserActivity {
        // x19
        let activity = NSUserActivity(activityType: NSUserActivity.userActivityTypeOpenWindowByID)
        activity.userInfo = ["com.apple.SwiftUI.sceneID" : id.sessionID]
        activity.requiredUserInfoKeys = ["com.apple.SwiftUI.sceneID"]
        activity.isEligibleForHandoff = false
        return activity
    }
    
    fileprivate func userActivityForOpeningWindow<T : Codable & Hashable>(id: SceneID, value: T) -> NSUserActivity? {
        assertUnimplemented()
    }
    
    fileprivate func existingSession<T : Codable & Hashable>(id: SceneID, value: T) -> UISceneSession? {
        assertUnimplemented()
    }
    
    fileprivate func existingSessions(with id: SceneID) -> [UISceneSession] {
        assertUnimplemented()
    }
    
    fileprivate func handleSceneDestruction(id: SceneID) {
        assertUnimplemented()
    }
    
    fileprivate func handleSceneDestruction<T : Codable & Hashable>(id: SceneID, value: T) {
        assertUnimplemented()
    }
    
    func dismissWindow<T : Codable & Hashable>(namespace: SceneList.Namespace, value: T) {
        assertUnimplemented()
    }
    
    func dismissWindow<T : Codable & Hashable>(namespace: SceneList.Namespace, id: String, value: T) {
        assertUnimplemented()
    }
    
    fileprivate func dismissWindow(namespace: SceneList.Namespace, id: String) {
        assertUnimplemented()
    }
    
    func transitionImmersiveSpace(sceneIDs: [SceneID]) {
        assertUnimplemented()
    }
    
    func dismissImmersiveSpace() async {
        assertUnimplemented()
    }
    
    fileprivate func sceneSessionActivationRequest(
        for session: UISceneSession?,
        sceneConfiguration: UISceneConfiguration,
        userActivity: NSUserActivity?,
        options: UIScene.ActivationRequestOptions?
    ) -> UISceneSessionActivationRequest {
        assertUnimplemented()
    }
    
    @inline(always) // 원래 없음
    mutating func removeCache(id: String, value: AnyHashable) {
        let item = SceneRequestCache.Item(id: id, value: value)
        self.sceneRequestCache.sceneActivationRequestCache.remove(item)
    }
}

extension SceneNavigationStrategy_Phone {
    enum Result {
        case failure(SceneNavigationStrategy_Phone.Error)
        case opened
    }
    
    enum Error {
        case system(NSError)
        case userActivityEncoding
        case invalidRequest
    }
}

fileprivate final class SceneRequestCache {
    var sceneActivationRequestCache: Set<SceneRequestCache.Item> = []
    
    func requestInCacheAddIfNotPresent<T : Codable & Hashable>(id: SceneID, value: T) -> Bool {
        assertUnimplemented()
    }
}

extension SceneRequestCache {
    struct Item : Hashable {
        let id: String
        let value: AnyHashable
    }
}

enum SceneActivationBehavior {
    case push(sceneSessionToBeReplaced: UISceneSession?)
    case `default`
}

extension NSUserActivity {
    static let userActivityTypeOpenWindowByID = "\(Bundle.main.bundleIdentifier ?? "com.apple.SwiftUI").openWindowByID"
}
