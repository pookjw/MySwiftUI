//
//  ZIndexViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 6/6/26.
//

import SwiftUI
import UIKit

fileprivate struct MyView : View {
    var body: some View {
        _VStackLayout(spacing: 0) {
            Color.white
                .frame(width: 100, height: 100)
                .offset(x: -150, y: 600)
                .offset(z: 200)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: -50, y: 500)
                .offset(z: 100)

            Color.white
                .frame(width: 100, height: 100)
                .offset(x: 50, y: 400)
                .offset(z: 200)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: 150, y: 300)
                .offset(z: 100)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: -150, y: 300)
                .offset(z: 100)

            Color.white
                .frame(width: 100, height: 100)
                .offset(x: -50, y: 200)
                .offset(z: 200)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: 50, y: 100)
                .offset(z: 100)

            Color.white
                .frame(width: 100, height: 100)
                .offset(x: 150, y: 0)
                .offset(z: 200)

            Color.white
                .frame(width: 100, height: 100)
                .offset(x: -150, y: 0)
                .offset(z: 200)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: -50, y: -100)
                .offset(z: 100)

            Color.white
                .frame(width: 100, height: 100)
                .offset(x: 50, y: -200)
                .offset(z: 200)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: 150, y: -300)
                .offset(z: 100)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: -150, y: -300)
                .offset(z: 100)

            Color.white
                .frame(width: 100, height: 100)
                .offset(x: -50, y: -400)
                .offset(z: 200)

            Color.black
                .frame(width: 100, height: 100)
                .offset(x: 50, y: -500)
                .offset(z: 100)

            Color.white
                .frame(width: 100, height: 100)
                .offset(x: 150, y: -600)
                .offset(z: 200)
        }
        .frame(width: 400, height: 400)
    }
}

final class ZOffsetViewController : UIViewController {
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
