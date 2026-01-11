@unsafe struct UnsafeMutableBufferProjectionPointer<T, U>: @unsafe RandomAccessCollection, MutableCollection {
    private let _start: UnsafeMutableRawPointer
    let endIndex: Int
    
    var startIndex: Int {
        return 0
    }
    
    init() {
        unsafe self.init(start: .null, count: 0)
    }
    
    init(start: UnsafeMutablePointer<U>, count: Int) {
        unsafe self._start = UnsafeMutableRawPointer(start)
        unsafe self.endIndex = count
    }
    
    init(_ base: UnsafeMutableBufferPointer<T>, _ keyPath: WritableKeyPath<T, U>) {
        if base.isEmpty {
            unsafe self.init()
        } else {
            unsafe self.init(
                start: base.baseAddress.unsafelyUnwrapped.pointer(to: keyPath).unsafelyUnwrapped,
                count: base.count
            )
        }
    }
    
    subscript(_ index: Int) -> U {
        unsafeAddress {
            let pointer = unsafe _start
                .advanced(by: MemoryLayout<T>.stride * index)
                .assumingMemoryBound(to: U.self)
            return unsafe UnsafePointer<U>(pointer)
        }
        unsafeMutableAddress {
            return unsafe _start
                .advanced(by: MemoryLayout<T>.stride * index)
                .assumingMemoryBound(to: U.self)
        }
    }
}
