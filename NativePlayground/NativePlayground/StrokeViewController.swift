//
//  StrokeViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 10/21/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    var body: some View {
        Circle()
            .stroke(
                Color.orange,
                style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round,
                    lineJoin: .miter,
                    miterLimit: 0,
                    dash: [5, 20],
                    dashPhase: 0
                )
            )
    }
}

final class StrokeViewController : UIViewController {
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
