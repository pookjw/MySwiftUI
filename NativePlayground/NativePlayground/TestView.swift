//
//  TestView.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 9/20/25.
//

import SwiftUI

@Observable
final class ViewModel {
    var counter = 0
}

struct TestView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        let _ = viewModel.counter
        
        Color.clear
            .onAppear { 
                DispatchQueue.main.async {
                    viewModel.counter += 1
                }
            }
    }
}
