//
//  EquatableViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 10/5/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    @State private var value_1 = 0
    @State private var value_2 = 0
    
    var body: some View {
        ChildView(value_1: self.value_1, value_2: self.value_2)
            .equatable()
        
        MyButton(title: "Increment 1") { 
            self.value_1 &+= 1
        }
        
        MyButton(title: "Increment 2") { 
            self.value_2 &+= 1
        }
    }
}

fileprivate struct ChildView : View, Equatable {
    static func == (lhs: ChildView, rhs: ChildView) -> Bool {
        return lhs.value_2 == rhs.value_2
    }
    
    let value_1: Int
    let value_2: Int
    
    var body: some View {
        MyLabel(text: self.value_1.description)
        MyLabel(text: self.value_2.description)
    }
}

final class EquatableViewController : UIViewController {
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
