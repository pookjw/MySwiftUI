private import AttributeGraph

struct ConstantLocation<Value>: Location {
    var value: Value
    
    var wasRead: Bool {
        get {
            return true
        }
        set {
            // nop
        }
    }
    
    func get() -> Value {
        return value
    }
    
    func set(_ newValue: Self.Value, transaction: Transaction) {
        // nop
    }
    
    static func == (lhs: ConstantLocation<Value>, rhs: ConstantLocation<Value>) -> Bool {
        // $s7SwiftUI28AccessibilityPropertiesEntry33_E7423EB73A900FF3110DDF195088480ALLV2eeoiySbADyxG_AFtFZ
        return compareValues(lhs.value, rhs.value, options: [.unknown0, .unknown1])
    }
}
