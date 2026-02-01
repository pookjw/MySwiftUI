//
//  AppearanceActionViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 1/31/26
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: View {
    let onAppear: () -> Void
    let onDisappear: () -> Void
    
    var body: some View {
        Color.white
            .onAppear(perform: onAppear)
            .onDisappear(perform: onDisappear)
    }
}

final class AppearanceActionViewController: UIViewController {
    @ViewLoading private var barButtonItem: UIBarButtonItem
    
    override func loadView() {
        let navigationController = navigationController
        
        let rootView = MyView {
            navigationController?.presentAlert(title: "onAppear")
            print("onAppear")
        } onDisappear: {
            navigationController?.presentAlert(title: "onDisappear")
            print("onDisappear")
        }
        
        view = _UIHostingView(rootView: rootView)
    }
}
