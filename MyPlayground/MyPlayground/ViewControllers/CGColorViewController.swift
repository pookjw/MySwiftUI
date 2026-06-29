//
//  CGColorViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 6/29/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @Environment(\.self) private var env
    @State private var a: CGFloat = 1
    @State private var b: CGFloat = 0
    @State private var c: CGFloat = 0
    
    var body: some View {
        HStack {
            Color(cgColor: CGColor(red: a, green: b, blue: c, alpha: 1))
            Color(cgColor: CGColor(red: b, green: c, blue: a, alpha: 1))
            Color(cgColor: CGColor(red: c, green: a, blue: b, alpha: 1))
        }
        .task {
            do {
                while true {
                    try await Task.sleep(for: .seconds(1))
                    
                    if a == 1 {
                        a = 0
                        b = 1
                        c = 0
                    } else if b == 1 {
                        a = 0
                        b = 0
                        c = 1
                    } else {
                        a = 1
                        b = 0
                        c = 0
                    }
                }
                
                let cgColor = CGColor(red: c, green: a, blue: b, alpha: 1)
                let resolved = Color(cgColor: cgColor).resolve(in: env)
                assert(resolved.cgColor == cgColor)
            } catch {}
        }
    }
}

final class CGColorViewController : UIViewController {
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
