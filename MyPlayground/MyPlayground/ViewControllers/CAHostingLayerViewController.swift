//
//  CAHostingLayerViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 9/29/26.
//

import UIKit
@_spi(Internal) import MySwiftUI

fileprivate struct MyView : View {
    var body: some View {
        VStack {
            Color.red
            Color.orange
            Color.yellow
            Color.green
            Color.blue
            Color.cyan
            Color.purple
        }
    }
}

final class CAHostingLayerViewController : UIViewController {
    @ViewLoading private var hostingLayer: CAHostingLayer<MyView>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingLayer = CAHostingLayer(rootView: MyView())
        self.hostingLayer = hostingLayer
        self.view.layer.addSublayer(hostingLayer)
        hostingLayer.frame = self.view.layer.bounds
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.hostingLayer.frame = self.view.layer.bounds
    }
}
