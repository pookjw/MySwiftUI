//
//  SubviewsViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 5/4/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView<Content : View> : View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ForEach(sections: content()) { section in
            section.header
                .frame(width: 60, height: 60)
            
            ForEach(subviews: section.content) { subview in
                subview
                    .frame(width: 30, height: 30)
            }
            
            section.footer
                .frame(width: 60, height: 60)
        }
    }
}

final class SubviewsViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = MyView {
            Section { 
                Color.white
                Color.white
            } header: { 
                Color.white
            } footer: {
                Color.white
            }
            
            Color.black
            Color.black
            
            Section {
                Color.white
                Color.white
            } header: { 
                Color.white
            } footer: {
                Color.white
            }
        }
        
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
