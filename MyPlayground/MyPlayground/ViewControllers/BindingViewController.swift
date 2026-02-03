//
//  BindingViewController.swift
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
            
            MyChildView(
                flag: Binding(
                    get: {
                        return flag
                    },
                    set: { newValue in
                        flag = newValue
                    }
                )
            )
        } else {
            Color.white
            
            Color.white
            
            MyChildView(flag: $flag)
        }
        
        MyConstantView(flag: .constant(true))
    }
}

fileprivate struct MyChildView: View {
    @Binding var flag: Bool
    
    var body: some View {
        Color.white
            .onAppear { 
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    flag.toggle()
                }
            }
    }
}

fileprivate struct MyConstantView: View {
    @Binding var flag: Bool
    
    var body: some View {
        if flag {
            Color.black
        } else {
            Color.white
        }
    }
}

final class BindingViewController: UIViewController {
    override func loadView() {
        let rootView = MyView()
        view = _UIHostingView(rootView: rootView)
    }
}
