// 0656128EEB3DF59F097DD6F4D641F2F1

struct OrderedCoatCheckBag<T> : Sequence, CustomDebugStringConvertible {
    private var _ref: _OrderedCoatCheckBagRef<T>? = nil
    
    fileprivate func _checkForSharedOwnership() {
        assertUnimplemented()
    }
    
    func append(_ element: T) -> OrderedCoatCheckBag<T>.Ticket {
        assertUnimplemented()
    }
    
    func remove(_ ticket: OrderedCoatCheckBag<T>.Ticket) -> T? {
        assertUnimplemented()
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
    
    func makeIterator() -> AnyIterator<T> {
        assertUnimplemented()
    }
}

extension OrderedCoatCheckBag {
    @safe struct Ticket : Hashable {
        private var _key: Int
        private var _ptr: UnsafeRawPointer
        
        func hash(into hasher: inout Hasher) {
            unsafe hasher.combine(UInt(bitPattern: self._ptr))
        }
    }
}

fileprivate final class _OrderedCoatCheckBagRef<T> : Sequence, CustomDebugStringConvertible {
    private var _storage: ContiguousArray<(key: OrderedCoatCheckBag<T>.Ticket, element: T)>?
    private var _nextKey: Int
    
    init() {
        self._storage = nil
        self._nextKey = 0
    }
    
    func asPointer() -> UnsafeRawPointer {
        return unsafe UnsafeRawPointer(Unmanaged.passUnretained(self).toOpaque())
    }
    
    func append(_ element: T) -> OrderedCoatCheckBag<T>.Ticket {
        assertUnimplemented()
    }
    
    func remove(_ ticket: OrderedCoatCheckBag<T>.Ticket) -> T? {
        assertUnimplemented()
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
    
    func makeIterator() -> AnyIterator<T> {
        assertUnimplemented()
    }
}
