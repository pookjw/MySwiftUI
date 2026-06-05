//
//  GeometryReaderViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 6/5/26.
//

import SwiftUI
import UIKit

fileprivate struct MyView : View {
    var body: some View {
        GeometryReader { proxy in
            MyLabel(text: "\(proxy.size)")
        }
    }
}

final class GeometryReaderViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
