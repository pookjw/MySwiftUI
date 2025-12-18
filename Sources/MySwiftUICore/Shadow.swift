internal import CoreGraphics

struct ResolvedShadowStyle {
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
    
    struct Kind: RawRepresentable {
        let rawValue: UInt8
    }
}

struct ProjectiveShadow {}
