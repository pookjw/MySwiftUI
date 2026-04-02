
public struct _GestureInputs {
    
}

extension _GestureInputs {
    struct InheritedPhase: RawRepresentable {
        var rawValue: Int
        
        static var active: InheritedPhase { InheritedPhase(rawValue: 2) }
        static var defaultValue: InheritedPhase { InheritedPhase(rawValue: 1) }
    }
}
