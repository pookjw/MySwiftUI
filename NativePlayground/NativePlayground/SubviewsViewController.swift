//
//  SubviewsViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 5/4/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView<Content : View> : View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ForEach(subviews: content()) { subview in
            subview
                .frame(width: 100, height: 100)
        }
    }
}

final class SubviewsViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = MyView {
            Color.black
            Color.white
            Color.black
            Color.white
        }
        
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
