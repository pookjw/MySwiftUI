internal import Testing
@testable private import MySwiftUICore

struct UnsafeHeterogeneousBufferTests {
    @Test
    func test_destroyEmpty() {
        let buffer = UnsafeHeterogeneousBuffer()
        buffer.destroy()
    }
    
    @Test
    func test_spi() {
        var buffer = UnsafeHeterogeneousBuffer()
        
        #expect(buffer.isEmpty)
        #expect(buffer.count == 0)
        
        let counter_0 = Value.Counter()
        let index_0 = buffer.append(Value(number: 0, counter: counter_0), vtable: Value.VTable.self)
        #expect(!buffer.isEmpty)
        #expect(buffer.count == 1)
        
        #expect(buffer[index_0].body(as: Value.self).pointee.number == 0)
        #expect(buffer[index_0].body(as: Value.self).pointee.counter.moveInitialize == 0)
        #expect(buffer[index_0].body(as: Value.self).pointee.counter.deinitialize == 0)
        
        let counter_1 = Value.Counter()
        let index_1 = buffer.append(Value(number: 1, counter: counter_1), vtable: Value.VTable.self)
        #expect(!buffer.isEmpty)
        #expect(buffer.count == 2)
        
        #expect(buffer[index_0].body(as: Value.self).pointee.number == 0)
        #expect(buffer[index_0].body(as: Value.self).pointee.counter.moveInitialize == 1)
        #expect(buffer[index_0].body(as: Value.self).pointee.counter.deinitialize == 0)
        
        #expect(buffer[index_1].body(as: Value.self).pointee.number == 1)
        #expect(buffer[index_1].body(as: Value.self).pointee.counter.moveInitialize == 0)
        #expect(buffer[index_1].body(as: Value.self).pointee.counter.deinitialize == 0)
        
        var index_3 = index_0
        buffer.formIndex(after: &index_3)
        #expect(index_1 == index_3)
        
        #expect(index_0 == buffer.startIndex)
        
        var index_4 = index_1
        buffer.formIndex(after: &index_4)
        #expect(index_4 == buffer.endIndex)
        
        #expect(buffer.index(after: index_0) == index_1)
        #expect(buffer.index(after: index_1) == buffer.endIndex)
        
        buffer.destroy()
        #expect(counter_0.deinitialize == 1)
        #expect(counter_1.deinitialize == 1)
    }
    
    @Test(arguments: [10, 50, 300, 5_000])
    func test_loop(count: Int) {
        var buffer = UnsafeHeterogeneousBuffer()
        
        var indices: [UnsafeHeterogeneousBuffer.Index] = []
        indices.reserveCapacity(count)
        for i in 0..<count {
            let index = buffer.append(i, vtable: IntVTable.self)
            indices.append(index)
        }
        
        for (i, index) in indices.enumerated() {
            #expect(buffer[index].body(as: Int.self).pointee == i)
        }
        
        buffer.destroy()
    }
}

fileprivate struct Value {
    let number: Int
    let counter: Counter
    // move 시키기 위함
    private let extra: (Int128, Int128, Int128, Int128, Int128, Int128, Int128, Int128) = (0, 0, 0, 0, 0, 0, 0, 0)
    
    class Counter {
        var moveInitialize = 0
        var deinitialize = 0
    }
    
    fileprivate final class VTable: _UnsafeHeterogeneousBuffer_VTable {
        override class var type: any Any.Type {
            return Int.self
        }
        
        override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
            elt.body(as: Value.self).initialize(to: from.body(as: Value.self).pointee)
            elt.body(as: Value.self).pointee.counter.moveInitialize += 1
        }
        
        override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
            elt.body(as: Value.self).pointee.counter.deinitialize += 1
        }
    }
}

fileprivate final class IntVTable: _UnsafeHeterogeneousBuffer_VTable {
    override class var type: any Any.Type {
        return Int.self
    }
    
    override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
        elt.body(as: Int.self).initialize(to: from.body(as: Int.self).pointee)
    }
    
    override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
        // nop
    }
}
