#warning("TODO")
private import _MySwiftUIShims

public struct Transaction {
    static var id: Transaction.ID {
        return Transaction.ID(value: _threadTransactionID(false))
    }
    
    var plist: PropertyList
    
    init() {
        self.plist = PropertyList()
    }
}

extension Transaction {
    struct ID: Hashable {
        private var value: UInt32
        
        fileprivate init(value: UInt32) {
            self.value = value
        }
    }
}
