//
//  CircleViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 10/5/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : View {
    var body: some View {
        Circle()
    }
}

final class CircleViewController : UIViewController {
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
