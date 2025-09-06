//
//  ViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/13/25.
//

import UIKit
import SwiftUI
import _SwiftPrivate
import _SwiftUIPrivate
import _UIKitPrivate

struct Foo: ViewGraphGeometryMeasurer {
    typealias Proposal = CGSize
    
    typealias Size = CGSize
    
    
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(_UIHostingView<EmptyView>.self)
        _forEachField(of: _UIHostingView<EmptyView>.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(UIHostingViewBase.self)
        _forEachField(of: UIHostingViewBase.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(ViewGraphHost.self)
        _forEachField(of: ViewGraphHost.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(ViewGraph.self)
        _forEachField(of: ViewGraph.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print("===")
        
        print(RepresentableContextValues.self)
        _forEachField(of: RepresentableContextValues.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
//        
//        print("===")
//        
//        print(UnsafeHeterogeneousBuffer.self)
//        _forEachField(of: UnsafeHeterogeneousBuffer.self, options: []) { name, offset, type, kind in
//            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
//            return true
//        }
        
        do {
//            let emptyView = EmptyView()
//            let hostingView = _UIHostingView<EmptyView>(coder: NSCoder())
        }
        
        let emptyView = EmptyView()
        let hostingView = _UIHostingView(rootView: emptyView)
        view.addSubview(hostingView)
        hostingView.frame = view.bounds
        hostingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
//        Task {
//            try await Task.sleep(for: .seconds(1))
//            
//            _forEachField(of: type(of: hostingView), options: [.classType]) { name, offset, type, kind in
//                print(String(cString: name))
//                print(String(format: "%lx", offset))
//                return true
//            }
//        }
    }
}

@_weakLinked
class MyVTable: _UnsafeHeterogeneousBuffer_VTable {
    
}

struct MyClass_1 {
    var num = (3, 3, 3,3,3,3,3,3)
}

struct MyClass_2 {
    
}
