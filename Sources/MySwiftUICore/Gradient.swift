public import CoreGraphics

@frozen public struct Gradient : Equatable {
    @frozen public struct Stop : Equatable {
        public var color: Color
        public var location: CGFloat
        
        public init(color: Color, location: CGFloat) {
            assertUnimplemented()
        }
        
        public static func == (a: Gradient.Stop, b: Gradient.Stop) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var stops: [Gradient.Stop]
    
    public init(stops: [Gradient.Stop]) {
        assertUnimplemented()
    }
    
    public init(colors: [Color]) {
        assertUnimplemented()
    }
    
    public static func == (a: Gradient, b: Gradient) -> Bool {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Gradient : Hashable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Gradient.Stop : Hashable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Gradient : ShapeStyle {
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public typealias Resolved = Never
}

extension Gradient {
    public struct ColorSpace : Hashable, Sendable {
        // TODO
        
        public static let device: Gradient.ColorSpace = {
            assertUnimplemented()
        }()
        
        public static let perceptual: Gradient.ColorSpace = {
            assertUnimplemented()
        }()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct AnyGradient : Hashable, ShapeStyle, Sendable {
    package var provider: AnyGradientBox
    
    public init(_ gradient: Gradient) {
        assertUnimplemented()
    }
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public static func == (lhs: AnyGradient, rhs: AnyGradient) -> Bool {
        assertUnimplemented()
    }
    
    public typealias Resolved = Never
}

@_inheritsConvenienceInitializers @_hasMissingDesignatedInitializers @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@usableFromInline
package class AnyGradientBox : AnyShapeStyleBox, @unchecked Sendable {
    // TODO
}
