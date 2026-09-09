//
//  HiddenModifierViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 9/9/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    var body: some View {
        VStack {
            Color.orange
                .hidden()
            Color.green
        }
    }
}

final class HiddenModifierViewController : UIViewController {
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
