internal import MySwiftUICore

struct TintAdjustmentMode: Hashable {
    static var normal: TintAdjustmentMode {
        return TintAdjustmentMode(role: .normal)
    }
    
    static var desaturated: TintAdjustmentMode {
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
    var effectiveTintAdjustmentMode: TintAdjustmentMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension Color {
    func tintAdjustmentMode(_: TintAdjustmentMode) -> Color {
        assertUnimplemented()
    }
}
