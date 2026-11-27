package import Foundation
package import CoreGraphics
package import QuartzCore

package protocol LayerProperty {
    associatedtype Value
    
    static var keyPathPrefix: String { get }
    static var keyPath: String { get }
    static func boxValue(_ value: Self.Value) -> NSObject
}

extension LayerProperty where Self.Value == Bool {
    package static func boxValue(_ value: Bool) -> NSObject {
        return NSNumber(value: value ? 1 : 0)
    }
}

extension LayerProperty where Self.Value == CGFloat {
    package static func boxValue(_ value: CGFloat) -> NSObject {
        return NSNumber(value: value)
    }
}

extension LayerProperty {
    package static var keyPathPrefix: String {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == Float {
    package static func boxValue(_ value: Float) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == Int {
    package static func boxValue(_ value: Int) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == String {
    package static func boxValue(_ value: String) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == UInt32 {
    package static func boxValue(_ value: UInt32) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == Angle {
    package static func boxValue(_ value: Angle) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == Path {
    package static func boxValue(_ value: Path) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == Color.Resolved {
    package static func boxValue(_ value: Color.Resolved) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == _ColorMatrix {
    package static func boxValue(_ value: _ColorMatrix) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == ProjectionTransform {
    package static func boxValue(_ value: ProjectionTransform) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == CGAffineTransform {
    package static func boxValue(_ value: CGAffineTransform) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == CGRect {
    package static func boxValue(_ value: CGRect) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == CGSize {
    package static func boxValue(_ value: CGSize) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == CGPoint {
    package static func boxValue(_ value: CGPoint) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == [CGFloat] {
    package static func boxValue(_ value: [CGFloat]) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == [NSNumber] {
    package static func boxValue(_ value: [NSNumber]) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == [CGColor] {
    package static func boxValue(_ value: [CGColor]) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value == [CAMediaTimingFunction]? {
    package static func boxValue(_ value: [CAMediaTimingFunction]?) -> NSObject {
        assertUnimplemented()
    }
}

extension LayerProperty where Self.Value : RawRepresentable, Self.Value.RawValue : BinaryInteger {
    package static func boxValue(_ value: Self.Value) -> NSObject {
        assertUnimplemented()
    }
}
