//
//  PrivateSwiftUIDemoApp.swift
//  PrivateSwiftUIDemo
//
//  Created by Jinwoo Kim on 1/27/25.
//

import SwiftUI
import SwiftUICore
import os

@main
struct PrivateSwiftUIDemoApp: App {
    init() {
        Array<UInt8>.init(unsafeUninitializedCapacity: 16) { buffer, initializedCount in
//                initializedCount = 5
//            buffer.baseAddress.unsafelyUnwrapped.initialize(to: 5)
            initializedCount = 5
            print(initializedCount)
        }
        let words: (UInt32, UInt32, UInt32, UInt32, UInt32) = (3, 3, 3, 3, 3)
        let hash = unsafeBitCast(words, to: StrongHash.self)
        print(ArchiveWriter.writerKey)
        let writer = MyWriter()
        try! writer.addAttachment(hash: hash) { writer in
            
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


final class MyWriter: ArchiveWriter {
    override init() {
        super.init()
    }
    
    override func append<Value>(_ buffer: UnsafeBufferPointer<Value>) throws {
//        unsafeBitCast(buffer, to: UnsafeMutableBufferPointer<Value>.self).]
        if Value.self == UInt8.self {
            
            unsafeBitCast(buffer, to: UnsafeMutableBufferPointer<UInt8>.self).baseAddress.unsafelyUnwrapped.initialize(to: 3)
//            UnsafeMutableBufferPointer.init(mutating: buffer).baseAddress.unsafelyUnwrapped.initialize(to: 3)
        }
    }
}
