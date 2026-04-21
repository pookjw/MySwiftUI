//
//  ValueActionModifierViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/21/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @State private var value = 0
    
    var body: some View {
        MyStepper(value: $value)
            .onChange(of: value, initial: true) { oldValue, newValue in
                print(oldValue, newValue)
            }
    }
}

final class ValueActionModifierViewController : UIViewController {
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
