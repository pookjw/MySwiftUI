//
//  WithAnimationViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 4/25/26.
//

import UIKit
import SwiftUI

fileprivate struct Trapezoid: Shape {
    var insetAmount: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
}

fileprivate struct MyView : View {
    @State private var y: CGFloat = 0
    @State private var insetAmount = 50.0
    
    var body: some View {
        _VStackLayout {
            MyButton(title: "Move") { 
                move()
            }
            
            Trapezoid(insetAmount: insetAmount)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    insetAmount = Double.random(in: 10...90)
                }
            
            Color.black
                .offset(x: 100, y: y)
        }
        .onAppear { 
            move()
        }
    }
    
    private func move() {
        withAnimation {
            if y == 0 {
                y = 100
            } else {
                y = 0
            }
        }
        
        withAnimation {
            insetAmount = Double.random(in: 10...90)
        }
    }
}

final class WithAnimationViewController : UIViewController {
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
