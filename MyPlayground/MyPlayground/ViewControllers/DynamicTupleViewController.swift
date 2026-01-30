//
//  DynamicTupleViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 1/28/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif
import Observation

@MainActor
@Observable
fileprivate final class Model {
    var count = 1
}

fileprivate struct MyView: View {
    let model: Model
    
    var body: some View {
        if model.count >= 1 {
            Color.black
        }
        
        if model.count >= 2 {
            Color.white
        }
        
        if model.count >= 3 {
            Color.black
        }
        
        if model.count >= 4 {
            Color.white
        }
        
        if model.count >= 5 {
            Color.black
        }
    }
}

final class DynamicTupleViewController: UIViewController {
    private let model = Model()
    
    override func loadView() {
        let rootView = MyView(model: model)
        view = _UIHostingView(rootView: rootView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 5
        stepper.stepValue = 1
        stepper.value = Double(model.count)
        stepper.isContinuous = false
        stepper.autorepeat = false
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        let barButtonItem = UIBarButtonItem(customView: stepper)
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        model.count = Int(sender.value)
    }
}
