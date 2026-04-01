//
//  OpenURLActionViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 3/13/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: View {
    @Environment(\._openSensitiveURL) private var openURL
    
    var body: some View {
        MyButton(title: "Open URL") { 
            openURL(URL(string: "https://www.apple.com")!)
        }
    }
}

final class OpenURLActionViewController: UIViewController {
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
