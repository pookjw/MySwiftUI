private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI

struct StackTests {
    @Test func test_init() {
        let impl = MySwiftUICore.Stack<Int>()
        let original = _SwiftUICorePrivate.Stack<Int>()
        #expect(unsafeBitCast(impl, to: Int.self) == unsafeBitCast(original, to: Int.self))
    }
    
    @Test func test_isEmpty() {
        do {
            let impl = MySwiftUICore.Stack<Int>()
            let original = _SwiftUICorePrivate.Stack<Int>()
            
            #expect(impl.isEmpty)
            #expect(original.isEmpty)
        }
        
        do {
            var impl = MySwiftUICore.Stack<Int>()
            impl.push(3)
            
            var original = _SwiftUICorePrivate.Stack<Int>()
            original.push(3)
            
            #expect(!impl.isEmpty)
            #expect(!original.isEmpty)
        }
    }
    
    @Test func test_top() {
        do {
            let impl = MySwiftUICore.Stack<Int>()
            #expect(impl.top == nil)
            
            let original = _SwiftUICorePrivate.Stack<Int>()
            #expect(original.top == nil)
        }
        
        do {
            var impl = MySwiftUICore.Stack<Int>()
            impl.push(3)
            impl.push(4)
            #expect(impl.top == 4)
            
            var original = _SwiftUICorePrivate.Stack<Int>()
            original.push(3)
            original.push(4)
            #expect(original.top == 4)
        }
    }
    
    @Test func test_count() {
        var impl = MySwiftUICore.Stack<Int>()
        var original = _SwiftUICorePrivate.Stack<Int>()
        
        #expect(impl.count == 0)
        #expect(original.count == 0)
        
        for i in 1...100 {
            impl.push(i)
            #expect(impl.count == i)
            
            original.push(i)
            #expect(original.count == i)
        }
        
        
        for i in (0..<100).reversed() {
            impl.pop()
            #expect(impl.count == i)
            
            original.pop()
            #expect(original.count == i)
        }
    }
    
    @Test func test_next() {
        do {
            var impl = MySwiftUICore.Stack<Int>()
            #expect(impl.next() == nil)
            
            var original = _SwiftUICorePrivate.Stack<Int>()
            #expect(original.next() == nil)
        }
        
        do {
            var impl = MySwiftUICore.Stack<Int>()
            impl.push(3)
            impl.push(4)
            #expect(impl.next() == 4)
            #expect(impl.next() == 3)
            #expect(impl.next() == nil)
            
            var original = _SwiftUICorePrivate.Stack<Int>()
            original.push(3)
            original.push(4)
            #expect(original.next() == 4)
            #expect(original.next() == 3)
            #expect(original.next() == nil)
        }
    }
    
    @Test func test_push() {
        var impl = MySwiftUICore.Stack<Int>()
        var original = _SwiftUICorePrivate.Stack<Int>()
        
        impl.push(3)
        original.push(3)
        
        let test_1: Bool
        if case .node(let value, let next) = impl {
            if case .empty = next {
                test_1 = (value == 3)
            } else {
                test_1 = false
            }
        } else {
            test_1 = false
        }
        
        let test_2: Bool
        if case .node(let value, let next) = original {
            if case .empty = next {
                test_2 = (value == 3)
            } else {
                test_2 = false
            }
        } else {
            test_2 = false
        }
        
        #expect(test_1)
        #expect(test_2)
    }
    
    @Test func test_pop() {
        do {
            var impl = MySwiftUICore.Stack<Int>()
            #expect(impl.pop() == nil)
            
            var original = _SwiftUICorePrivate.Stack<Int>()
            #expect(original.pop() == nil)
        }
        
        do {
            var impl = MySwiftUICore.Stack<Int>()
            impl.push(3)
            impl.push(4)
            #expect(impl.pop() == 4)
            #expect(impl.pop() == 3)
            #expect(impl.pop() == nil)
            
            var original = _SwiftUICorePrivate.Stack<Int>()
            original.push(3)
            original.push(4)
            #expect(original.pop() == 4)
            #expect(original.pop() == 3)
            #expect(original.pop() == nil)
        }
    }
    
    @Test func test_popAll() {
        var impl = MySwiftUICore.Stack<Int>()
        var original = _SwiftUICorePrivate.Stack<Int>()
        
        impl.push(3)
        original.push(3)
        
        impl.popAll()
        original.popAll()
        
        #expect(impl.isEmpty)
        #expect(original.isEmpty)
    }
    
    @Test func test_map() {
        var impl = MySwiftUICore.Stack<Int>()
        var original = _SwiftUICorePrivate.Stack<Int>()
        
        for i in 0..<100 {
            impl.push(i)
            original.push(i)
        }
        
        let result_1 = impl.map { String($0) }
        let result_2 = original.map { String($0) }
        
        var i = 99
        for element in result_1 {
            #expect(element == String(i))
            i &-= 1
        }
        
        i = 99
        for element in result_2 {
            #expect(element == String(i))
            i &-= 1
        }
    }
}
