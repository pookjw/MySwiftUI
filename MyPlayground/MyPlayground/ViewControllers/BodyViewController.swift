//
//  BodyViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 12/2/25.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: View {
    var body: some View {
        Color.white
    }
}

final class BodyViewController: UIViewController {
    override func loadView() {
        let rootView = MyView()
        view = _UIHostingView(rootView: rootView)
    }
}
