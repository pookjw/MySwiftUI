//
//  OpenWindowActionViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/1/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        MyButton(title: "Open Window") { 
            openWindow(id: "2")
        }
        .onAppear { 
            openWindow(id: "2")
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
