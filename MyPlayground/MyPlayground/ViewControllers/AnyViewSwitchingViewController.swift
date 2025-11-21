//
//  AnyViewSwitchingViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/21/25.
//

import UIKit
import MySwiftUI

final class AnyViewSwitchingViewController: UIViewController {
    private var task: Task<Void, Never>?
    
    private var hostingView: _UIHostingView<AnyView> {
        view as! _UIHostingView<AnyView>
    }
    
    deinit {
        task?.cancel()
    }
    
    override func loadView() {
        view = _UIHostingView(rootView: AnyView(Color.black))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        task = Task { [hostingView] in
            var flags = 0
            
            while true {
                do {
                    try await Task.sleep(for: .seconds(1))
                    let value = flags % 3
                    
                    if value == 0 {
                        hostingView.rootView = AnyView(Color.white)
                    } else if value == 1 {
                        hostingView.rootView = AnyView(EmptyView())
                    } else if value == 2 {
                        hostingView.rootView = AnyView(Color.black)
                    }
                    
                    flags &+= 1
                } catch {
                    return
                }
            }
        }
    }
}
