private import _SwiftUICorePrivate
@testable @_private(sourceFile: "_GraphInputs.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI

struct _GraphInputsPhaseTests {
    @Test func test_init() async throws {
        let impl = MySwiftUICore._GraphInputs.Phase()
        let original = SwiftUICore._GraphInputs.Phase()
        #expect(impl.value == original.value)
    }
    
    @Test func test_resetSeed_getter_setter() async throws {
        var impl = MySwiftUICore._GraphInputs.Phase()
        var original = SwiftUICore._GraphInputs.Phase()
        
        impl.resetSeed = 0x12345678
        original.resetSeed = 0x12345678
        #expect(impl.value == original.value)
        #expect(impl.resetSeed == original.resetSeed)
    }
    
    @Test func test_isInserted_and_isBeingRemoved() async throws {
        var impl = MySwiftUICore._GraphInputs.Phase()
        var original = SwiftUICore._GraphInputs.Phase()
        
        #expect(impl.isInserted == original.isInserted)
        #expect(impl.isBeingRemoved == original.isBeingRemoved)
        
        impl.isBeingRemoved = true
        original.isBeingRemoved = true
        #expect(impl.value == original.value)
        #expect(impl.isInserted == original.isInserted)
        #expect(impl.isBeingRemoved == original.isBeingRemoved)
        
        impl.isBeingRemoved = false
        original.isBeingRemoved = false
        #expect(impl.value == original.value)
        #expect(impl.isInserted == original.isInserted)
        #expect(impl.isBeingRemoved == original.isBeingRemoved)
    }
    
    @Test func test_merge_preservesLSB_and_wraps() async throws {
        var implA = MySwiftUICore._GraphInputs.Phase(value: 0xFFFF_FFFE)
        var implB = MySwiftUICore._GraphInputs.Phase(value: 0x0000_0005)
        
        var origA = SwiftUICore._GraphInputs.Phase(value: 0xFFFF_FFFE)
        var origB = SwiftUICore._GraphInputs.Phase(value: 0x0000_0005)
        
        implA.merge(implB)
        origA.merge(origB)
        
        #expect(implA.value == origA.value)
        #expect(implA.isInserted == origA.isInserted)
        #expect(implA.isBeingRemoved == origA.isBeingRemoved)
    }
    
    @Test func test_invalid_constant() async throws {
        let impl = MySwiftUICore._GraphInputs.Phase.invalid
        let original = SwiftUICore._GraphInputs.Phase.invalid
        #expect(impl.value == original.value)
        #expect(impl.isInserted == original.isInserted)
        #expect(impl.isBeingRemoved == original.isBeingRemoved)
        #expect(impl.resetSeed == original.resetSeed)
    }
    
    @Test func test_equatable() async throws {
        let a = MySwiftUICore._GraphInputs.Phase(value: 123)
        let b = MySwiftUICore._GraphInputs.Phase(value: 123)
        let c = MySwiftUICore._GraphInputs.Phase(value: 124)
        #expect(a == b)
        #expect(a != c)
    }
}

extension SwiftUICore._GraphInputs.Phase {
    fileprivate var value: UInt32 {
        Mirror(reflecting: self).descendant("value") as! UInt32
    }
}
