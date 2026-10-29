public import CoreGraphics

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct ConcentricRectangle : Shape, Animatable {
    public init() {
        assertUnimplemented()
    }
    
    public init(corners: Edge.Corner.Style, isUniform: Bool = false) {
        assertUnimplemented()
    }
    
    public init(topLeadingCorner: Edge.Corner.Style = .concentric, topTrailingCorner: Edge.Corner.Style = .concentric, bottomLeadingCorner: Edge.Corner.Style = .concentric, bottomTrailingCorner: Edge.Corner.Style = .concentric) {
        assertUnimplemented()
    }
    
    public init(uniformTopCorners: Edge.Corner.Style = .concentric, uniformBottomCorners: Edge.Corner.Style = .concentric) {
        assertUnimplemented()
    }
    
    public init(uniformLeadingCorners: Edge.Corner.Style = .concentric, uniformTrailingCorners: Edge.Corner.Style = .concentric) {
        assertUnimplemented()
    }
    
    public init(uniformTopCorners: Edge.Corner.Style = .concentric, bottomLeadingCorner: Edge.Corner.Style = .concentric, bottomTrailingCorner: Edge.Corner.Style = .concentric) {
        assertUnimplemented()
    }
    
    public init(uniformBottomCorners: Edge.Corner.Style = .concentric, topLeadingCorner: Edge.Corner.Style = .concentric, topTrailingCorner: Edge.Corner.Style = .concentric) {
        assertUnimplemented()
    }
    
    public init(uniformLeadingCorners: Edge.Corner.Style = .concentric, topTrailingCorner: Edge.Corner.Style = .concentric, bottomTrailingCorner: Edge.Corner.Style = .concentric) {
        assertUnimplemented()
    }
    
    public init(uniformTrailingCorners: Edge.Corner.Style = .concentric, topLeadingCorner: Edge.Corner.Style = .concentric, bottomLeadingCorner: Edge.Corner.Style = .concentric) {
        assertUnimplemented()
    }
    
    nonisolated public func path(in rect: CGRect) -> Path {
        assertUnimplemented()
    }
    
    public var animatableData: ConcentricRectangle.AnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public struct AnimatableData : Equatable, VectorArithmetic, Sendable {
        public mutating func scale(by rhs: Double) {
            assertUnimplemented()
        }
        
        public var magnitudeSquared: Double {
            assertUnimplemented()
        }
        
        public static var zero: ConcentricRectangle.AnimatableData {
            assertUnimplemented()
        }
        
        public static func + (lhs: ConcentricRectangle.AnimatableData, rhs: ConcentricRectangle.AnimatableData) -> ConcentricRectangle.AnimatableData {
            assertUnimplemented()
        }
        
        public static func - (lhs: ConcentricRectangle.AnimatableData, rhs: ConcentricRectangle.AnimatableData) -> ConcentricRectangle.AnimatableData {
            assertUnimplemented()
        }
        
        public static func == (a: ConcentricRectangle.AnimatableData, b: ConcentricRectangle.AnimatableData) -> Bool {
            assertUnimplemented()
        }
    }
    
    @available(iOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, macOS 26.0, *)
    public typealias Body = _ShapeView<ConcentricRectangle, ForegroundStyle>
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Shape where Self == ConcentricRectangle {
    @_alwaysEmitIntoClient public static func rect(corners: Edge.Corner.Style, isUniform: Bool = false) -> Self { .init(corners: corners, isUniform: isUniform) }
    
    @_alwaysEmitIntoClient public static func rect(topLeadingCorner: Edge.Corner.Style, topTrailingCorner: Edge.Corner.Style, bottomLeadingCorner: Edge.Corner.Style, bottomTrailingCorner: Edge.Corner.Style) -> Self {
        .init(
            topLeadingCorner: topLeadingCorner,
            topTrailingCorner: topTrailingCorner,
            bottomLeadingCorner: bottomLeadingCorner,
            bottomTrailingCorner: bottomTrailingCorner
        )
    }
    
    @_alwaysEmitIntoClient public static func rect(uniformTopCorners: Edge.Corner.Style, uniformBottomCorners: Edge.Corner.Style) -> Self {
        .init(
            uniformTopCorners: uniformTopCorners,
            uniformBottomCorners: uniformBottomCorners
        )
    }
    
    @_alwaysEmitIntoClient public static func rect(uniformLeadingCorners: Edge.Corner.Style, uniformTrailingCorners: Edge.Corner.Style) -> Self {
        .init(
            uniformLeadingCorners: uniformLeadingCorners,
            uniformTrailingCorners: uniformTrailingCorners
        )
    }
    
    @_alwaysEmitIntoClient public static func rect(uniformTopCorners: Edge.Corner.Style, bottomLeadingCorner: Edge.Corner.Style, bottomTrailingCorner: Edge.Corner.Style) -> Self {
        .init(
            uniformTopCorners: uniformTopCorners,
            bottomLeadingCorner: bottomLeadingCorner,
            bottomTrailingCorner: bottomTrailingCorner
        )
    }
    
    @_alwaysEmitIntoClient public static func rect(uniformBottomCorners: Edge.Corner.Style, topLeadingCorner: Edge.Corner.Style, topTrailingCorner: Edge.Corner.Style) -> Self {
        .init(
            uniformBottomCorners: uniformBottomCorners,
            topLeadingCorner: topLeadingCorner,
            topTrailingCorner: topTrailingCorner
        )
    }
    
    @_alwaysEmitIntoClient public static func rect(uniformLeadingCorners: Edge.Corner.Style, topTrailingCorner: Edge.Corner.Style, bottomTrailingCorner: Edge.Corner.Style) -> Self {
        .init(
            uniformLeadingCorners: uniformLeadingCorners,
            topTrailingCorner: topTrailingCorner,
            bottomTrailingCorner: bottomTrailingCorner
        )
    }
    
    @_alwaysEmitIntoClient public static func rect(uniformTrailingCorners: Edge.Corner.Style, topLeadingCorner: Edge.Corner.Style, bottomLeadingCorner: Edge.Corner.Style) -> Self {
        .init(
            uniformTrailingCorners: uniformTrailingCorners,
            topLeadingCorner: topLeadingCorner,
            bottomLeadingCorner: bottomLeadingCorner
        )
    }
}

extension ConcentricRectangle {
    struct Uniformity {
        // TODO
    }
}
