//
//  EmptyViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/21/25.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

final class EmptyViewController: UIViewController {
    override func loadView() {
        view = _UIHostingView(rootView: EmptyView())
    }
}
