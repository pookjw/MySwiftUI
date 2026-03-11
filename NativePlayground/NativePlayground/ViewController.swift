//
//  ViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import SwiftUI
import _SwiftPrivate
import _SwiftUIPrivate
import _UIKitPrivate
import ObjectiveC.runtime
import ObjectiveC.message
import DesignLibrary
@_spi(SwiftUI) import _SwiftUICorePrivate
import AttributeGraph
import Spatial
import Darwin.POSIX.dlfcn

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyViewControllerRepresentable())
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
        
//        Task {
//            try! await Task.sleep(for: .seconds(1))
//            hostingController.traitOverrides.displayScale = 4
//        }
        
        print(NSStringFromClass(object_getClass(hostingController)!))
        print(hostingController)
        
//        Task {
//            try! await Task.sleep(for: .seconds(1))
//            navigationController?.popViewController(animated: true)
//        }
    }
}

fileprivate struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let uiViewController = UIViewController()
        uiViewController.view.backgroundColor = .systemOrange
        return uiViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
