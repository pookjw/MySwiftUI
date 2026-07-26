//
//  SphereViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 6/4/26.
//

import RealityKit
import SwiftUI
import UIKit

fileprivate struct MyComponent : Component {
    
}

fileprivate struct MyView : View {
    var body: some View {
        RealityView { content, attachments in
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
//            entity.components.set(MyComponent())
//            entity.components.set(MyComponent())
            
//            if let glassCubeAttachment = attachments.entity(for: "GlassCubeLabel") {
//                glassCubeAttachment.position = [0, -0.1, 0]
//                entity.addChild(glassCubeAttachment)
//            }
        } update: { content, _ in
            
        } placeholder: { 
            
        } attachments: { 
//            Attachment(id: "GlassCubeLabel") {
//                Text("Glass Cube")
//                    .font(.extraLargeTitle)
//                    .padding()
//                    .glassBackgroundEffect()
//            }
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
