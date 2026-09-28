//
//  PresentationModeViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 9/28/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView : View {
    @State private var isPresented = false
    
    var body: some View {
        MyButton(title: "Present") {
            self.isPresented = true
        }
        .sheet(isPresented: self.$isPresented) {
            ChildView()
        }
        .onAppear {
            self.isPresented = true
        }
    }
}

fileprivate struct ChildView : View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        MyButton(title: "Dismiss") { 
            self.presentationMode.wrappedValue.dismiss()
        }
        .task {
            do {
                try await Task.sleep(for: .seconds(1))
                self.presentationMode.wrappedValue.dismiss()
            } catch {}
        }
    }
}

final class PresentationModeViewController : UIViewController {
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
