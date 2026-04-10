//
//  MyStepper.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/10/26.
//

import UIKit
import SwiftUI

struct MyStepper : UIViewRepresentable {
    @Binding var value: Int
    
    func makeUIView(context: Context) -> UIStepper {
        let stepper = UIStepper()
        stepper.addTarget(context.coordinator, action: #selector(Coordinator.valueDidChange(_:)), for: .primaryActionTriggered)
        stepper.value = Double(value)
        stepper.minimumValue = -100
        stepper.maximumValue = 100
        stepper.stepValue = 1
        return stepper
    }
    
    func updateUIView(_ uiView: UIStepper, context: Context) {
        uiView.value = Double(value)
        context.coordinator.value = $value
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(value: $value)
    }
    
    final class Coordinator {
        fileprivate var value: Binding<Int>
        
        fileprivate init(value: Binding<Int>) {
            self.value = value
        }
        
        @objc fileprivate func valueDidChange(_ sender: UIStepper) {
            value.wrappedValue = Int(sender.value)
        }
    }
}
