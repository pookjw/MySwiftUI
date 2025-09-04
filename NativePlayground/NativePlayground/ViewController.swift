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
//import _UIKitPrivate

struct Foo: ViewGraphGeometryMeasurer {
    typealias Proposal = CGSize
    
    typealias Size = CGSize
    
    
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(CustomEventCategory.unknown.rawValue)
//        print(CustomEventCategory.observable.rawValue)
//        print(CustomEventCategory.transaction.rawValue)
//        print(CustomEventCategory.action.rawValue)
//        print(CustomEventCategory.graph.rawValue)
//        print(CustomEventCategory.animation.rawValue)
//        print(CustomEventCategory.instantiation.rawValue)
//        print(CustomEventCategory.dynamicProperties.rawValue)
        
//        _ = GraphHost.Data()
        
//        let v: RoundedCornerStyle? = nil
//        withUnsafePointer(to: v) { pointer in
//            let p = UnsafeRawPointer(pointer).assumingMemoryBound(to: UInt32.self)
//            print(p.pointee)
//        }
        /*
         keyType (0x10)
         before (0x18)
         after (0x20)
         skip (0x28)
         length (0x30)
         skipCount (0x34)
         skipFilter (0x38)
         id (0x40)
         // _typeByName("7SwiftUI20UIKitStatusBarBridgeC")!
         */
        print(_UIHostingView<EmptyView>.self)
        _forEachField(of: _UIHostingView<EmptyView>.self, options: [.classType]) { name, offset, type, kind in
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
        
        print(UnsafeHeterogeneousBuffer.self)
        _forEachField(of: UnsafeHeterogeneousBuffer.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, String(describing: type), offset))
            return true
        }
        
        print(MemoryLayout<MyClass_1>.size)
        print(MemoryLayout<MyClass_1>.stride)
        print(MemoryLayout<MyClass_2>.size)
        print(MemoryLayout<MyClass_2>.stride)
        UnsafeHeterogeneousBuffer().append(MyClass_1(), vtable: MyVTable.self)
        UnsafeHeterogeneousBuffer().append(MyClass_2(), vtable: MyVTable.self)
        
        do {
            
            let emptyView = EmptyView()
            let hostingView = _UIHostingView(rootView: emptyView)
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
