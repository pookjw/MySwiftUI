// C9520BDE5A7C30CCB2E95C7B085D6CF4
internal import CoreGraphics

package struct ResolvedShadowStyle {
    private(set) var color: Color.ResolvedHDR
    private(set) var radius: CGFloat
    private(set) var offset: CGSize
    private var midpoint: Float
    private var kind: ShadowStyle.Kind
}

public struct ShadowStyle {
    private var storage: ShadowStyle.Storage
    private var midpoint: Float
}

extension ShadowStyle {
    enum Storage {
        case standard(ShadowStyle.Kind)
        case custom(ShadowStyle.Kind, Color, CGFloat, CGSize)
    }
    
    struct Kind : RawRepresentable {
        let rawValue: UInt8
    }
}

package struct ProjectiveShadow : Equatable {
    package static var `default`: ProjectiveShadow {
        return ProjectiveShadow()
    }
}

extension EnvironmentValues {
    package var castsShadows: Bool {
        get {
            return self[EnvironmentValues.CastsShadows.self]
        }
        set {
            self[EnvironmentValues.CastsShadows.self] = newValue
        }
    }
    
    fileprivate struct CastsShadows : EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
