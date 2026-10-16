// C9520BDE5A7C30CCB2E95C7B085D6CF4
package import CoreGraphics

package struct ResolvedShadowStyle : Equatable, Animatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    private(set) var color: Color.ResolvedHDR // 0x0
    private(set) var radius: CGFloat // 0x18
    private(set) var offset: CGSize // 0x20
    private var midpoint: Float // 0x30
    private(set) var kind: ShadowStyle.Kind // 0x34

    package static func == (lhs: ResolvedShadowStyle, rhs: ResolvedShadowStyle) -> Bool {
        assertUnimplemented()
    }

    package typealias AnimatableData = AnimatablePair<AnimatablePair<Float, AnimatablePair<Float, AnimatablePair<Float, Float>>>, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>

    package var animatableData: AnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }

    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }

    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

public struct ShadowStyle : Equatable {
    private var storage: ShadowStyle.Storage
    private var midpoint: Float

    public static func == (lhs: ShadowStyle, rhs: ShadowStyle) -> Bool {
        assertUnimplemented()
    }
}

extension ShadowStyle {
    enum Storage : Equatable {
        case standard(ShadowStyle.Kind)
        case custom(ShadowStyle.Kind, Color, CGFloat, CGSize)

        static func == (lhs: ShadowStyle.Storage, rhs: ShadowStyle.Storage) -> Bool {
            assertUnimplemented()
        }
    }
    
    struct Kind : OptionSet {
        static var drop: ShadowStyle.Kind {
            return ShadowStyle.Kind(rawValue: 0)
        }
        
        static var inner: ShadowStyle.Kind {
            return ShadowStyle.Kind(rawValue: 1 << 0)
        }
        
        static var only: ShadowStyle.Kind {
            return ShadowStyle.Kind(rawValue: 1 << 1)
        }
        
        static var nonOpaque: ShadowStyle.Kind {
            return ShadowStyle.Kind(rawValue: 1 << 2)
        }
        
        static var ignoresFill: ShadowStyle.Kind {
            return ShadowStyle.Kind(rawValue: 1 << 3)
        }
        
        static var requiresKnockout: ShadowStyle.Kind {
            return ShadowStyle.Kind(rawValue: 1 << 4)
        }
        
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
