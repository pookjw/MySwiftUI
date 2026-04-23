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

@main
struct NativePlaygroundApp : App {
    @State private var count = 0
    
    init() {
        printOffsets()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

fileprivate struct ContentView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
//        navigationController.viewControllers = [PushViewController(), ViewController()]
        navigationController.viewControllers = [PushViewController(), FrameLayoutViewController()]
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}

class HostingSceneDelegate : NSObject, UIHostingSceneDelegate, ObservableObject {
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
