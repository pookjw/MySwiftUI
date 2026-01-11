private import _SwiftUICorePrivate
@testable @_private(sourceFile: "UnsafeMutableBufferProjectionPointer.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI

fileprivate struct UnsafeMutableBufferProjectionPointerTests {
    @Test func test_init() {
        let impl = MySwiftUICore.UnsafeMutableBufferProjectionPointer<MyBase, UInt8>()
        let original = _SwiftUICorePrivate.UnsafeMutableBufferProjectionPointer<MyBase, UInt8>()
        
        #expect(impl._start == original._start)
        #expect(impl.endIndex == original.endIndex)
    }
    
    @Test func test_init_start_count() {
        var values = [MyBase(), MyBase(), MyBase()]
        values.withUnsafeMutableBufferPointer { pointer in
            let impl = MySwiftUICore.UnsafeMutableBufferProjectionPointer<MyBase, MyBase>(
                start: pointer.baseAddress!,
                count: pointer.count
            )
            let original = _SwiftUICorePrivate.UnsafeMutableBufferProjectionPointer<MyBase, MyBase>(
                start: pointer.baseAddress!,
                count: pointer.count
            )
            
            #expect(impl._start == original._start)
            #expect(impl.endIndex == original.endIndex)
        }
    }
    
    @Test func test_init_base_keyPath() {
        var values = [MyBase(m: 0), MyBase(m: 1), MyBase(m: 2)]
        values.withUnsafeMutableBufferPointer { pointer in
            let impl = MySwiftUICore.UnsafeMutableBufferProjectionPointer<MyBase, UInt8>(
                pointer,
                \.i2
            )
            
            let original = _SwiftUICorePrivate.UnsafeMutableBufferProjectionPointer<MyBase, UInt8>(
                pointer,
                \.i2
            )
            
            #expect(impl[0] == original[0])
            #expect(impl[1] == original[1])
            #expect(impl[2] == original[2])
        }
    }
}

extension _SwiftUICorePrivate.UnsafeMutableBufferProjectionPointer {
    fileprivate var _start: UnsafeMutableRawPointer {
        return unsafe Mirror(reflecting: self).descendant("_start") as! UnsafeMutableRawPointer
    }
}

fileprivate struct MyBase {
    var i1: UInt8
    var i2: UInt8
    var i3: UInt8
    
    init() {
        i1 = 1
        i2 = 2
        i3 = 3
    }
    
    init(m: UInt8) {
        i1 = 1 + m * 3
        i2 = 2 + m * 3
        i3 = 3 + m * 3
    }
}
