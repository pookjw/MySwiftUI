//
//  ViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import MySwiftUI

class ViewController: UIViewController {
    override func loadView() {
        let rootView = AnyView(EmptyView())
        let hostingView = _UIHostingView(rootView: rootView)
        self.view = hostingView
    }
}
