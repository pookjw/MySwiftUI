//
//  ViewRepresentableViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/22/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let uiView = UIView()
        uiView.backgroundColor = .systemBlue
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

final class ViewRepresentableViewController: UIViewController {
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
