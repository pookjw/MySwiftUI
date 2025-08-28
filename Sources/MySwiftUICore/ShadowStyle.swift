#warning("TODO")
internal import CoreGraphics

struct ResolvedShadowStyle {
    private var color: Color.ResolvedHDR
    private var radius: CGFloat
    private var offset: CGSize
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
