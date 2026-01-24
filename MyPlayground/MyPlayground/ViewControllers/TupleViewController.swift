//
//  TupleViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 1/24/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: View {
    var body: some View {
        Color.black
        Color.white
    }
}

final class TupleViewController: UIViewController {
    override func loadView() {
        let rootView = MyView()
        view = _UIHostingView(rootView: rootView)
    }
}
