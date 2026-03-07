//
//  ViewControllerRepresentableViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 3/7/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let uiViewController = UIViewController()
        uiViewController.view.backgroundColor = .systemOrange
        return uiViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

final class ViewControllerRepresentableViewController: UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
