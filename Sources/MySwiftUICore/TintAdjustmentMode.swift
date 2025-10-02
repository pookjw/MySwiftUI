package struct TintAdjustmentMode: Hashable {
    package static var normal: TintAdjustmentMode {
        return TintAdjustmentMode(role: .normal)
    }
    
    package static var desaturated: TintAdjustmentMode {
        return TintAdjustmentMode(role: .desaturated)
    }
    
    private var role: TintAdjustmentMode.Role
}

extension TintAdjustmentMode {
    fileprivate enum Role {
        case normal
        case desaturated
    }
}

extension EnvironmentValues {
    package var tintAdjustmentMode: TintAdjustmentMode? {
        get {
            return self[TintAdjustmentModeKey.self]
        }
        set {
            self[TintAdjustmentModeKey.self] = newValue
        }
    }
}

fileprivate struct TintAdjustmentModeKey: EnvironmentKey {
    static var defaultValue: TintAdjustmentMode? {
        return nil
    }
}
