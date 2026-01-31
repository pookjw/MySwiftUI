//
//  AppearanceActionViewListController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/1/26.
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
    let onAppear: () -> Void
    let onDisappear: () -> Void
    
    var body: some View {
        if model.flag {
            Color.white
                .onAppear(perform: onAppear)
                .onDisappear(perform: onDisappear)
            
            Color.white
            
            Color.white
        } else {
            Color.black
                .onAppear(perform: onAppear)
                .onDisappear(perform: onDisappear)
        }
    }
}

final class AppearanceActionViewListController: UIViewController {
    private let model = Model()
    @ViewLoading private var barButtonItem: UIBarButtonItem
    
    override func loadView() {
        let navigationController = navigationController
        
        let rootView = MyView(model: model) {
            navigationController?.presentAlert(title: "onAppear")
        } onDisappear: {
            navigationController?.presentAlert(title: "onDisappear")
        }
        
        view = _UIHostingView(rootView: rootView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "ant.fill"), style: .plain, target: self, action: #selector(barButtonItemDidTrigger(sender:)))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func barButtonItemDidTrigger(sender: UIBarButtonItem) {
        model.flag.toggle()
    }
}
