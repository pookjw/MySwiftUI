//
//  MiscellaneousViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 8/18/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    @State private var flag = false
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ForEach(0..<100) { index in
                    Group {
                        if self.flag {
                            Color.orange
                        } else {
                            Color.pink
                        }
                    }
                    .frame(width: 30, height: 30)
                    .offset(
                        x: self.flag ? 0 : 300,
                        y: self.flag ? 0 : 300
                    )
                    .offset(z: self.flag ? 0 : 300)
                }
            }
            
            MyButton(title: "Toggle") { 
//                withAnimation { 
                    self.flag.toggle()
//                }
            }
        }
        .task {
            do {
                while true {
                    try await Task.sleep(for: .seconds(1))
                    self.flag.toggle()
                }
            } catch {}
        }
    }
}

final class MiscellaneousViewController : UIViewController {
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
