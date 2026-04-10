//
//  OpenImmsersiveWindowViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 4/7/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    var body: some View {
        MyButton(title: "Open Immersive Window") {
            Task {
                await openImmersiveSpace(id: "4")
            }
        }
        .onAppear {
            Task {
                await openImmersiveSpace(id: "3")
            }
        }
    }
}

final class OpenImmsersiveWindowViewController : UIViewController {
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
