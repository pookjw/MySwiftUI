//
//  ZStackViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 7/2/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @State private var alignment = Alignment(horizontal: .leading, vertical: .top)
    @State private var spacing: CGFloat = 100
    
    var body: some View {
        VStack {
            MyButton(title: "Alignment") { 
                updateAlignment()
            }
            
            MyButton(title: "Spacing") { 
                updateSpacing()
            }
            
//            ZStack(alignment: alignment, spacing: spacing) {
            ZStack(alignment: alignment) { 
                Color.red.frame(width: 300, height: 300)
                Color.green.frame(width: 200, height: 200)
                Color.blue.frame(width: 100, height: 100)
            }
        }
        .task {
            do {
                while true {
                    try await Task.sleep(for: .seconds(1))
                    updateAlignment()
                    updateSpacing()
                }
            } catch {}
        }
    }
    
    private func updateAlignment() {
        withAnimation {
            if self.alignment.horizontal == .leading {
                self.alignment = Alignment(horizontal: .trailing, vertical: .bottom)
            } else if alignment.horizontal == .trailing {
                self.alignment = Alignment(horizontal: .center, vertical: .center)
            } else {
                self.alignment = Alignment(horizontal: .leading, vertical: .top)
            }
        }
    }
    
    private func updateSpacing() {
        withAnimation {
            if self.spacing == 100 {
                self.spacing = 200
            } else {
                self.spacing = 100
            }
        }
    }
}

final class ZStackViewController : UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(
            rootView: MyView()
        )
        
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
