//
//  SphereViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 6/4/26.
//

import MyRealityKit
import MySwiftUI
import _MyRealityKit_MySwiftUI
import UIKit

struct SphereView : View {
    let radius: Float
    
    var body: some View {
        RealityView { content, _ in
            let entity = ModelEntity(
                mesh: .generateSphere(radius: radius),
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

fileprivate struct MyView : View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack {
            SphereView(radius: 0.1)
            
            MyButton(title: "Show Volumetric") { 
                openWindow(id: "Volumetric")
            }
        }
        .onAppear { 
            openWindow(id: "Volumetric")
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
