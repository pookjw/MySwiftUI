//
//  WithAnimationViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/25/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @State private var y: CGFloat = 0
    
    var body: some View {
        _VStackLayout {
            MyButton(title: "Move") { 
                move()
            }
            
            Color.black
                .offset(x: 100, y: y)
        }
        .onAppear { 
            move()
        }
    }
    
    private func move() {
        withAnimation {
            if y == 0 {
                y = 100
            } else {
                y = 0
            }
        }
    }
}

final class WithAnimationViewController : UIViewController {
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
