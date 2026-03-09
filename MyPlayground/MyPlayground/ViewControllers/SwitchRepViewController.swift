//
//  SwitchRepViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 3/8/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MySwitch: UIViewRepresentable {
    @Binding var isOn: Bool
    
    func makeUIView(context: Context) -> UISwitch {
        let uiView = UISwitch()
        uiView.addTarget(context.coordinator, action: #selector(Coordinator.valueDidChange(_:)), for: .valueChanged)
        return uiView
    }
    
    func updateUIView(_ uiView: UISwitch, context: Context) {
        context.coordinator.isOn = $isOn
        uiView.isOn = isOn
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isOn: $isOn)
    }
    
    final class Coordinator {
        var isOn: Binding<Bool>
        
        init(isOn: Binding<Bool>) {
            self.isOn = isOn
        }
        
        @objc func valueDidChange(_ sender: UISwitch) {
            isOn.wrappedValue = sender.isOn
        }
    }
}

fileprivate struct MyView: View {
    @State private var isOn = true
    
    var body: some View {
        MySwitch(isOn: $isOn)
        MySwitch(isOn: $isOn)
        MySwitch(isOn: $isOn)
        MySwitch(isOn: $isOn)
        MySwitch(isOn: $isOn)
    }
}

final class SwitchRepViewController: UIViewController {
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
