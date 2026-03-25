//
//  StaticIfViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 3/25/26.
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
            
    }
}

final class StaticIfViewController: UIViewController {
    override func loadView() {
        view = _UIHostingView(rootView: Color.black)
    }
}
