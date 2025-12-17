private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI

struct _ViewList_IteratorStyleTests {
    @Test func test_init() {
        for i in 0...1_000 {
            let impl = MySwiftUICore._ViewList_IteratorStyle(granularity: i)
            let original = _SwiftUICorePrivate._ViewList_IteratorStyle(granularity: i)
            #expect(impl.value == original.value)
        }
    }
    
    @Test func test_granularity() {
        var impl = MySwiftUICore._ViewList_IteratorStyle(granularity: 0)
        var original = _SwiftUICorePrivate._ViewList_IteratorStyle(granularity: 0)
        
        #expect(impl.granularity == original.granularity)
        #expect(impl.value == original.value)
        
        for i in 1...1_000 {
            impl.granularity = i
            original.granularity = i
            #expect(impl.granularity == original.granularity)
            #expect(impl.value == original.value)
        }
    }
    
    @Test func test_alignToNextGranularityMultiple() {
        for n in 1...100 {
            let impl = MySwiftUICore._ViewList_IteratorStyle(granularity: n)
            let original = _SwiftUICorePrivate._ViewList_IteratorStyle(granularity: n)
            
            for i in 0...100 {
                var i1 = i
                impl.alignToNextGranularityMultiple(&i1)
                
                var i2 = i
                original.alignToNextGranularityMultiple(&i2)
                
                #expect(i1 == i2)
            }
        }
    }
    
    @Test func test_alignToPreviousGranularityMultiple() {
        for n in 1...100 {
            let impl = MySwiftUICore._ViewList_IteratorStyle(granularity: n)
            let original = _SwiftUICorePrivate._ViewList_IteratorStyle(granularity: n)
            
            for i in 0...100 {
                var i1 = i
                impl.alignToPreviousGranularityMultiple(&i1)
                
                var i2 = i
                original.alignToPreviousGranularityMultiple(&i2)
                
                #expect(i1 == i2)
            }
        }
    }
    
    @Test func test_applyGranularity() {
        for i in 1...1_000 {
            var impl = MySwiftUICore._ViewList_IteratorStyle(granularity: i)
            var original = _SwiftUICorePrivate._ViewList_IteratorStyle(granularity: i)
            
            #expect(impl.applyGranularity == original.applyGranularity)
            
            impl.applyGranularity = true
            original.applyGranularity = true
            #expect(impl.applyGranularity == original.applyGranularity)
            #expect(impl.value == original.value)
            
            impl.applyGranularity = false
            original.applyGranularity = false
            #expect(impl.applyGranularity == original.applyGranularity)
            #expect(impl.value == original.value)
        }
    }
    
    @Test func test_applyGranularity2() {
        for i in 1...1_000 {
            let impl = MySwiftUICore._ViewList_IteratorStyle(granularity: i)
            let original = _SwiftUICorePrivate._ViewList_IteratorStyle(granularity: i)
            
            let a = impl.applyGranularity(to: i)
            let b = original.applyGranularity(to: i)
            
            #expect(a == b)
        }
    }
}

extension MySwiftUICore._ViewList_IteratorStyle {
    fileprivate var value: UInt {
        return unsafe unsafeBitCast(self, to: UInt.self)
    }
}

extension _SwiftUICorePrivate._ViewList_IteratorStyle {
    fileprivate var value: UInt {
        return unsafe unsafeBitCast(self, to: UInt.self)
    }
}
