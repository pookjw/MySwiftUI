//
//  SwitchingColorsViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/21/25.
//

import UIKit
import MySwiftUI

final class SwitchingColorsViewController: UIViewController {
    private var task: Task<Void, Never>?
    
    private var hostingView: _UIHostingView<Color> {
        view as! _UIHostingView<Color>
    }
    
    deinit {
        task?.cancel()
    }
    
    override func loadView() {
        view = _UIHostingView(rootView: Color.white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        task = Task { [hostingView] in
            var flag = true
            
            while true {
                do {
                    try await Task.sleep(for: .seconds(1))
                    
                    if flag {
                        hostingView.rootView = .black
                    } else {
                        hostingView.rootView = .white
                    }
                    
                    flag.toggle()
                } catch {
                    return
                }
            }
        }
    }
}
