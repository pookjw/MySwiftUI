//
//  AnyLayoutViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 6/27/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @State private var flag = false
    
    var body: some View {
        layout { 
            MyButton(title: "Toggle") {
                withAnimation {
                    flag.toggle()
                }
            }
            
            Color.black
                .frame(width: 150, height: 150)
            
            Color.white
                .frame(width: 200, height: 200)
        }
    }
    
    private var layout: AnyLayout {
        if flag {
            return AnyLayout(HStackLayout())
        } else {
            return AnyLayout(VStackLayout())
        }
    }
}

final class AnyLayoutViewController : UIViewController {
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
