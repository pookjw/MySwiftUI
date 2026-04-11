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
struct MyPlaygroundApp : App {
    @State private var count = 0
    
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
        
        WindowGroup(id: "BindableView") { 
            BindableView()
        }
        
        WindowGroup(id: "WindowCounter") { 
            WindowCounterView(count: $count)
        }
    }
}

fileprivate struct ContentView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootViewController = DemoViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}

#endif
