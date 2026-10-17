// 47C1BD8C61550BB60F4F3D12F752D53D

package import AttributeGraph

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

extension _GraphInputs {
    package var defaultPadding: Attribute<EdgeInsets> {
        assertUnimplemented()
    }
}

extension _ViewInputs {
    package var defaultPadding: Attribute<EdgeInsets> {
        assertUnimplemented()
    }
}
