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
            return unsafe self[SavedTransactionKey.self]
        }
        set {
            unsafe self[SavedTransactionKey.self] = newValue
        }
        _modify {
            yield unsafe &self[SavedTransactionKey.self]
        }
    }
    
    fileprivate struct SavedTransactionKey: @unsafe ViewInput {
        static nonisolated(unsafe) let defaultValue: [Attribute<Transaction>] = [] 
    }
}
