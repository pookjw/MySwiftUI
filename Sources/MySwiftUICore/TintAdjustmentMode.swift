package struct TintAdjustmentMode : Hashable {
    package static var normal: TintAdjustmentMode {
        return TintAdjustmentMode(role: .normal)
    }
    
    package static var desaturated: TintAdjustmentMode {
        return TintAdjustmentMode(role: .desaturated)
    }
    
    private var role: TintAdjustmentMode.Role
}

extension TintAdjustmentMode {
    enum Role {
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

    package var effectiveTintAdjustmentMode: TintAdjustmentMode {
        get {
            assertUnimplemented()
        }
    }
}

extension Color {
    package func tintAdjustmentMode(_ mode: TintAdjustmentMode) -> Color {
        assertUnimplemented()
    }
}

extension View {
    package func tintAdjustmentMode(_ mode: TintAdjustmentMode?) -> some View {
        assertUnimplemented()
    }
}

fileprivate struct TintAdjustmentModeKey : EnvironmentKey {
    static var defaultValue: TintAdjustmentMode? {
        return nil
    }
}
