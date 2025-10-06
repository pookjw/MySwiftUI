#warning("TODO")
private import _MySwiftUIShims

public struct Transaction {
    static var id: Transaction.ID {
        return Transaction.ID(value: _threadTransactionID(false))
    }
    
    var isEmpty: Bool {
        return plist.isEmpty
    }
    
    var plist: PropertyList
    
    init() {
        self.plist = PropertyList()
    }
    
    package func mayConcatenate(with other: Transaction) -> Bool {
        return !plist.mayNotBeEqual(to: other.plist)
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
