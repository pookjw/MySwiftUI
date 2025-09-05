internal import Testing
@testable private import MySwiftUICore

struct UnsafeHeterogeneousBufferTests {
    @Test
    func test_destroyEmpty() {
        let buffer = UnsafeHeterogeneousBuffer()
        buffer.destroy()
    }
    
    @Test
    func test() {
        var buffer = UnsafeHeterogeneousBuffer()
        defer {
            buffer.destroy()
        }
        
        #expect(buffer.isEmpty)
        #expect(buffer.count == 0)
        
        let counter = Value.Counter()
        
        let index_0 = buffer.append(Value(number: 0, counter: counter), vtable: VTable.self)
        #expect(!buffer.isEmpty)
        #expect(buffer.count == 1)
        #expect(buffer[index_0].body(as: Value.self).pointee.number == 0)
        #expect(buffer[index_0].body(as: Value.self).pointee.counter.moveInitialize == 0)
        #expect(buffer[index_0].body(as: Value.self).pointee.counter.deinitialize == 0)
        
        let index_1 = buffer.append(1, vtable: VTable.self)
        #expect(!buffer.isEmpty)
        #expect(buffer.count == 2)
        #expect(buffer[index_1].body(as: Value.self).pointee.number == 1)
        
        var index_3 = index_0
        buffer.formIndex(after: &index_3)
        #expect(index_1 == index_3)
        
        #expect(index_0 == buffer.startIndex)
        
        var index_4 = index_1
        buffer.formIndex(after: &index_4)
        #expect(index_4 == buffer.endIndex)
        
        #expect(buffer.index(after: index_0) == index_1)
        #expect(buffer.index(after: index_1) == buffer.endIndex)
    }
}

fileprivate struct Value {
    let number: Int
    let counter: Counter
    
    class Counter {
        var moveInitialize = 0
        var deinitialize = 0
    }
}

fileprivate final class VTable: _UnsafeHeterogeneousBuffer_VTable {
    override class var type: any Any.Type {
        return Int.self
    }
    
    override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
        elt.body(as: Value.self).pointee.counter.moveInitialize += 1
    }
    
    override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
        elt.body(as: Value.self).pointee.counter.deinitialize += 1
    }
}
