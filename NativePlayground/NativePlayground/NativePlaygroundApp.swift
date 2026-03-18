//
//  NativePlaygroundApp.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 3/11/26.
//

#if USE_SWIFTUI_APP

import SwiftUI
import UIKit
import Combine

@main
struct NativePlaygroundApp: App {
    init() {
        printOffsets()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try! await Task.sleep(for: .seconds(1))
                    if let requestWithID = UISceneSessionActivationRequest(
                        hostingDelegateClass: HostingSceneDelegate.self,
//                        id: "swiftui-window"
                        value: Int(8)
                    ) {
                        UIApplication.shared.activateSceneSession(for: requestWithID)
                    }
                }
        }
    }
}

fileprivate struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.viewControllers = [PushViewController(), ViewController()]
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}

class HostingSceneDelegate: NSObject, UIHostingSceneDelegate, ObservableObject {
    static var rootScene: some Scene {
        WindowGroup(for: Int.self) { _ in
            ContentView()
        }
//        .windowStyle(.volumetric)
        
        WindowGroup(id: "swiftui-window") {
            ContentView()
        }
    }
}

#endif
