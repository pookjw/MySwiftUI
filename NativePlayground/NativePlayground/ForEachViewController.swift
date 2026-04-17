//
//  ForEachViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 4/12/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    var body: some View {
        ForEach(0..<5) { index in
            index % 2 == 0 ? Color.black : Color.white
        }
    }
    
//    @State private var list: [Int] = []
//    
//    var body: some View {
//        ForEach(list, id: \.self) { _ in
//            Color.clear
//        }
//        .task {
//            while true {
//                if list.isEmpty {
//                    list.insert(.random(in: 0..<100), at: 0)
//                } else {
//                    list.insert(.random(in: 0..<100), at: .random(in: 0..<list.count))
//                }
//                do {
//                    try await Task.sleep(for: .seconds(1))
//                } catch {
//                    return
//                }
//            }
//        }
//    }
}

final class ForEachViewController : UIViewController {
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
