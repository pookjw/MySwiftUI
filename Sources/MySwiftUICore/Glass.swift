package struct _Glass {
    
}

extension _Glass {
    struct Variant {
        // TODO
    }
    
    package struct Frost: Equatable {
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
    
    package struct Diffusion {
        private var role: _Glass.Diffusion.Role
        
        package static var automatic: _Glass.Diffusion {
            return _Glass.Diffusion(role: .automatic)
        }
        
        package static var increased: _Glass.Diffusion {
            return _Glass.Diffusion(role: .increased)
        }
        
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
        case automatic
        case increased
    }
}

extension _Glass.Frost {
    package enum Role: Hashable {
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
    
    package var glassDiffusion: _Glass.Diffusion {
        get {
            return self[__Key_glassDiffusion.self]
        }
        set {
            self[__Key_glassDiffusion.self] = newValue
        }
    }
    
    // TOOD: Macro Entry
    fileprivate struct __Key_glassDiffusion: EnvironmentKey {
        static var defaultValue: _Glass.Diffusion {
            return .automatic
        }
    }
}
