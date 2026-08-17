//
//  ViewRepViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/22/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let uiView = UIView()
        uiView.backgroundColor = .systemOrange
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

final class ViewRepViewController : UIViewController {
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
