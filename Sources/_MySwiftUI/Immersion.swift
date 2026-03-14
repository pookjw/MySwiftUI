internal import Observation
internal import MySwiftUICore

@Observable
final class Immersion: Equatable {
    var amount: Double
    
    init() {
        fatalError("TODO")
    }
    
    static func == (lhs: Immersion, rhs: Immersion) -> Bool {
        return lhs.amount == rhs.amount
    }
}

extension EnvironmentValues {
    var immersion: Immersion? {
        get {
            return self[ImmersionKey.self]
        }
        set {
            self[ImmersionKey.self] = newValue
        }
    }
    
    struct ImmersionKey: EnvironmentKey {
        static var defaultValue: Immersion? {
            return nil
        }
    }
}
