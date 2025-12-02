//
//  BodyViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 12/2/25.
//

import UIKit
import MySwiftUI

fileprivate struct MyView: View {
    var body: some View {
        Color.black
    }
}

final class BodyViewController: UIViewController {
    override func loadView() {
        view = _UIHostingView(rootView: MyView())
    }
}
