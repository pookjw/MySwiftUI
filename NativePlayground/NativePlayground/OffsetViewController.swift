//
//  OffsetViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 4/25/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    @State private var value = 0
    
    var body: some View {
        Color.black
            .frame(width: 300, height: 300)
            .offset(x: 300, y: 300)
    }
}

final class OffsetViewController : UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
