public import CoreGraphics

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public protocol RoundedRectangularShape : InsettableShape {
    typealias Corners = RoundedRectangularShapeCorners
    func corners(in size: CGSize?) -> Self.Corners?
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct RoundedRectangularShapeCorners : Sendable, Hashable, Animatable {
    public var topLeading: Edge.Corner.Style
    public var bottomLeading: Edge.Corner.Style
    public var topTrailing: Edge.Corner.Style
    public var bottomTrailing: Edge.Corner.Style
    
    public init(topLeading: Edge.Corner.Style = 0, topTrailing: Edge.Corner.Style = 0, bottomLeading: Edge.Corner.Style = 0, bottomTrailing: Edge.Corner.Style = 0) {
        assertUnimplemented()
    }
    
    public init(all: Edge.Corner.Style) {
        assertUnimplemented()
    }
    
    public static func fixed(_ radius: CGFloat) -> RoundedRectangularShapeCorners {
        assertUnimplemented()
    }
    
    public static var concentric: RoundedRectangularShapeCorners {
        assertUnimplemented()
    }
    
    public static func concentric(minimum: Edge.Corner.Style? = nil) -> RoundedRectangularShapeCorners {
        assertUnimplemented()
    }
    
    public subscript(corner: Edge.Corner) -> Edge.Corner.Style {
        assertUnimplemented()
    }
    
    public var animatableData: RoundedRectangularShapeCorners.AnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public struct AnimatableData : VectorArithmetic, Sendable {
        public mutating func scale(by rhs: Double) {
            assertUnimplemented()
        }
        
        public var magnitudeSquared: Double {
            assertUnimplemented()
        }
        
        public static var zero: RoundedRectangularShapeCorners.AnimatableData {
            assertUnimplemented()
        }
        
        public static func + (lhs: RoundedRectangularShapeCorners.AnimatableData, rhs: RoundedRectangularShapeCorners.AnimatableData) -> RoundedRectangularShapeCorners.AnimatableData {
            assertUnimplemented()
        }
        
        public static func - (lhs: RoundedRectangularShapeCorners.AnimatableData, rhs: RoundedRectangularShapeCorners.AnimatableData) -> RoundedRectangularShapeCorners.AnimatableData {
            assertUnimplemented()
        }
        
        public static func == (a: RoundedRectangularShapeCorners.AnimatableData, b: RoundedRectangularShapeCorners.AnimatableData) -> Bool {
            assertUnimplemented()
        }
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension View {
    @inlinable nonisolated public func containerShape(_ shape: some RoundedRectangularShape) -> some View {
        return modifier(_ContainerRoundedRectangularShapeModifier(shape: shape))
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct _ContainerRoundedRectangularShapeModifier<Shape> where Shape : RoundedRectangularShape {
    public var shape: Shape
    
    public init(shape: Shape) {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_ContainerRoundedRectangularShapeModifier<Shape>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, macOS 26.0, *)
    public typealias Body = Never
}

extension _ContainerRoundedRectangularShapeModifier : MultiViewModifier, PrimitiveViewModifier {}
