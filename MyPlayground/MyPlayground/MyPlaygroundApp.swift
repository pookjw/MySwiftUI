//
//  MyPlaygroundApp.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 3/11/26.
//

#if USE_MYSWIFTUI_APP

import MySwiftUI
import UIKit

@main
struct MyPlaygroundApp: App {
    var body: some Scene {
        WindowGroup { 
            ContentView()
//            Color.black
        }
    }
}

fileprivate struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootViewController = DemoViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}

#endif
