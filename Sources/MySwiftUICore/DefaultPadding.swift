// 47C1BD8C61550BB60F4F3D12F752D53D

extension EnvironmentValues {
    var defaultPadding: EdgeInsets {
        get {
            return self[DefaultPaddingKey.self]
        }
        set {
            self[DefaultPaddingKey.self] = newValue
        }
    }
}

fileprivate struct DefaultPaddingKey : EnvironmentKey {
    static var defaultValue: EdgeInsets {
        return EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    }
}
