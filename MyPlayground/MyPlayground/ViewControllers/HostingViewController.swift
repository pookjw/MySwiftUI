//
//  HostingViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/5/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: View {
    var flag: Bool
    
    var body: some View {
        if flag {
            Color.black
        } else {
            Color.white
        }
    }
}

final class HostingViewController: UIViewController {
    @ViewLoading private var toggleBarButtonItem: UIBarButtonItem
    @ViewLoading private var hostingController: UIHostingController<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toggleBarButtonItem = UIBarButtonItem(title: "Toggle", image: UIImage(systemName: "ant.fill"), target: self, action: #selector(toggleBarButtonItemDidTrigger(_:)))
        self.toggleBarButtonItem = toggleBarButtonItem
        navigationItem.rightBarButtonItem = toggleBarButtonItem
        
        let hostingController = UIHostingController(rootView: MyView(flag: false))
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
    
    @objc private func toggleBarButtonItemDidTrigger(_ sender: UIBarButtonItem) {
        hostingController.rootView.flag.toggle()
    }
}
