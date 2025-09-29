extension EnvironmentValues {
    package var isVibrantColorStyleEnabled: Bool {
        get {
            return self[VibrantColorStyleKey.self] != nil
        }
        set {
            if newValue {
                if isLinkedOnOrAfter(.v6) {
                    self[VibrantColorStyleKey.self] = SystemVibrantColorStyle_Vision.self
                } else {
                    self[VibrantColorStyleKey.self] = SystemVibrantColorStyle.self
                }
            } else {
                self[VibrantColorStyleKey.self] = nil
            }
        }
    }
    
    var vibrantColorStyle: (any VibrantColorStyle.Type)? {
        get {
            return self[VibrantColorStyleKey.self]
        }
        set {
            self[VibrantColorStyleKey.self] = newValue
        }
    }
}

protocol VibrantColorStyle {
//    static func apply(_: SystemColorType, color: Color, material: Material, to: inout _ShapeStyle_Shape)
}

struct SystemVibrantColorStyle_Vision: VibrantColorStyle {
    
}

struct SystemVibrantColorStyle: VibrantColorStyle {
    
}

fileprivate struct VibrantColorStyleKey: EnvironmentKey {
    static var defaultValue: (any VibrantColorStyle.Type)? {
        return nil
    }
}
