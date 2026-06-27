//
//  HStackLayoutViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 6/27/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @State private var alignment: VerticalAlignment = .center
    @State private var spacing: CGFloat? = nil
    
    var body: some View {
        HStackLayout(
            alignment: alignment,
            spacing: spacing
        ) { 
            MyButton(title: "Alignment") { 
                toggleAlignment()
            }
            .frame(width: 100, height: 100)
            
            MyButton(title: "Spacing") { 
                adjustSpacing()
            }
            .frame(width: 100, height: 100)
            
            Color.black
                .frame(width: 150, height: 150)
            
            Color.white
                .frame(width: 200, height: 200)
        }
    }
    
    private func toggleAlignment() {
        switch alignment {
        case .center:
            alignment = .top
        case .top:
            alignment = .bottom
        case .bottom:
            alignment = .center
        default:
            fatalError()
        }
    }
    
    private func adjustSpacing() {
        guard let spacing else {
            spacing = 10
            return
        }
        
        self.spacing = spacing + 10
    }
}

final class HStackLayoutViewController : UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
