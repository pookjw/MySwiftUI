//
//  EmptyViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/21/25.
//

import UIKit
import MySwiftUI

final class EmptyViewController: UIViewController {
    override func loadView() {
        view = _UIHostingView(rootView: EmptyView())
    }
}
