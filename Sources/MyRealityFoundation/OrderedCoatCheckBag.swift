// 0656128EEB3DF59F097DD6F4D641F2F1

struct OrderedCoatCheckBag<T> {
    private var _ref: _OrderedCoatCheckBagRef<T>?
    
    // TODO
}

extension OrderedCoatCheckBag {
    struct Ticket {
        private var _key: Int
        private var _ptr: UnsafeRawPointer
        
        // TODO
    }
}

fileprivate final class _OrderedCoatCheckBagRef<T> {
    private var _storage: ContiguousArray<(key: OrderedCoatCheckBag<T>.Ticket, element: T)>?
    private var _nextKey: Int
    
    init() {
        assertUnimplemented()
    }
    
    // TODO
}
