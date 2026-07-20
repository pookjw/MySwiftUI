//
//  FlexFrameLayoutViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 7/21/26.
//

import SwiftUI
import UIKit

fileprivate struct MyView : View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                HStack {
                    Color.red
                        .frame(
                            minWidth: nil,
                            idealWidth: proxy.size.width * 0.3,
                            maxWidth: proxy.size.width * 0.5,
                            minHeight: nil,
                            idealHeight: nil,
                            maxHeight: nil,
                            alignment: .center
                        )
                    
                    Color.blue
                        .frame(
                            minWidth: proxy.size.width * 0.7,
                            idealWidth: nil,
                            maxWidth: proxy.size.width * 0.8,
                            minHeight: nil,
                            idealHeight: nil,
                            maxHeight: nil,
                            alignment: .center
                        )
                }
            }
            GeometryReader { proxy in
                VStack {
                    Color.green
                        .frame(
                            minWidth: nil,
                            idealWidth: nil,
                            maxWidth: nil,
                            minHeight: nil,
                            idealHeight: proxy.size.height * 0.3,
                            maxHeight: proxy.size.height * 0.5,
                            alignment: .center
                        )
                    
                    Color.orange
                        .frame(
                            minWidth: nil,
                            idealWidth: nil,
                            maxWidth: nil,
                            minHeight: proxy.size.height * 0.7,
                            idealHeight: nil,
                            maxHeight: proxy.size.height * 0.8,
                            alignment: .center
                        )
                }
            }
        }
    }
}

final class FlexFrameLayoutViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
