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
        print(MemoryLayout<StrongHash>.stride, MemoryLayout<StrongHash?>.stride)
        let words: (UInt32, UInt32, UInt32, UInt32, UInt32) = (1, 2, 3, 4, .max)
        let hash = unsafeBitCast(words, to: StrongHash.self)
//        print(ArchiveWriter.writerKey)
        let writer = MyWriter()
        
//        UnsafeMutableRawPointer(Unmanaged.passUnretained(writer).toOpaque())
//            .advanced(by: 0x28)
//            .assumingMemoryBound(to: UInt.self)
//            .pointee = 3
//        
//        for child in Mirror(reflecting: writer).children {
//            print(child)
//        }
        
        try! writer.addAttachment(hash: nil) { writer in
            
            
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
            for value in unsafeBitCast(buffer, to: UnsafeMutableBufferPointer<Value>.self) {
                print(value)
            }
        }
    }
}
