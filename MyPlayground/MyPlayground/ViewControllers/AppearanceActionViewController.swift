//
//  AppearanceActionViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 1/31/26
//

import UIKit
import MySwiftUI

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
    override func loadView() {
        let rootView = MyView { [weak self] in
            self?.presentAlert(title: "onAppear")
        } onDisappear: { [weak self] in
            self?.presentAlert(title: "onDisappear")
        }
        
        view = _UIHostingView(rootView: rootView)
    }
    
    private func presentAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        alertController.addAction(doneAction)
        (navigationController ?? self).present(alertController, animated: true)
    }
}
