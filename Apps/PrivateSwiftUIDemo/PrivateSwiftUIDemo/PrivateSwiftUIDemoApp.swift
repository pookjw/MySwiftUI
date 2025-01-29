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
        for _ in 0..<500 {
//            autoreleasepool {
                _ = Array<UInt8>(unsafeUninitializedCapacity: 100) { buffer, initializedCount in
//                    for value in buffer {
//                        assert(value == 0)
//                    }
                    let raw = UnsafeRawPointer(buffer.baseAddress!)
                    
                    for index in 0..<100 {
                        assert(raw.assumingMemoryBound(to: UInt8.self).advanced(by: index).pointee == 0)
                    }
                }
//            }
        }
//        print(MemoryLayout<StrongHash>.stride, MemoryLayout<StrongHash?>.stride)
//        let words: (UInt32, UInt32, UInt32, UInt32, UInt32) = (1, 2, 3, 4, .max)
//        let hash = unsafeBitCast(words, to: StrongHash.self)
////        print(ArchiveWriter.writerKey)
//        let writer = MyWriter()
//        
//        try! writer.addAttachment(hash: hash) { writer in
//            
//            
//        }
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
            for value in unsafeBitCast(buffer, to: UnsafeMutableBufferPointer<Value>.self) {
                print(value)
            }
        }
    }
}
