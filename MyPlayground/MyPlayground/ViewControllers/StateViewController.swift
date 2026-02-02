//
//  StateViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/2/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

fileprivate struct MyView: View {
    @State private var flag = false
    
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
                        flag.toggle()
                    }
                }
            
            Color.white
            
            Color.white
        }
    }
}

final class StateViewController: UIViewController {
    override func loadView() {
        let rootView = MyView()
        view = _UIHostingView(rootView: rootView)
    }
}
