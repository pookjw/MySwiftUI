//
//  PushViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 12/2/25.
//

import UIKit

final class PushViewController: UIViewController {
    override func loadView() {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Push"
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(foo(_:)), for: .primaryActionTriggered)
        view = button
    }
    
    @objc private func foo(_ sender: UIButton) {
        guard let navigationController else { return }
        navigationController.pushViewController(ViewController(), animated: true)
    }
}
