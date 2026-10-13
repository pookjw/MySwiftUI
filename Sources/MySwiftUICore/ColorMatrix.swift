@frozen public struct _ColorMatrix : Equatable, Codable, Sendable {
    public var m11: Float = 1, m12: Float = 0, m13: Float = 0, m14: Float = 0, m15: Float = 0
    public var m21: Float = 0, m22: Float = 1, m23: Float = 0, m24: Float = 0, m25: Float = 0
    public var m31: Float = 0, m32: Float = 0, m33: Float = 1, m34: Float = 0, m35: Float = 0
    public var m41: Float = 0, m42: Float = 0, m43: Float = 0, m44: Float = 1, m45: Float = 0
    
    @inlinable public init() {}
    
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
}
