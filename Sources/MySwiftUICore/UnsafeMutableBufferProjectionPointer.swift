@unsafe struct UnsafeMutableBufferProjectionPointer<T, U> : @unsafe RandomAccessCollection, @unsafe BidirectionalCollection, MutableCollection {
    private let _start: UnsafeMutableRawPointer
    let endIndex: Int
    
    var startIndex: Int {
        return 0
    }
    
    func index(before i: Int) -> Int {
        assertUnimplemented()
    }
    
    func index(after i: Int) -> Int {
        assertUnimplemented()
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
            let start = unsafe withUnsafeMutablePointer(to: &base.baseAddress.unsafelyUnwrapped.pointee[keyPath: keyPath]) { pointer in
                unsafe pointer
            }
            
            unsafe self.init(
                start: start,
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
