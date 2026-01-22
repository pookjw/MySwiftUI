//
//  ObservableViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 12/7/25.
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
fileprivate final class Model {
    var flag = false
}

fileprivate struct MyView: View {
    let model: Model
    
    var body: some View {
        AnyView(model.flag ? Color.white : Color.black)
    }
}

final class ObservableViewController: UIViewController {
    @ViewLoading private var toggleBarButtonItem: UIBarButtonItem
    private let model = Model()
    
    override func loadView() {
        let rootView = MyView(model: model)
        view = _UIHostingView(rootView: rootView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toggleBarButtonItem = UIBarButtonItem(title: "Toggle", image: UIImage(systemName: model.flag ? "ant.fill" : "ant"), target: self, action: #selector(toggleBarButtonItemDidTrigger(_:)))
        self.toggleBarButtonItem = toggleBarButtonItem
        navigationItem.rightBarButtonItem = toggleBarButtonItem
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        toggleBarButtonItem.image = UIImage(systemName: model.flag ? "ant.fill" : "ant")
    }
    
    @objc private func toggleBarButtonItemDidTrigger(_ sender: UIBarButtonItem) {
        model.flag.toggle()
    }
}

