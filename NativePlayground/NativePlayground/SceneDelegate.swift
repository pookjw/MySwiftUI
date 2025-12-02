//
//  SceneDelegate.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let windowScene = scene as! UIWindowScene
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [PushViewController(), ViewController()]
        
        window.rootViewController = navigationController
        
//        window.rootViewController = ViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
