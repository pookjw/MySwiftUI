@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct ColorMatrix : Equatable {
    public var r1: Float = 1, r2: Float = 0, r3: Float = 0, r4: Float = 0, r5: Float = 0
    public var g1: Float = 0, g2: Float = 1, g3: Float = 0, g4: Float = 0, g5: Float = 0
    public var b1: Float = 0, b2: Float = 0, b3: Float = 1, b4: Float = 0, b5: Float = 0
    public var a1: Float = 0, a2: Float = 0, a3: Float = 0, a4: Float = 1, a5: Float = 0

    @inlinable public init() {}

    public static func == (a: ColorMatrix, b: ColorMatrix) -> Bool {
        assertUnimplemented()
    }
}

@frozen public struct _ColorMatrix : Equatable, Codable, Sendable {
    /*
     m11 -> 0x0
     m12 -> 0x4
     m13 -> 0x8
     m14 -> 0xc
     m15 -> 0x10
     
     m21 -> 0x14
     m22 -> 0x18
     m23 -> 0x1c
     m24 -> 0x20
     m25 -> 0x24
     
     m31 -> 0x28
     m32 -> 0x2c
     m33 -> 0x30
     m34 -> 0x34
     m35 -> 0x38
     
     m41 -> 0x3c
     m42 -> 0x40
     m43 -> 0x44
     m44 -> 0x48
     m45 -> 0x4c
     */
    public var m11: Float = 1, m12: Float = 0, m13: Float = 0, m14: Float = 0, m15: Float = 0
    public var m21: Float = 0, m22: Float = 1, m23: Float = 0, m24: Float = 0, m25: Float = 0
    public var m31: Float = 0, m32: Float = 0, m33: Float = 1, m34: Float = 0, m35: Float = 0
    public var m41: Float = 0, m42: Float = 0, m43: Float = 0, m44: Float = 1, m45: Float = 0
    
    @inlinable public init() {}
    
    public var isIdentity: Bool {
        assertUnimplemented()
    }
    
    public init(color: Color, in environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    public static func * (a: _ColorMatrix, b: _ColorMatrix) -> _ColorMatrix {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public static func == (a: _ColorMatrix, b: _ColorMatrix) -> Bool {
        assertUnimplemented()
    }
}

extension _ColorMatrix {
    init(row1: (Float, Float, Float, Float, Float), row2: (Float, Float, Float, Float, Float), row3: (Float, Float, Float, Float, Float), row4: (Float, Float, Float, Float, Float)) {
        self.m11 = row1.0
        self.m12 = row1.1
        self.m13 = row1.2
        self.m14 = row1.3
        self.m15 = row1.4
        self.m21 = row2.0
        self.m22 = row2.1
        self.m23 = row2.2
        self.m24 = row2.3
        self.m25 = row2.4
        self.m31 = row3.0
        self.m32 = row3.1
        self.m33 = row3.2
        self.m34 = row3.3
        self.m35 = row3.4
        self.m41 = row4.0
        self.m42 = row4.1
        self.m43 = row4.2
        self.m44 = row4.3
        self.m45 = row4.4
    }
    
    init(_ matrix: ColorMatrix) {
        assertUnimplemented()
    }
    
    init(floatArray: [Float]) {
        assertUnimplemented()
    }
    
    var floatArray: [Float] {
        assertUnimplemented()
    }
    
    init(brightness: Double) {
        assertUnimplemented()
    }
    
    init(contrast: Double) {
        assertUnimplemented()
    }
    
    init(colorInvert: Float) {
        assertUnimplemented()
    }
    
    init(hueRotation: Angle) {
        assertUnimplemented()
    }
    
    init(colorMonochrome color: Color.Resolved, amount: Float = 1.0, bias: Float = 0.0) {
        assertUnimplemented()
    }
    
    init(colorMultiply color: Color.Resolved, premultiplied: Bool = false) {
        assertUnimplemented()
    }
    
    init(alphaMultiply color: Color.Resolved, premultiplied: Bool = false) {
        assertUnimplemented()
    }
    
    init(luminanceToAlpha: ()) {
        assertUnimplemented()
    }
    
    init?(_ filter: GraphicsFilter, premultiplied: Bool = false) {
        switch filter {
        case .blur(_):
            // <+1168>
            return nil
        case .variableBlur(_):
            // <+172>
            return nil
        case .displacementMap(_):
            // <+172>
            return nil
        case .chromaticAberrationMap(_):
            // <+172>
            return nil
        case .shadow(_):
            // <+1168>
            return nil
        case .projection(_):
            // <+1168>
            return nil
        case .colorMatrix(let matrix):
            // <+352>
            if premultiplied != matrix.premultiplied {
                return nil
            } else {
                self = matrix.0
            }
        case .colorMultiply(let resolved):
            // <+228>
            self.init(colorMultiply: resolved.base, premultiplied: premultiplied)
        case .alphaMultiply(let resolved):
            // <+436>
            self.init(alphaMultiply: resolved.base, premultiplied: premultiplied)
        case .hueRotation(let angle):
            // <+644>
            if premultiplied {
                return nil
            } else {
                self.init(hueRotation: angle)
            }
        case .saturation(let saturation):
            // <+720>
            if premultiplied {
                return nil
            } else {
                var d0 = saturation
                let d1: Double = 0
                d0 = (d0 <= 0) ? d1 : d0
                var s1 = Float(d0)
                var s0 = Float(bitPattern: 0x3f498c7e)
                s0 = s1 * s0
                var s2 = Float(bitPattern: 0x3e59b3d0)
                let s7 = s0 + s2
                s0 = Float(bitPattern: 0x3f371759)
                var s3 = s1 * s0
                s3 = s0 - s3
                let s4 = Float(bitPattern: 0x3d93dd98)
                var s5 = s1 * s4
                s5 = s4 - s5
                var s6 = s1 * s2
                s2 = s2 - s6
                s6 = Float(bitPattern: 0x3e91d14e)
                s6 = s1 * s6
                s0 = s6 + s0
                s6 = Float(bitPattern: 0x3f6d844d)
                s1 = s1 * s6
                s1 = s1 + s4
                
                // <+880>
                self.init(
                    row1: (s7, s3, s5, 0, 0),
                    row2: (s2, s0, s5, 0, 0),
                    row3: (s2, s3, s1, 0, 0),
                    row4: (0, 0, 0, 1, 0)
                )
            }
        case .brightness(let brightness):
            // <+468>
            if premultiplied {
                return nil
            } else {
                self.init(brightness: brightness)
            }
        case .contrast(let contrast):
            // <+544>
            if premultiplied {
                return nil
            } else {
                self.init(contrast: contrast)
            }
        case .grayscale(let grayscale):
            // <+672>
            if premultiplied {
                return nil
            } else {
                self.init(
                    colorMonochrome: Color.Resolved(
                        linearRed: 1,
                        linearGreen: 1,
                        linearBlue: 1,
                        opacity: 1
                    ),
                    amount: Float(grayscale),
                    bias: 0
                )
            }
        case .colorMonochrome(let colorMonochrome):
            // <+936>
            if premultiplied {
                return nil
            } else {
                self.init(
                    colorMonochrome: colorMonochrome.color.base,
                    amount: colorMonochrome.amount,
                    bias: colorMonochrome.bias
                )
            }
        case .vibrantColorMatrix(_):
            // <+1168>
            return nil
        case .luminanceCurve(_):
            // <+1168>
            return nil
        case .colorCurves(_):
            // <+1168>
            return nil
        case .shader(_):
            // <+172>
            return nil
        case .alphaThreshold(_):
            // <+1168>
            return nil
        case .edrGainMultiply(_):
            // <+1168>
            return nil
        case .glassBackground(_):
            // <+172>
            return nil
        case .caFilter(_):
            // <+172>
            return nil
        case .averageColor:
            // <+1168>
            return nil
        case .luminanceToAlpha:
            // <+328>
            if premultiplied {
                return nil
            } else {
                let v6_0: Float = 0.7152
                let v6_1: Float = 0.0722
                let w13 = Float(bitPattern: 0x3e59b3d0)
                
                self.init(
                    row1: (0, 0, 0, 0, 0),
                    row2: (0, 0, 0, 0, 0),
                    row3: (0, 0, 0, 0, 0),
                    row4: (w13, v6_0, v6_1, 0, 0)
                )
            }
        case .colorInvert:
            // <+260>
            if premultiplied {
                return nil
            } else {
                // <+268>
                self.init(
                    row1: (-1, 0, 0, 0, 1),
                    row2: (0, -1, 0, 0, 1),
                    row3: (0, 0, -1, 0, 1),
                    row4: (0, 0, 0, 1, 0)
                )
            }
        }
    }
    
    var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    mutating func add(_ other: _ColorMatrix) {
        assertUnimplemented()
    }
    
    mutating func subtract(_ other: _ColorMatrix) {
        assertUnimplemented()
    }
    
    mutating func negate() {
        assertUnimplemented()
    }
    
    mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
}

extension _ColorMatrix : ShapeStyle {
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
}

extension _ColorMatrix : ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }

    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}
