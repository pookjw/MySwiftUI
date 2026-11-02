// 9CDC06258A415BCDFCA123F203571FE0

enum AnyAccessibilityValueType : UInt, Hashable, Codable {
    case int
    case double
    case bool
    case string
    case disclosure
    case toggle
    case slider
    case stepper
    case progress
    case boundedNumber
    case number
    case empty
}

struct AnyAccessibilityValue {
    private var base: any AbstractAnyAccessibilityValue
    
    var type: AnyAccessibilityValueType {
        assertUnimplemented()
    }
    
    var value: Any {
        assertUnimplemented()
    }
    
    var minValue: Any? {
        assertUnimplemented()
    }
    
    var maxValue: Any? {
        assertUnimplemented()
    }
    
    var step: Any? {
        assertUnimplemented()
    }
    
    var displayDescription: String? {
        assertUnimplemented()
    }
    
    var localizedDescription: String? {
        assertUnimplemented()
    }
    
    static func == (lhs: AnyAccessibilityValue, rhs: AnyAccessibilityValue) -> Bool {
        assertUnimplemented()
    }
}

extension AnyAccessibilityValue : Codable {
    func encode(to encoder: Encoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: Decoder) throws {
        assertUnimplemented()
    }
}

extension AnyAccessibilityValue : Equatable {
}

fileprivate protocol AbstractAnyAccessibilityValue {
    // TODO
}
