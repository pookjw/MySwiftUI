//
//  OpenURLActionViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 3/13/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyViewRep: UIViewRepresentable {
//    @Environment(\.openURL) private var openURL
    @Environment(\._openSensitiveURL) private var openURL
    
    func makeUIView(context: Context) -> UIButton {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = "Open URL"
        let button = UIButton(configuration: configuration)
        button.addTarget(context.coordinator, action: #selector(MyViewRep.Coordinator.buttonDidTrigger(_:)), for: .primaryActionTriggered)
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        context.coordinator.onTrigger = {
            openURL(URL(string: "https://www.apple.com")!)
        }
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator {
            openURL(URL(string: "https://www.apple.com")!)
        }
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

fileprivate struct MyView: View {
    var body: some View {
        MyViewRep()
            .onOpenURL(prefersInApp: true)
    }
}

final class OpenURLActionViewController: UIViewController {
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
