// A1B10B5AB036C34AB7DD2EE8825FCA93
#warning("TODO")
internal import AttributeGraph

extension _ViewInputs {
    var savedTransactions: [Attribute<Transaction>] {
        get {
            return base.savedTransactions
        }
        set {
            base.savedTransactions = newValue
        }
        _modify {
            yield &base.savedTransactions
        }
    }
}

extension _GraphInputs {
    var savedTransactions: [Attribute<Transaction>] {
        get {
            return self[SavedTransactionKey.self]
        }
        set {
            self[SavedTransactionKey.self] = newValue
        }
        _modify {
            yield &self[SavedTransactionKey.self]
        }
    }
    
    fileprivate struct SavedTransactionKey: ViewInput {
        static nonisolated(unsafe) let defaultValue: [Attribute<Transaction>] = [] 
    }
}
