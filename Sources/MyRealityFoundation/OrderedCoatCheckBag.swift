// 0656128EEB3DF59F097DD6F4D641F2F1

struct OrderedCoatCheckBag<T> : Sequence, CustomDebugStringConvertible {
    private var _ref: _OrderedCoatCheckBagRef<T>? = nil
    
    fileprivate mutating func _checkForSharedOwnership() {
        if self._ref == nil {
            self._ref = _OrderedCoatCheckBagRef<T>()
        } else if !isKnownUniquelyReferenced(&self._ref!) {
            assertionFailure("Attempting to form more than one copy of a bag. These should be held by at most one reference type.")
        }
    }
    
    mutating func append(_ element: T) -> OrderedCoatCheckBag<T>.Ticket {
        self._checkForSharedOwnership()
        return self._ref!.append(element)
    }
    
    @discardableResult
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
        fileprivate private(set) var _key: Int
        fileprivate private(set) var _ptr: UnsafeRawPointer
        
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
        if let _storage {
            storage = _storage
        } else {
            storage = ContiguousArray()
            self._storage = storage
        }
        
        storage.append((key: ticket, element: element))
        self._storage = storage
        self._nextKey += 1
        
        return ticket
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
