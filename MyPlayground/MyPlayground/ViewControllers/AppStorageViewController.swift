//
//  AppStorageViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/4/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: View {
    @AppStorage("flag", store: .standard) private var flag: Bool = false
    
    var body: some View {
        if flag {
            Color.black
        } else {
            Color.white
        }
        
        MyChildView(flag: $flag)
    }
}

fileprivate struct MyChildView: View {
    @Binding var flag: Bool
    @AppStorage("flag", store: .standard) private var flag2: Bool = false
    
    var body: some View {
        if flag {
            Color.black
                .onAppear { 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        flag.toggle()
                    }
                }
        } else {
            Color.white
                .onAppear { 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        flag2.toggle()
                    }
                }
        }
    }
}

final class AppStorageViewController: UIViewController {
    @ViewLoading private var toggleBarButtonItem: UIBarButtonItem
    
    override func loadView() {
        let rootView = MyView()
        view = _UIHostingView(rootView: rootView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toggleBarButtonItem = UIBarButtonItem(title: "Toggle", image: UIImage(systemName: "ant.fill"), target: self, action: #selector(toggleBarButtonItemDidTrigger(_:)))
        self.toggleBarButtonItem = toggleBarButtonItem
        navigationItem.rightBarButtonItem = toggleBarButtonItem
    }
    
    @objc private func toggleBarButtonItemDidTrigger(_ sender: UIBarButtonItem) {
        let value = UserDefaults.standard.bool(forKey: "flag")
        UserDefaults.standard.set(!value, forKey: "flag")
    }
}
