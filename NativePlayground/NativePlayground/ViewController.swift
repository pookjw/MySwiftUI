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
        print(ViewGraph.self)
        _forEachField(of: GraphHost.self, options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (0x%lx)", name, offset))
            return true
        }
        
        print(GraphHost.Data.self)
        _forEachField(of: GraphHost.Data.self, options: []) { name, offset, type, kind in
            print(String(format: "%s (0x%lx)", name, offset))
            return true
        }
        
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
