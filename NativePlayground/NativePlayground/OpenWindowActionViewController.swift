//
//  OpenWindowActionViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 4/1/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        MyButton(title: "Open Window") { 
            openWindow(id: "1")
        }
        .onAppear { 
            openWindow(id: "1")
        }
    }
}

final class OpenWindowActionViewController : UIViewController {
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
