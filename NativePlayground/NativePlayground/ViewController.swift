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
        
        /*
         keyType (0x10)
         before (0x18)
         after (0x20)
         skip (0x28)
         length (0x30)
         skipCount (0x34)
         skipFilter (0x38)
         id (0x40)
         */
        _forEachField(of: _typeByName("7SwiftUI12PropertyListV7ElementC")!, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (0x%lx)", name, offset))
            return true
        }
        
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
