//
//  SceneDelegate.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import _SwiftPrivate
import _SwiftUICorePrivate

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        print(_typeName(ResponderNode.self, qualified: true))
        _forEachField(of: ResponderNode.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(ViewResponder.self, qualified: true))
        _forEachField(of: ViewResponder.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(MultiViewResponder.self, qualified: true))
        _forEachField(of: MultiViewResponder.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        //        
        print("===")
        
        print(_typeName(_typeByName("7SwiftUI15UIViewResponderC")!, qualified: true))
        _forEachField(of: _typeByName("7SwiftUI15UIViewResponderC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
        
        let windowScene = scene as! UIWindowScene
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
//        navigationController.viewControllers = [PushViewController(), ViewController()]
        navigationController.viewControllers = [PushViewController(), SwitchRepViewController()]
        
        window.rootViewController = navigationController
        
//        window.rootViewController = ViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
