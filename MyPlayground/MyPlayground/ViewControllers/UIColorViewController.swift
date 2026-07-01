//
//  UIColorViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 7/1/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    var body: some View {
        HStack {
            Color(uiColor: .systemBlue)
            Color(UIColor.systemPink)
            Color(uiColor: UIColor(Color.green))
            Color(uiColor: UIColor(Color(uiColor: .systemOrange)))
        }
    }
}

final class UIColorViewController : UIViewController {
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
