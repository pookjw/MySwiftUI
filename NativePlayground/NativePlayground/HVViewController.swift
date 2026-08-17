//
//  HVViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/18/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    var body: some View {
        VStack {
            ForEach(0..<4) { _ in
                HStack {
                    Color.red
                    Color.orange
                    Color.green
                    Color.blue
                }
            }
        }
    }
}

final class HVViewController : UIViewController {
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
