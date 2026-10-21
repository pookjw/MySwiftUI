//
//  BorderViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 10/21/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    var body: some View {
        Color.clear
            .border(.orange, width: 30)
    }
}

final class BorderViewController : UIViewController {
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
