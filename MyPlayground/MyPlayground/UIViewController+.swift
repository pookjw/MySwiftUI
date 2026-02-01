//
//  UIViewController+.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 1/31/26.
//

import UIKit

extension UIViewController {
    func dismissAllViewControllers(animated: Bool, completion: (() -> Void)?) {
        if let presentedViewController {
            presentedViewController.dismiss(animated: animated) { 
                self.dismissAllViewControllers(animated: animated, completion: completion)
            }
        } else {
            completion?()
        }
    }
    
    func presentAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        alertController.addAction(doneAction)
        
        var presentedViewController = (navigationController ?? self)
        while let _presentedViewController = presentedViewController.presentedViewController {
            presentedViewController = _presentedViewController
        }
        
        presentedViewController.present(alertController, animated: true)
    }
}
