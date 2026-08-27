public import CoreGraphics
public import QuartzCore

@frozen public struct ProjectionTransform {
    public var m11: CGFloat = 1.0, m12: CGFloat = 0.0, m13: CGFloat = 0.0
    public var m21: CGFloat = 0.0, m22: CGFloat = 1.0, m23: CGFloat = 0.0
    public var m31: CGFloat = 0.0, m32: CGFloat = 0.0, m33: CGFloat = 1.0
    
    @inlinable public init() {}
    
    @inlinable public init(_ m: CGAffineTransform) {
        m11 = m.a
        m12 = m.b
        m21 = m.c
        m22 = m.d
        m31 = m.tx
        m32 = m.ty
    }
    
    @inlinable public init(_ m: CATransform3D) {
        m11 = m.m11
        m12 = m.m12
        m13 = m.m14
        m21 = m.m21
        m22 = m.m22
        m23 = m.m24
        m31 = m.m41
        m32 = m.m42
        m33 = m.m44
    }
    
    @inlinable public var isIdentity: Bool {
        get {
            return self == ProjectionTransform()
        }
    }
    
    @inlinable public var isAffine: Bool {
        get {
            return m13 == 0 && m23 == 0 && m33 == 1
        }
    }
    
    public mutating func invert() -> Bool {
        assertUnimplemented()
    }
    
    public func inverted() -> ProjectionTransform {
        assertUnimplemented()
    }
}

extension ProjectionTransform : Equatable {
    public static func == (a: ProjectionTransform, b: ProjectionTransform) -> Bool {
        assertUnimplemented()
    }
}
