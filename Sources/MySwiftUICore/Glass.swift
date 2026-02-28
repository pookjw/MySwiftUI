package struct _Glass {
    
}

extension _Glass {
    struct Variant {
        // TODO
    }
    
    package struct Frost {
        private var role: _Glass.Frost.Role
        
        package static var automatic: _Glass.Frost {
            return _Glass.Frost(role: .automatic)
        }
        
        package static var reduced: _Glass.Frost {
            return _Glass.Frost(role: .reduced)
        }
        
        package static var none: _Glass.Frost {
            return _Glass.Frost(role: .none)
        }
        
        // TODO
    }
    
    struct Diffusion {
        // TODO
    }
    
    struct ContentEffect {
        // TODO
    }
    
    struct InteractionState {
        // TODO
    }
    
    struct Options {
        // TODO
    }
    
    struct Resolved {
        // TODO
    }
}

extension _Glass.Variant {
    struct Min {
        // TODO
    }
}

extension _Glass.InteractionState {
    enum Role {
        // TODO
    }
}

extension _Glass.ContentEffect {
    enum Storage {
        // TODO
    }
}

extension _Glass.Diffusion {
    enum Role {
        // TODO
    }
}

extension _Glass.Frost {
    package enum Role {
        case automatic
        case reduced
        case none
    }
}

extension _Glass.Variant {
    enum Role {
        // TODO
    }
    
    enum ID {
        // TODO
    }
}

extension _Glass.Variant.ID {
    struct MixID {
        // TODO
    }
}

extension EnvironmentValues {
    package var glassFrost: _Glass.Frost {
        get {
            return self[__Key_glassFrost.self]
        }
        set {
            self[__Key_glassFrost.self] = newValue
        }
    }
    
    // TOOD: Macro Entry
    fileprivate struct __Key_glassFrost: EnvironmentKey {
        static var defaultValue: _Glass.Frost {
            return _Glass.Frost.automatic
        }
    }
}
