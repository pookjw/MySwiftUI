#warning("TODO")

// TODO: 이거는 Test를 해보고 일치하지 않으면 SwiftUI를 가져다가 써야 할 것 같음

private import CoreGraphics

struct ResolvedGradient: Sendable {
    private var stops: [ResolvedGradient.Stop]
    private var colorSpace: ResolvedGradient.ColorSpace
    private var headroom: Float?
}

extension ResolvedGradient {
    struct Stop: Sendable {
        private var color: Color.Resolved
        private var location: CGFloat
        //        var interpolation: BezierTimingFunction<Float>?        
    }
    
    enum ColorSpace: Sendable {
        case device
        case linear
        case perceptual
        
        func convertIn(_ resolved: Color.Resolved) -> ResolvedGradient.ColorSpace.InterpolatableColor {
            switch self {
            case .linear:
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: resolved.linearRed,
                    g: resolved.linearGreen,
                    b: resolved.linearBlue,
                    a: resolved.opacity
                )
            case .device:
                let r = srgbEncode(resolved.linearRed)
                let g = srgbEncode(resolved.linearGreen)
                let b = srgbEncode(resolved.linearBlue)
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: r * resolved.opacity,
                    g: g * resolved.opacity,
                    b: b * resolved.opacity,
                    a: resolved.opacity
                )
            case .perceptual:
                let r = resolved.linearRed
                let g = resolved.linearGreen
                let b = resolved.linearBlue
                let l = 0.412221462 * r + 0.536332548 * g + 0.0 * b
                let m = 0.0 * r + 0.0 * g + 0.0 * b
                let s = 0.088302463 * r + 0.28171885 * g + 0.6299787 * b
                let e = Float(bitPattern: 0x3eaaaaab)
                let lA = powf(fabsf(l), e)
                let mA = powf(fabsf(m), e)
                let sA = powf(fabsf(s), e)
                let lC = copysignf(lA, l)
                let mC = copysignf(mA, m)
                let sC = copysignf(sA, s)
                let le = srgbEncode(lC)
                let me = srgbEncode(mC)
                let se = srgbEncode(sC)
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: le * resolved.opacity,
                    g: me * resolved.opacity,
                    b: se * resolved.opacity,
                    a: resolved.opacity
                )
            }
        }
        
        @_transparent
        private func srgbEncode(_ v: Float) -> Float {
            let x = fabsf(v)
            let threshold: Float = Float(bitPattern: 0x3b4d2e1c)
            if x <= threshold {
                let s = Float(bitPattern: 0x414eb852)
                let y = x * s
                return v >= 0 ? y : -y
            } else if x == 1 {
                return v >= 0 ? 1 : -1
            } else {
                let exp = Float(bitPattern: 0x3ed55555)
                let mul = Float(bitPattern: 0x3f870a3d)
                let bias = Float(bitPattern: 0xbd6147ae)
                let y = mul * powf(x, exp) + bias
                return v >= 0 ? y : -y
            }
        }
        
        func convertOut(_ resolved: ResolvedGradient.ColorSpace.InterpolatableColor) -> Color.Resolved {
            fatalError("TODO")
        }
    }
}

extension ResolvedGradient.ColorSpace {
    struct InterpolatableColor: Sendable {
        var r: Float
        var g: Float
        var b: Float
        var a: Float
    }
}
