//
//  ZOffsetViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 6/6/26.
//

import MySwiftUI
import UIKit

fileprivate struct MyView : View {
    var body: some View {
        Color.white
            .frame(width: 100, height: 100)
            .offset(z: 100)
    }
}

final class ZOffsetViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
