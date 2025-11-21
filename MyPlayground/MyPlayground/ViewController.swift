//
//  ViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import MySwiftUI

class ViewController: UIViewController {
    override func loadView() {
        let rootView = AnyView(Color.white)
//        let rootView = AnyView(EmptyView())
        let hostingView = _UIHostingView(rootView: rootView)
        self.view = hostingView
        
        Task {
            try! await Task.sleep(for: .seconds(1))
            hostingView.rootView = AnyView(EmptyView())
//            hostingView.rootView = AnyView(Color.black)
        }
        
//        Task {
//            var flag = true
//            while true {
//                try! await Task.sleep(for: .seconds(1))
//                
//                if flag {
////                    hostingView.rootView = AnyView(Color.black)
//                    hostingView.rootView = AnyView(EmptyView())
//                } else {
//                    hostingView.rootView = AnyView(Color.white)
////                    hostingView.rootView = AnyView(EmptyView())
//                }
//                
//                flag.toggle()
//            }
//        }
    }
}



/*
 Task {
     var count = 0
     while true {
         try! await Task.sleep(for: .seconds(1))
         
         if count % 3 == 0 {
             hostingView.rootView = AnyView(Color.black)
         } else if count % 3 == 1 {
             hostingView.rootView = AnyView(Color.white)
         } else if count % 3 == 2 {
             hostingView.rootView = AnyView(EmptyView())
         }
         
         count &+= 1
     }
 }
 */
