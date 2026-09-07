//
//  OpacityEffectViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 9/7/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : View {
    @State private var flag = false
    
    var body: some View {
        VStack {
            Group {
                Color.orange
                Color.green
            }
            .opacity(self.flag ? 1.0 : 0.0)
            
            Color.blue
                .opacity(self.flag ? 1.0 : 0.0)
        }
        .task {
            do {
                while true {
                    try await Task.sleep(for: .seconds(1))
                    withAnimation {
                        self.flag.toggle()
                    }
                }
            } catch {}
        }
    }
}

final class OpacityEffectViewController : UIViewController {
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
