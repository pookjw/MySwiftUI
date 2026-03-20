// FB4D19B065EC4D2CC549DBA6E2D239A5
internal import Foundation
private import MySwiftUICore
private import UIKit

struct SceneNavigationStrategy_Phone {
    // $s7SwiftUI29SceneNavigationStrategy_PhoneV6shared_WZ
    static nonisolated(unsafe) var shared = SceneNavigationStrategy_Phone(sceneNavigationEnabled: false, sceneRequestCache: SceneRequestCache())
    
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
    private var sceneActivationRequestCache: Set<SceneRequestCache.Item> = []
    
    func requestInCacheAddIfNotPresent<T: Codable & Hashable>(id: SceneID, value: T) -> Bool {
        assertUnimplemented()
    }
}

extension SceneRequestCache {
    struct Item: Hashable {
        let id: String
        let value: AnyHashable
    }
}
