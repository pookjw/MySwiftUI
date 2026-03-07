//
//  ColorTestViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 3/7/26.
//

import UIKit
import SwiftUI

fileprivate final class MyViewController: UIViewController {
    @ViewLoading private var label: UILabel
    @ViewLoading private var registration: any UITraitChangeRegistration
    
    override func loadView() {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
        label.textAlignment = .center
        self.label = label
        self.view = label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registration = registerForTraitChanges([UITraitUserInterfaceStyle.self], target: self, action: #selector(userInterfaceStyleDidChange(sender:previousTraitCollection:)))
        updateLabel()
    }
    
    @objc private func userInterfaceStyleDidChange(sender: MyViewController, previousTraitCollection: UITraitCollection) {
        updateLabel()
    }
    
    private func updateLabel() {
        let text = traitCollection.userInterfaceStyle == .dark ? "Dark" : "Light"
        self.label.text = text
    }
}

fileprivate struct MyViewControllerRep: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MyViewController {
        let viewController = MyViewController()
        viewController.overrideUserInterfaceStyle = .dark
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: MyViewController, context: Context) {
    }
}

fileprivate struct MyView: View {
    var flag: Bool
    
    var body: some View {
        MyViewControllerRep()
            .environment(\.colorScheme, flag ? .dark : .light)
    }
}

final class ColorSchemeTestViewController: UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    @ViewLoading private var toggleBarButtonItem: UIBarButtonItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView(flag: false))
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
        
        let toggleBarButtonItem = UIBarButtonItem(title: "Toggle", image: UIImage(systemName: "ant"), target: self, action: #selector(toggleBarButtonItemDidTrigger(_:)))
        self.toggleBarButtonItem = toggleBarButtonItem
        navigationItem.rightBarButtonItem = toggleBarButtonItem
    }
    
    @objc private func toggleBarButtonItemDidTrigger(_ sender: UIBarButtonItem) {
        hostingController.rootView.flag.toggle()
    }
}
