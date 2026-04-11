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
        
        WindowGroup(id: "1") { 
            Color.black
        }
        
        WindowGroup(id: "2") { 
            Color.white
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "3") { 
            Color.white
        }
        .immersionStyle(selection: .constant(.progressive), in: .progressive)
        
        ImmersiveSpace(id: "4") { 
            Color.white
        }
        
        WindowGroup(id: "WindowCounter") { 
            WindowCounterView(count: $count)
        }
    }
}

fileprivate struct ContentView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
//        navigationController.viewControllers = [PushViewController(), ViewController()]
        navigationController.viewControllers = [PushViewController(), WindowCounterViewController()]
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
