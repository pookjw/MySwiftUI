//
//  VStackLayoutViewController.swift
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
    @State private var alignment: HorizontalAlignment = .center
    @State private var spacing: CGFloat? = nil
    
    var body: some View {
        VStackLayout(
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
            alignment = .leading
        case .leading:
            alignment = .trailing
        case .trailing:
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

final class VStackLayoutViewController : UIViewController {
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
