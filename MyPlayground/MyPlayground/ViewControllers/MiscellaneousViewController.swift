//
//  MiscellaneousViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 8/18/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : View {
    @State private var isStar = false
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ForEach(0..<100) { index in
                    Group {
                        if self.isStar {
                            Color.orange
                        } else {
                            Color.pink
                        }
                    }
                    .frame(width: 30, height: 30)
//                    .offset(
//                        x: self.xOffset(for: index, container: proxy.size),
//                        y: self.yOffset(for: index, container: proxy.size)
//                    )
//                    .offset(z: self.zOffset)
                }
            }
            
            MyButton(title: "Toggle") { 
                withAnimation { 
                    self.isStar.toggle()
                }
            }
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

extension MyView {
    private func xOffset(for index: Int, container: CGSize) -> CGFloat {
        let t = CGFloat(index) * 2 * .pi / 50
        let scale = min(container.width, container.height) / 32

        if isStar {
            let angle = t - .pi / 2
            let radius = 9 + 4 * cos(5 * angle)
            return container.width / 2 + radius * cos(angle) * scale
        }
        
        return container.width / 2 + 16 * pow(sin(t), 3) * scale
    }
    
    private func yOffset(for index: Int, container: CGSize) -> CGFloat {
        let t = CGFloat(index) * 2 * .pi / 50
        let scale = min(container.width, container.height) / 32

        if isStar {
            let angle = t - .pi / 2
            let radius = 9 + 4 * cos(5 * angle)
            return container.height / 2 + radius * sin(angle) * scale
        }
        
        let heartY = 13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)
        return container.height / 2 - heartY * scale
    }
    
    private var zOffset: CGFloat {
        return self.isStar ? 300 : 0
    }
}
