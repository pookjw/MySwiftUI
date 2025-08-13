//
//  ViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import SwiftUI
import _SwiftPrivate

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emptyView = EmptyView()
        let hostingView = _UIHostingView(rootView: emptyView)
        view.addSubview(hostingView)
        hostingView.frame = view.bounds
        hostingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        Task {
            try await Task.sleep(for: .seconds(1))
            
            _forEachField(of: type(of: hostingView), options: [.classType]) { name, offset, type, kind in
                print(String(cString: name))
                print(String(format: "%lx", offset))
                return true
            }
        }
    }
}
