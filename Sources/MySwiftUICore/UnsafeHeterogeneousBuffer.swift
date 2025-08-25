struct UnsafeHeterogeneousBuffer {
    private var buf: UnsafeMutableRawPointer?
    private var available: Int32
    private var _count: Int32
    
    init() {
        self.buf = nil
        self.available = 0
        self._count = 0
    }
}
