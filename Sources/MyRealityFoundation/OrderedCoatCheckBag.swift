// 0656128EEB3DF59F097DD6F4D641F2F1

@safe struct OrderedCoatCheckBag<T> : Sequence, CustomDebugStringConvertible {
    private var _ref: _OrderedCoatCheckBagRef<T>? = nil
    
    fileprivate mutating func _checkForSharedOwnership() {
        if unsafe self._ref == nil {
            unsafe self._ref = _OrderedCoatCheckBagRef<T>()
        } else if unsafe !isKnownUniquelyReferenced(&self._ref!) {
            assertionFailure("Attempting to form more than one copy of a bag. These should be held by at most one reference type.")
        }
    }
    
    mutating func append(_ element: T) -> OrderedCoatCheckBag<T>.Ticket {
        self._checkForSharedOwnership()
        return unsafe self._ref!.append(element)
    }
    
    @discardableResult
    mutating func remove(_ ticket: OrderedCoatCheckBag<T>.Ticket) -> T? {
        self._checkForSharedOwnership()
        return unsafe self._ref!.remove(ticket)
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
    
    func makeIterator() -> AnyIterator<T> {
        assertUnimplemented()
    }
}

extension OrderedCoatCheckBag {
    @unsafe struct Ticket : Hashable {
        fileprivate private(set) var _key: Int
        fileprivate private(set) var _ptr: UnsafeRawPointer
        
        func hash(into hasher: inout Hasher) {
            unsafe hasher.combine(UInt(bitPattern: self._ptr))
        }
    }
}

@unsafe fileprivate final class _OrderedCoatCheckBagRef<T> : @unsafe Sequence, CustomDebugStringConvertible {
    private var _storage: ContiguousArray<(key: OrderedCoatCheckBag<T>.Ticket, element: T)>?
    private var _nextKey: Int
    
    init() {
        unsafe self._storage = nil
        unsafe self._nextKey = 0
    }
    
    func asPointer() -> UnsafeRawPointer {
        return unsafe UnsafeRawPointer(Unmanaged.passUnretained(self).toOpaque())
    }
    
    func append(_ element: T) -> OrderedCoatCheckBag<T>.Ticket {
        /*
         self -> x20 -> x19
         element -> x0 -> x26
         T -> x20
         */
        let ticket = unsafe OrderedCoatCheckBag<T>.Ticket.init(
            _key: self._nextKey,
            _ptr: UnsafeRawPointer(Unmanaged.passUnretained(self).toOpaque())
        )
        
        var storage: ContiguousArray<(key: OrderedCoatCheckBag<T>.Ticket, element: T)>
        if let _storage = unsafe self._storage {
            unsafe storage = _storage
        } else {
            unsafe storage = ContiguousArray()
            unsafe self._storage = storage
        }
        
        unsafe storage.append((key: ticket, element: element))
        unsafe self._storage = storage
        unsafe self._nextKey += 1
        
        return unsafe ticket
    }
    
    func remove(_ ticket: OrderedCoatCheckBag<T>.Ticket) -> T? {
        /*
         self -> x20
         ticket._key -> x0 -> x29 - 0xe0
         ticket._ptr -> x1 -> x19
         */
        // <+376>
        guard unsafe ticket._ptr == Unmanaged.passUnretained(self).toOpaque() else {
            // <+1116>
            assertionFailure("Attempting to remove an element from the wrong bag.  This is a serious error.")
        }
        
        
        assertUnimplemented()
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
    
    func makeIterator() -> AnyIterator<T> {
        assertUnimplemented()
    }
}
