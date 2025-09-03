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
    
    func append<T>(_ value: T, vtable: _UnsafeHeterogeneousBuffer_VTable.Type) -> UnsafeHeterogeneousBuffer.Index {
        // x8 = self
        // x0 = value
        // x1 = vtable
        // x2 = T type
        
        allocate(bytes: MemoryLayout<T>.size)
        fatalError("TODO")
    }
    
    private func allocate(bytes: Int) -> UnsafeMutableRawPointer {
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
    init() {
        // nop
    }
    
    deinit {
        // nop
    }
    
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
