//
//  OverlayModifierViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 10/21/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : View {
    var body: some View {
        GeometryReader { proxy in
            Color.green
                .overlay { 
                    Color.orange
                        .frame(width: proxy.size.width * 0.5, height: proxy.size.height * 0.5)
                }
        }
    }
}

final class OverlayModifierViewController : UIViewController {
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
