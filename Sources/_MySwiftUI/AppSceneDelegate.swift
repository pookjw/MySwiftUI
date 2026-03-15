internal import UIKit
private import MySwiftUICore
private import os.log

/*
 window (Swift.Optional<__C.UIWindow>) (0x10)
 sceneItemID (Swift.Optional<SwiftUI.SceneID>) (0x18)
 sceneNamespace (SwiftUI.SceneList.Namespace) (0x30)
 lastVersion (SwiftUI.DisplayList.Version) (0x48)
 sceneBridge (Swift.Optional<SwiftUI.SceneBridge>) (0x50)
 remoteSceneBridge (Swift.Optional<SwiftUI.RemoteScenes.Bridge>) (0x58)
 scenePhase (SwiftUI.ScenePhase) (0x60)
 sceneDelegateBox (Swift.Optional<SwiftUI.AnyFallbackDelegateBox>) (0x68)
 sceneStorageValues (Swift.Optional<SwiftUI.SceneStorageValues>) (0x70)
 presentationDataType (Swift.Optional<Any.Type>) (0x78)
 rawPresentationDataValue (Swift.Optional<Foundation.Data>) (0x80)
 presentationDataValue (Swift.Optional<Swift.AnyHashable>) (0x90)
 connectionOptions (Swift.Optional<__C.UISceneConnectionOptions>) (0xb8)
 */

final class AppSceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow? = nil
    private var sceneItemID: SceneID? = nil
    private var sceneNamespace: SceneList.Namespace = .app
    private var lastVersion = DisplayList.Version()
    private var sceneBridge: SceneBridge? = nil
    private var remoteSceneBridge: RemoteScenes.Bridge? = nil
    private var scenePhase: ScenePhase = .background
    private var sceneDelegateBox: AnyFallbackDelegateBox? = nil
    private var sceneStorageValues: SceneStorageValues? = nil
    private var presentationDataType: Any.Type? = nil
    private var rawPresentationDataValue: Data? = nil
    private var presentationDataValue: AnyHashable? = nil
    private var connectionOptions: UIScene.ConnectionOptions? = nil
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        assertUnimplemented()
    }
    
    override init() {
        super.init()
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        if let sceneDelegateBox, let delegate = sceneDelegateBox.delegate as? UISceneDelegate {
            return delegate.responds(to: aSelector)
        } else {
            return type(of: self).instancesRespond(to: aSelector)
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        assertUnimplemented()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        assertUnimplemented()
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        /*
         self -> x20 -> x22
         scene -> x0 -> x19 + 0x138
         session -> x1 -> x26
         connectionOptions -> x2 -> x19 + 0x118
         */
        // <+928>
        Update.ensure {
            // <+932>
            if let log = Log.scenes {
                log.info("Received scene connection to session: \(session, privacy: .public)")
            }
            
            // <+1308>
            guard
                window == nil,
                let windowScene = scene as? UIWindowScene // x19 + 0x50
            else {
                return
            }
            
            // <+1356>
            assertUnimplemented()
        }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        assertUnimplemented()
    }
}

final class SceneStorageValues {
    // TODO
}
