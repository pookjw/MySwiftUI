//
//  AnimationModifierViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 5/3/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

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
                .animation(.default, value: x)
        }
//        .animation(.default, value: x)
    }
    
    private func move() {
        if x == 0 {
            x = 300
        } else {
            x = 0
        }
    }
}

final class AnimationModifierViewController : UIViewController {
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
