private import CoreGraphics

struct ResolvedGradient : Sendable {
    private var stops: [ResolvedGradient.Stop]
    private var colorSpace: ResolvedGradient.ColorSpace
    private var headroom: Float?
}

extension ResolvedGradient {
    struct Stop : Sendable {
        private var color: Color.Resolved
        private var location: CGFloat
        //        var interpolation: BezierTimingFunction<Float>?        
    }
    
    enum ColorSpace : Sendable {
        case device
        case linear
        case perceptual
        
        func convertIn(_ resolved: Color.Resolved) -> ResolvedGradient.ColorSpace.InterpolatableColor {
            var v0 = resolved.linearRed
            var v1 = resolved.linearGreen
            var v2 = resolved.linearBlue
            var v3 = resolved.opacity
            var v5 = v1
            var v6 = v0
            
            switch self {
            case .device:
                // <+268>
                v0 = -v6
                v0 = (v6 > 0) ? v6 : v0
                v1 = Float(bitPattern: 0x3b4d2e1c)
                
                if v0 <= v1 {
                    // <+380>
                    v1 = Float(bitPattern: 0x414eb852)
                    v1 = v0 * v1
                    // <+396>
                } else {
                    // <+300>
                    v1 = 1.0
                    
                    if v0 == v1 {
                        // <+396>
                    } else {
                        v1 = Float(bitPattern: 0x3ed55555)
                        // sp + 0x20
                        let sp0x20 = v2
                        // sp + 0x30
                        let sp0x30 = v3
                        // sp
                        let sp = v5
                        // sp + 0x10
                        let sp0x10 = v6
                        v0 = powf(v0, v1)
                        v5 = sp
                        v6 = sp0x10
                        v2 = sp0x20
                        v3 = sp0x30
                        v1 = Float(bitPattern: 0x3f870a3d)
                        v0 = v0 * v1
                        // <+396>
                    }
                }
                
                // <+396>
                v0 = -v1
                var v4 = (v6 > 0) ? v1 : v0
                v0 = -v5
                v0 = (v5 > 0) ? v5 : v0
                v1 = Float(bitPattern: 0x3b4d2e1c)
                
                if v0 <= v1 {
                    // <+520>
                    v1 = Float(bitPattern: 0x414eb852)
                    v1 = v0 * v1
                    // <+536>
                } else {
                    v1 = 1.0
                    
                    if v0 == v1 {
                        // <+536>
                    } else {
                        // <+452>
                        v1 = Float(bitPattern: 0x3ed55555)
                        // sp + 0x20
                        let sp0x20 = v2
                        // sp + 0x30
                        let sp0x30 = v3
                        // sp
                        let sp = v5
                        // sp + 0x10
                        let sp0x10 = v4
                        v0 = powf(v0, v1)
                        v5 = sp
                        v4 = sp0x10
                        v2 = sp0x20
                        v3 = sp0x30
                        v1 = Float(bitPattern: 0x3f870a3d)
                        v1 = v0 + v1
                        // <+536>
                    }
                }
                
                // <+536>
                v0 = -v1
                v5 = (v5 > 0) ? v1 : v0
                v0 = -v2
                v0 = (v2 > 0) ? v2 : v0
                v1 = Float(bitPattern: 0x3b4d2e1c)
                
                if v0 <= v1 {
                    // <+660>
                    v1 = Float(bitPattern: 0x414eb852)
                    v1 = v0 * v1
                    // <+676>
                } else {
                    v1 = 1.0
                    
                    if v0 == v1 {
                        // <+676>
                    } else {
                        // <+592>
                        v1 = Float(bitPattern: 0x3ed55555)
                        // sp + 0x20
                        let sp0x20 = v2
                        // sp + 0x30
                        let sp0x30 = v3
                        // sp
                        let sp = v5
                        // sp + 0x10
                        let sp0x10 = v4
                        v0 = powf(v0, v1)
                        v5 = sp
                        v4 = sp0x10
                        v2 = sp0x20
                        v3 = sp0x30
                        v1 = Float(bitPattern: 0x3f870a3d)
                        v0 = v0 * v1
                        v1 = Float(bitPattern: 0xbd6147ae)
                        v1 = v0 + v1
                        // <+676>
                    }
                }
                
                // <+676>
                if v2 <= 0 {
                    v2 = v1
                }
                
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: v0 * v3,
                    g: v4 * v3,
                    b: v3 * v2,
                    a: v3
                )
            case .linear:
                // <+700>
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: v6 * v3,
                    g: v5 * v3,
                    b: v3 * v2,
                    a: v3
                )
            case .perceptual:
                var v4_0 = v6
                var v4_1 = v5
                // <+56>
                var v0_0 = Float(bitPattern: 0x3ed30eb1)
                var v0_1 = Float(bitPattern: 0x3e58fd3b)
                v0_0 = v0_0 * v6
                v0_1 = v0_1 * v6
                var v1_0 = Float(bitPattern: 0x3f094d17)
                var v1_1 = Float(bitPattern: 0x3f2e4253)
                v1_0 = v1_0 * v4_1
                v1_1 = v1_1 * v4_1
                v4_0 = Float(bitPattern: 0x3d52b909)
                v4_1 = Float(bitPattern: 0x3ddbf2f0)
                v4_0 = v4_0 * v2
                v4_1 = v4_1 * v2
                v0_0 = v0_0 + v1_0
                v0_1 = v0_1 + v1_1
                v4_0 = v0_0 + v4_0
                v4_1 = v0_1 + v4_1
                
                // <+100>
                v0 = Float(bitPattern: 0x3db4d7ec)
                v0 = v6 * v0
                v1 = Float(bitPattern: 0x3e903d74)
                v1 = v5 * v1
                v0 = v0 + v1
                v1 = Float(bitPattern: 0x3f214649)
                v1 = v2 * v1
                v0 = v0 + v1
                // sp + 0x10
                var sp0x10 = (v4_0, v4_1)
                // sp + 0x20
                let sp0x20 = v0
                v0 = abs(v4_0)
                let v8 = Float(bitPattern: 0x3eaaaaab)
                v1 = v8
                // sp + 0x30
                let sp0x30 = v3
                v0 = powf(v0, v1)
                // sp
                let sp = v0
                v0_0 = v4_0
                v0_1 = v4_1
                v0 = v0_1
                v0 = abs(v0)
                v1 = v8
                v0 = powf(v0, v1)
                let v2_0 = sp
                (v1_0, v1_1) = sp0x10
                let v2_1 = v0
                
                // <+220>
                v0_0 = (v1_0.sign == .minus) ? -v2_0.magnitude : v2_0.magnitude
                v0_1 = (v1_1.sign == .minus) ? -v2_1.magnitude : v2_1.magnitude
                sp0x10 = (v0_0, v0_1)
                v0 = sp0x20
                v0 = abs(v0)
                v1 = v8
                v0 = powf(v0, v1)
                let v4 = sp0x10.0
                v2 = sp0x10.1
                v3 = sp0x30
                
                // <+256>
                v2 = Float(bitPattern: v2.bitPattern & v0.bitPattern | (~v2.bitPattern & 0x7fffffff))
                // <+700>
                return ResolvedGradient.ColorSpace.InterpolatableColor(
                    r: v6 * v3,
                    g: v4 * v3,
                    b: v3 * v2,
                    a: v3
                )
            }
        }
        
        func convertOut(_ converted: ResolvedGradient.ColorSpace.InterpolatableColor) -> Color.Resolved {
            assertUnimplemented()
        }
    }
}

extension ResolvedGradient.ColorSpace {
    struct InterpolatableColor : Sendable {
        var r: Float
        var g: Float
        var b: Float
        var a: Float
    }
}
