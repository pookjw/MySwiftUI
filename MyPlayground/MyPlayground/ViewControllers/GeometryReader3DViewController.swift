//
//  GeometryReader3DViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 6/12/26.
//

import MySwiftUI
import UIKit
import Spatial

fileprivate struct MyView : View {
    var body: some View {
        GeometryReader3D { proxy in
            MyLabel(text: proxy.size.depth.description)
        }
        .frame(depth: 100)
    }
}

final class GeometryReader3DViewController : UIViewController {
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
