//
//  SheetViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 9/13/26.
//

import UIKit
import MySwiftUI

fileprivate struct ItemID : Identifiable {
    let id: UUID
}

fileprivate struct MyView : View {
    @State private var isPresented = false
    @State private var item: ItemID?
    
    var body: some View {
        VStack {
            MyButton(title: "Present") {
                self.isPresented = true
            }
            
            MyButton(title: "Present with item") {
                self.item = ItemID(id: UUID())
            }
        }
        .sheet(
            isPresented: self.$isPresented,
            onDismiss: {
                print("onDismiss")
            }
        ) {
            MyButton(title: "Dismiss") {
                self.isPresented = false
            }
            .task {
                do {
                    try await Task.sleep(for: .seconds(1))
                    self.isPresented = false
                } catch {}
            }
        }
//        .sheet(
//            item: self.$item,
//            onDismiss: {
//                print("onDismiss")
//            }
//        ) { item in
//            MyButton(title: "Dismiss") {
//                self.item = nil
//            }
//            .task {
//                do {
//                    try await Task.sleep(for: .seconds(1))
//                    self.item = nil
//                } catch {}
//            }
//        }
        .task {
            self.isPresented = true
//            self.item = ItemID(id: UUID())
        }
    }
}

final class SheetViewController : UIViewController {
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
