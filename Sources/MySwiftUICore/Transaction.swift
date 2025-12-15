// B2543BCA257433E04979186A1DC2B6BC

#warning("TODO")
private import _MySwiftUIShims
internal import AttributeGraph

public struct Transaction {
    static fileprivate(set) var current: Transaction {
        get {
            guard let transactionData = _threadTransactionData() else {
                return Transaction()
            }
            
            let data = unsafe Unmanaged<AnyObject>.fromOpaque(transactionData).takeUnretainedValue()
            return Transaction(plist: PropertyList(data: data))
        }
        set {
            // 원래 없음
            if let newValue = newValue.plist.data {
                unsafe _setThreadTransactionData(Unmanaged.passUnretained(newValue).toOpaque())
            } else {
                _setThreadTransactionData(nil)
            }
        }
    }
    
    static var id: Transaction.ID {
        return Transaction.ID(value: _threadTransactionID(false))
    }
    
    var isEmpty: Bool {
        return plist.isEmpty
    }
    
    @usableFromInline
    package var plist: PropertyList
    
    @inlinable
    public init() {
        self.plist = PropertyList()
    }
    
    @inlinable
    package init(plist: PropertyList) {
        self.plist = plist
    }
    
    package init(animation: Animation?) {
        fatalError("TODO")
    }
    
    public subscript<K: TransactionKey>(key: K.Type) -> K.Value {
        get {
            return plist[TransactionPropertyKey<K>.self]
        }
        set {
            plist[TransactionPropertyKey<K>.self] = newValue
        }
        _modify {
            yield &plist[TransactionPropertyKey<K>.self]
        }
    }
    
    package func mayConcatenate(with other: Transaction) -> Bool {
        return !plist.mayNotBeEqual(to: other.plist)
    }
    
    package var disablesAnimations: Bool {
        get {
            fatalError("TODO")
        }
        nonmutating set {
            fatalError("TODO")
        }
        nonmutating _modify {
            fatalError("TODO")
        }
    }
    
    package func addAnimationListener(allFinished: () -> Void) {
        fatalError("TODO")
    }
    
    var effectiveAnimation: Animation? {
        if let animation = self.animation {
            return animation
        }
        
        if tracksVelocity {
            return Animation.velocityTracking
        }
        
        return nil
    }
}

@available(*, unavailable)
extension Transaction: Sendable {}

public protocol TransactionKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
    static func _valuesEqual(_ lhs: Self.Value, _ rhs: Self.Value) -> Bool
}

extension TransactionKey {
    static func _valuesEqual(_ lhs: Self.Value, _ rhs: Self.Value) -> Bool {
        fatalError("TODO")
    }
}

extension Transaction {
    package struct ID: Hashable {
        private var value: UInt32
        
        fileprivate init(value: UInt32) {
            self.value = value
        }
    }
}

struct TransactionID: Hashable, Comparable {
    static func < (lhs: TransactionID, rhs: TransactionID) -> Bool {
        return lhs.id < rhs.id
    }
    
    private var id: Int
    
    init<T>(context: RuleContext<T>) {
        self.id = Int(context.attribute.identifier.graph.counter(options: .unknown0))
    }
    
    init(graph: Graph) {
        self.id = Int(graph.counter(options: .unknown0))
    }
    
    init() {
        self.id = 0
    }
    
    init(context: AnyRuleContext) {
        self.id = Int(context.attribute.graph.counter(options: .unknown0))
    }
}

public func withTransaction<Result>(_ transaction: Transaction, _ body: () throws -> Result) rethrows -> Result {
    return try withExtendedLifetime(transaction) { transaction in
        let oldCurrent = Transaction.current
        
        var newCurrent = transaction
        if isLinkedOnOrAfter(.v5) {
            // <+192>
            newCurrent.plist.merge(Transaction.current.plist)
        }
        
        Transaction.current = newCurrent
        defer {
            Transaction.current = oldCurrent
        }
        
        return try body()
    }
}

@_alwaysEmitIntoClient public func withTransaction<R, V>(_ keyPath: WritableKeyPath<Transaction, V>, _ value: V, _ body: () throws -> R) rethrows -> R {
    var transaction = Transaction()
    transaction[keyPath: keyPath] = value
    return try withTransaction(transaction, body)
}

fileprivate struct TransactionPropertyKey<Key: TransactionKey>: PropertyKey {
    static var defaultValue: Key.Value {
        return Key.defaultValue
    }
    
    static func valuesEqual(_ lhs: Key.Value, _ rhs: Key.Value) -> Bool {
        return Key._valuesEqual(lhs, rhs)
    }
}
