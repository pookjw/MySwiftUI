//
//  ContainerValueViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 5/5/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView<Content : View> : View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ForEach(subviews: content()) { subview in
            subview
                .frame(width: 100, height: 100)
                .offset(x: subview.containerValues.flag ? 100 : 0)
        }
    }
}

final class ContainerValueViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = MyView {
            Color.black
                .containerValue(\.flag, false)
            
            Color.white
                .containerValue(\.flag, true)
            
            Color.black
                .containerValue(\.flag, false)
            
            Color.white
                .containerValue(\.flag, true)
        }
        
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}

extension ContainerValues {
    var flag: Bool {
        get {
            self[__Key_flag.self]
        }
        set {
            self[__Key_flag.self] = newValue
        }
    }
    
    private struct __Key_flag: ContainerValueKey {
        static var defaultValue: Bool {
            get {
                false
            }
        }
    }
}
