//
//  ContentView.swift
//  PrivateSwiftUIDemo
//
//  Created by Jinwoo Kim on 1/27/25.
//

import SwiftUI
@_private(sourceFile: "ArchiveData.swift") import SwiftUICore

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            BloomFilter()
            
            ArchiveReader.readerKey
            
            try! ArchiveReader.init(buffer: .init(_empty: ()))
        }
    }
}

#Preview {
    ContentView()
}
