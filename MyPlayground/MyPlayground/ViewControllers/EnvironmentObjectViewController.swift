//
//  EnvironmentObjectViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 7/2/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif
import Combine

fileprivate final class ViewModel : ObservableObject {
    @Published var count = 0
}

fileprivate struct MyView : View {
    @EnvironmentObject private var viewModel: ViewModel
    
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
        .task {
            do {
                while true {
                    try await Task.sleep(for: .seconds(1))
                    viewModel.count &+= 1
                }
            } catch {
                return
            }
        }
        
        MyLabel(text: viewModel.count.description)
    }
}

final class EnvironmentObjectViewController : UIViewController {
    @ViewLoading private var hostingController: UIHostingController<AnyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(
            rootView: AnyView(MyView().environmentObject(ViewModel()))
        )
        
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
        
//        Task {
//            try! await Task.sleep(for: .seconds(1))
//            self.navigationController?.popViewController(animated: true)
//        }
    }
}

