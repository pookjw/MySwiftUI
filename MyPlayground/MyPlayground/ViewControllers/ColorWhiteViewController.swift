//
//  ColorWhiteViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/21/25.
//

import UIKit
import MySwiftUI

final class ColorWhiteViewController: UIViewController {
    override func loadView() {
        let hostingView = _UIHostingView(rootView: AnyView(Color.white))
        hostingView.rootView = AnyView(Color.black)
        hostingView.rootView = AnyView(EmptyView())
    }
}
