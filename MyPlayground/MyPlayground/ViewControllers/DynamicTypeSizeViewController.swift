//
//  DynamicTypeSizeViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/3/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    var body: some View {
        if dynamicTypeSize == .large {
            Color.white
        } else {
            Color.black
        }
    }
}

final class DynamicTypeSizeViewController : UIViewController {
    override func loadView() {
        let rootView = MyView()
        view = _UIHostingView(rootView: rootView)
    }
}
