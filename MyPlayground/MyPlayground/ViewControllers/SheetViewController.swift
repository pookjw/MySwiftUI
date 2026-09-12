//
//  SheetViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 9/13/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : View {
    @State private var isPresented = false
    
    var body: some View {
        MyButton(title: "Present") {
            self.isPresented = true
        }
        .sheet(isPresented: self.$isPresented) {
            MyButton(title: "Dismiss") { 
                self.isPresented = false
            }
        }
        .task {
            self.isPresented = true
        }
    }
}

final class SheetViewController : UIViewController {
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
