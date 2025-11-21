//
//  AnyEmptyViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/21/25.
//

import UIKit
import MySwiftUI

final class AnyEmptyViewController: UIViewController {
    override func loadView() {
        view = _UIHostingView(rootView: AnyView(EmptyView()))
    }
}
