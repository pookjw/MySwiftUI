//
//  ViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import MySwiftUI

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emptyView = EmptyView()
        let hostingView = _UIHostingView(rootView: emptyView)
        view.addSubview(hostingView)
        hostingView.frame = view.bounds
        hostingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
