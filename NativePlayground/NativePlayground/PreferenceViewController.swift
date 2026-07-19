//
//  PreferenceViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 7/19/26.
//

import UIKit
import SwiftUI

fileprivate struct MyPreferenceKey : PreferenceKey {
    static var defaultValue: Int {
        return 0
    }
    
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value = nextValue()
    }
}

fileprivate struct MyView : View {
    @State private var value = 0
    
    var body: some View {
        ChildView()
            .onPreferenceChange(MyPreferenceKey.self) { newValue in
                value = newValue
            }
        
        MyLabel(text: "\(value)")
    }
}

fileprivate struct ChildView : View {
    @State private var value = 0
    
    var body: some View {
        MyStepper(value: $value)
            .preference(key: MyPreferenceKey.self, value: value)
    }
}

final class PreferenceViewController : UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(
            rootView: MyView()
        )
        
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
