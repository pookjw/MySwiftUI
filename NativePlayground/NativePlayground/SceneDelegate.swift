//
//  SceneDelegate.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

#if !USE_SWIFTUI_APP

import UIKit

final class SceneDelegate : UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let windowScene = scene as! UIWindowScene
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
//        navigationController.viewControllers = [PushViewController(), ViewController()]
        navigationController.viewControllers = [OpenURLActionViewController()]
        
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

#endif
