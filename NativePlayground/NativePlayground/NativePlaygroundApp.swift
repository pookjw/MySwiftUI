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

fileprivate struct MyPredicate : ViewInputPredicate {
    static func evaluate(inputs: _GraphInputs) -> Bool {
        return true
    }
}

@main
struct NativePlaygroundApp : App {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
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
//        .immersionStyle(selection: .constant(ProgressiveImmersionStyle()), in: .progressive, .full)
//        .immersionStyle(selection: .constant(.full), in: .full)
    }
}

fileprivate struct ContentView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
//        navigationController.viewControllers = [PushViewController(), ViewController()]
        navigationController.viewControllers = [PushViewController(), OpenImmsersiveWindowViewController()]
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
