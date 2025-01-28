//
//  ContentView.swift
//  PrivateSwiftUIDemo
//
//  Created by Jinwoo Kim on 1/27/25.
//

import SwiftUI
import SwiftUICore

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
            let url = Bundle.main.url(forResource: "archived_view_0", withExtension: nil)!
            
            let fileHandle = FileHandle(forUpdatingAtPath: url.path()).unsafelyUnwrapped
            
            let reader: ArchiveReader = try! FileArchiveReader.init(file: fileHandle)
            
//            for child in Mirror(reflecting: reader).children {
//                print(child)
//            }
            
            var total = 0
            reader
                .forEach { data in
                    print(data)
                    total += data.count
                }
            
            print(total)
        }
    }
}

#Preview {
    ContentView()
}
