//
//  EnvironmentalModifierViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 9/14/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyEnvironmentalModifier : @MainActor EnvironmentalModifier {
    func resolve(in environment: EnvironmentValues) -> some ViewModifier {
        MyViewModifier(flag: environment.flag)
    }
}

fileprivate struct MyViewModifier : ViewModifier {
    let flag: Bool
    
    func body(content: Content) -> some View {
        VStack {
            content
            MyLabel(text: self.flag.description)
        }
    }
}

fileprivate struct MyEnvironmentKey : EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}

extension EnvironmentValues {
    fileprivate var flag: Bool {
        get {
            return self[MyEnvironmentKey.self]
        }
        set {
            self[MyEnvironmentKey.self] = newValue
        }
    }
}

fileprivate struct MyView : View {
    @State private var flag = false
    
    var body: some View {
        MyButton(title: "Toggle") {
            self.flag.toggle()
        }
            .modifier(MyEnvironmentalModifier())
            .environment(\.flag, self.flag)
    }
}

final class EnvironmentalModifierViewController : UIViewController {
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
