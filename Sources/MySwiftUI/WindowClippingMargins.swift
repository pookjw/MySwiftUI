// 50C6897C55ADE827340B10B43BE19EE7
internal import MySwiftUICore

extension EnvironmentValues {
    var effectiveWindowMargins: EdgeOutsets3D {
        return self[WindowClippingMarginsKey.self]
    }
}

fileprivate struct WindowClippingMarginsKey : EnvironmentKey {
    static let defaultValue = EdgeOutsets3D.zero
}
