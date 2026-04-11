//
//  WindowCounterViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/12/26.
//

import UIKit
import SwiftUI
import Observation

struct WindowCounterView : View {
    @Binding var count: Int
    
    var body: some View {
        MyLabel(text: count.description)
        MyStepper(value: $count)
    }
}

fileprivate struct MyView : View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        MyButton(title: "Open Window") {
            openWindow(id: "WindowCounter")
        }
    }
}

final class WindowCounterViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = MyView()
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
