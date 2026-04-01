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
import _SwiftUICorePrivate

fileprivate struct MyPredicate: ViewInputPredicate {
    static func evaluate(inputs: _GraphInputs) -> Bool {
        return true
    }
}

@main
struct NativePlaygroundApp: App {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    init() {
        printOffsets()
    }
    
    var body: some Scene {
        WindowGroup {
//            Color.black
            ContentView()
//                .task {
//                    try! await Task.sleep(for: .seconds(1))
//                    if let requestWithID = UISceneSessionActivationRequest(
//                        hostingDelegateClass: HostingSceneDelegate.self,
////                        id: "swiftui-window"
//                        value: Int(8)
//                    ) {
//                        UIApplication.shared.activateSceneSession(for: requestWithID)
//                    }
//                }
//                .task {
//                    await openImmersiveSpace(id: "immersive")
//                }
        }
//        .defaultSize(CGSize(width: 300, height: 300))
//        .defaultSize(width: 300, height: 300, depth: 400)
        
//        ImmersiveSpace(id: "immersive") { 
//            ContentView()
//        }
    }
}

fileprivate struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
//        navigationController.viewControllers = [PushViewController(), ViewController()]
        navigationController.viewControllers = [PushViewController(), OpenURLActionViewController()]
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
        .windowStyle(.volumetric)
        
        WindowGroup(id: "swiftui-window") {
            ContentView()
        }
    }
}

#endif
