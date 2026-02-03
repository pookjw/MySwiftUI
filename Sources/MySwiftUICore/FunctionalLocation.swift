private import AttributeGraph

struct FunctionalLocation<Value>: Location {
    private(set) var functions: FunctionalLocation<Value>.Functions
    
    var wasRead: Bool {
        get {
            return true
        }
        set {
            fatalError("TODO")
        }
    }
    
    func get() -> Value {
        return functions.getValue()
    }
    
    func set(_ newValue: Value, transaction: Transaction) {
        functions.setValue(newValue, transaction)
    }
    
    static func == (lhs: FunctionalLocation, rhs: FunctionalLocation) -> Bool {
        // $s7SwiftUI18FunctionalLocationV2eeoiySbACyxG_AEtFZ
        return compareValues(lhs.functions, rhs.functions, options: [.unknown0, .unknown1])
    }
}

extension FunctionalLocation {
    struct Functions {
        private(set) var getValue: () -> Value
        private(set) var setValue: (Value, Transaction) -> Void
    }
}
