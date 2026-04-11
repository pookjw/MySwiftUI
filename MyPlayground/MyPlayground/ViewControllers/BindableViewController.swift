//
//  BindableViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/10/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif
import Observation

@MainActor
@Observable
fileprivate final class ObservableBindableModel {
    static let shared = ObservableBindableModel()
    
    var count = 0
}

struct BindableView : View {
    @Environment(\.openWindow) private var openWindow
    @Bindable fileprivate var observableModel: ObservableBindableModel = .shared
    
    var body: some View {
        MyLabel(text: observableModel.count.description)
        MyStepper(value: $observableModel.count)
        MyButton(title: "Open Window") { 
            openWindow(id: "BindableView")
        }
    }
}

fileprivate struct MyView : View {
    var body: some View {
        BindableView()
    }
}

final class BindableViewController : UIViewController {
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
