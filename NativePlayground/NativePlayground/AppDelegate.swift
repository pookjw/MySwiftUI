//
//  AppDelegate.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import SwiftUI

//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            EmptyView()
//        }
//    }
//}

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = connectingSceneSession.configuration.copy() as! UISceneConfiguration
        configuration.delegateClass = SceneDelegate.self
        return configuration
    }
}
