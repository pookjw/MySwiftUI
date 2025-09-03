#warning("TODO")

struct UnsafeHeterogeneousBuffer {
    private var buf: UnsafeMutableRawPointer?
    private var available: Int32
    private var _count: Int32
    
    init() {
        self.buf = nil
        self.available = 0
        self._count = 0
    }
    
    func destory() {
        fatalError("TODO")
    }
    
    @discardableResult
    func append<T>(_ value: T, vtable: _UnsafeHeterogeneousBuffer_VTable.Type) -> UnsafeHeterogeneousBuffer.Index {
        // x8 = self
        // x0 = value
        // x1 = vtable
        // x2 = T type
        let bytes: UInt64 = UInt64(MemoryLayout<T>.size + 0x10 + 0xf) & 0xfffffffffffffff0
        let pointer = allocate(bytes: Int(bytes))
        
        fatalError("TODO")
    }
    
    private func allocate(bytes: Int) -> UnsafeMutableRawPointer {
        fatalError("TODO")
    }
    
    private func growBuffer(by bytes: Int, capacity: Int) {
        let total = (bytes + capacity)
        fatalError("TODO")
    }
    // TODO
}

extension UnsafeHeterogeneousBuffer {
    struct Index {
        private var index: Int32
        private var offset: Int32
    }
}

class _UnsafeHeterogeneousBuffer_VTable {
    class var type: Any.Type {
        fatalError() // abstract
    }
    
//    class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
//        fatalError() // abstract
//    }
//    
//    class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
//        fatalError() // abstract
//    }
}
