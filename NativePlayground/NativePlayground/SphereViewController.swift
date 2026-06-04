//
//  SphereViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 6/4/26.
//

import RealityKit
import SwiftUI
import UIKit

fileprivate struct MyView : View {
    var body: some View {
        RealityView { content, _ in
            let entity = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [
                    SimpleMaterial(
                        color: .cyan,
                        isMetallic: true
                    )
                ]
            )
            
            content.add(entity)
        } update: { content, _ in
            
        } placeholder: { 
            
        } attachments: { 
            
        }
    }
}

final class SphereViewController : UIViewController {
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
