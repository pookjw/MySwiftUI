//
//  MyButton.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/1/26.
//

import UIKit
import SwiftUI

struct MyButton: UIViewRepresentable {
    let title: String
    let onTrigger: () -> Void
    
    func makeUIView(context: Context) -> UIButton {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = title
        let button = UIButton(configuration: configuration)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonDidTrigger(_:)), for: .primaryActionTriggered)
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = title
        uiView.configuration = configuration
        
        context.coordinator.onTrigger = onTrigger
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(onTrigger: onTrigger)
    }
    
    final class Coordinator {
        var onTrigger: () -> Void
        
        init(onTrigger: @escaping () -> Void) {
            self.onTrigger = onTrigger
        }
        
        @objc func buttonDidTrigger(_ sender: UIButton) {
            onTrigger()
        }
    }
}
