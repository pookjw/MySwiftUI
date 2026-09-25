internal import MySwiftUICore

struct EffectiveFormStyle : Equatable {
    private var baseType: ObjectIdentifier
}

extension EnvironmentValues {
    var effectiveFormStyle: EffectiveFormStyle? {
        get {
            return self[EffectiveFormStyleKey.self]
        }
        set {
            self[EffectiveFormStyleKey.self] = newValue
        }
    }
}

struct EffectiveFormStyleKey : EnvironmentKey {
    static var defaultValue: EffectiveFormStyle? {
        return nil
    }
}
