//
//  ArrayForEachViewController.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 4/17/26.
//

import UIKit
import SwiftUI

fileprivate struct MyView : View {
    var array: [Int] = [0, 1]
    
    var body: some View {
        ForEach(array, id: \.self) { value in
            value % 2 == 0 ? Color.black : Color.white
        }
    }
}

final class ArrayForEachViewController : UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>
    private var task: Task<Void, Never>?
    
    deinit {
        task?.cancel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView(array: []))
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
        
        task?.cancel()
        task = Task { [hostingController] in
            while true {
                do {
                    try await Task.sleep(for: .seconds(1))
                    
                    if hostingController.rootView.array.count == 2 {
                        hostingController.rootView.array = [0, 1, 2, 3]
                    } else {
                        hostingController.rootView.array = [0, 1]
                    }
                } catch {
                    return
                }
            }
        }
    }
}
