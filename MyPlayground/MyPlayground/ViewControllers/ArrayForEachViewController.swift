//
//  ArrayForEachViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/17/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView : View {
    var array: [Int]
    
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
            while hostingController.rootView.array.count < 5 {
                do {
                    hostingController.rootView.array.append(hostingController.rootView.array.count)
                    try await Task.sleep(for: .seconds(1))
                } catch {
                    return
                }
            }
        }
    }
}
