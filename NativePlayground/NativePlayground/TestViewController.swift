//
//  TestViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 4/6/26.
//

import UIKit
import SwiftUI

fileprivate struct MyViewRep : UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UISwitch()
//        view.isEnabled = true
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

fileprivate struct MyView : View {
    var body: some View {
        MyViewRep()
//            .environment(\.isEnabled, false)
    }
}

final class TestViewController : UIViewController {
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
