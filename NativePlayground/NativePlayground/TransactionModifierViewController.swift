//
//  TransactionModifierViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 5/4/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    @State private var x: CGFloat = 0
    
    var body: some View {
        _VStackLayout {
            MyButton(title: "Move") { 
                move()
            }
            
            Color.black
                .frame(width: 100, height: 100)
                .offset(x: x)
                .animation(.default)
        }
//        .animation(.default)
    }
    
    private func move() {
        if x == 0 {
            x = 300
        } else {
            x = 0
        }
    }
}

final class TransactionModifierViewController : UIViewController {
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
