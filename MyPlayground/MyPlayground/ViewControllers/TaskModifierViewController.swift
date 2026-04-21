//
//  TaskModifierViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/21/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    @State private var array: [Int] = []
    @State private var key = UUID()
    
    var body: some View {
        _VStackLayout {
            MyButton(title: "Key") { 
                key = UUID()
            }
            
            ForEach(array, id: \.self) { value in
                value % 2 == 0 ? Color.black : Color.white
            }
        }
        .task {
            while true {
                do {
                    try await Task.sleep(for: .seconds(1))
                    
                    if array.count == 2 {
                        array = [0, 1, 2, 3]
                    } else {
                        array = [0, 1]
                    }
                } catch {
                    return
                }
            }
        }
//        .task(id: key) { 
//            array.removeAll()
//        }
    }
}

final class TaskModifierViewController : UIViewController {
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
