// FB4D19B065EC4D2CC549DBA6E2D239A5
internal import Foundation
private import MySwiftUICore
internal import UIKit

struct SceneNavigationStrategy_Phone {
    // $s7SwiftUI29SceneNavigationStrategy_PhoneV6shared_WZ
    nonisolated(unsafe) static var shared = SceneNavigationStrategy_Phone(sceneNavigationEnabled: false, sceneRequestCache: SceneRequestCache())
    
    var sceneNavigationEnabled: Bool
    private var sceneRequestCache: SceneRequestCache
    
    fileprivate func withSceneList<T>(namespace: SceneList.Namespace, do: (SceneList) -> T?) -> T? {
        assertUnimplemented()
    }
    
    fileprivate func performSceneActivation(
        item: SceneList.Item,
        activity: NSUserActivity,
        matchingSession: UISceneSession?,
        activationBehavior: SceneActivationBehavior,
        errorHandler: ((SceneNavigationStrategy_Phone.Error) -> Void)?
    ) {
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
    
    func openWindow(namespace: SceneList.Namespace, id: String, withBehavior: SceneActivationBehavior) {
        assertUnimplemented()
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
        assertUnimplemented()
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
