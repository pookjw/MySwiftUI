//
//  ObservedObjectViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 6/24/26.
//

import UIKit
import SwiftUI
import Combine

fileprivate final class ViewModel : ObservableObject {
    @Published var count = 0
}

fileprivate struct MyView : View {
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        MyStepper(
            value: Binding(
                get: { 
                    return viewModel.count
                },
                set: { newValue in
                    viewModel.count = newValue
                }
            )
        )
        
        MyLabel(text: viewModel.count.description)
    }
}

final class ObservedObjectViewController : UIViewController {
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
