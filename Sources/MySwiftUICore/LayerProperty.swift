package import Foundation
package import CoreGraphics

package protocol LayerProperty {
    associatedtype Value
    
    static var keyPathPrefix: String { get }
    static var keyPath: String { get }
    static func boxValue(_ value: Self.Value) -> NSObject
}

extension LayerProperty where Self.Value == Bool {
    package static func boxValue(_ value: Bool) -> NSObject {
        return value as NSNumber
    }
}

extension LayerProperty where Self.Value == CGFloat {
    package static func boxValue(_ value: CGFloat) -> NSObject {
        return value as NSNumber
    }
}

// TODO
