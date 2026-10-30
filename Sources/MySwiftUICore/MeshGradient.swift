@available(iOS 18.0, macOS 15.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
public struct MeshGradient : ShapeStyle, Equatable, Sendable {
    public enum Locations : Equatable, Sendable {
        case points([SIMD2<Float>])
        case bezierPoints([MeshGradient.BezierPoint])

        public static func == (a: MeshGradient.Locations, b: MeshGradient.Locations) -> Bool {
            assertUnimplemented()
        }
    }

    public enum Colors : Equatable, Sendable {
        case colors([Color])
        case resolvedColors([Color.Resolved])

        public static func == (a: MeshGradient.Colors, b: MeshGradient.Colors) -> Bool {
            assertUnimplemented()
        }
    }

    @frozen public struct BezierPoint : Equatable, Sendable {
        public var position: SIMD2<Float>

        public var leadingControlPoint: SIMD2<Float>

        public var topControlPoint: SIMD2<Float>

        public var trailingControlPoint: SIMD2<Float>

        public var bottomControlPoint: SIMD2<Float>

        @_alwaysEmitIntoClient public init(position: SIMD2<Float>, leadingControlPoint: SIMD2<Float>, topControlPoint: SIMD2<Float>, trailingControlPoint: SIMD2<Float>, bottomControlPoint: SIMD2<Float>) {
            self.position = position
            self.leadingControlPoint = leadingControlPoint
            self.topControlPoint = topControlPoint
            self.trailingControlPoint = trailingControlPoint
            self.bottomControlPoint = bottomControlPoint
        }

        public static func == (a: MeshGradient.BezierPoint, b: MeshGradient.BezierPoint) -> Bool {
            assertUnimplemented()
        }
    }

    public var width: Int

    public var height: Int

    public var locations: MeshGradient.Locations

    public var colors: MeshGradient.Colors

    public var background: Color

    public var smoothsColors: Bool

    public var colorSpace: Gradient.ColorSpace

    public init(width: Int, height: Int, locations: MeshGradient.Locations, colors: MeshGradient.Colors, background: Color = .clear, smoothsColors: Bool = true, colorSpace: Gradient.ColorSpace = .device) {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient public init(width: Int, height: Int, points: [SIMD2<Float>], colors: [Color], background: Color = .clear, smoothsColors: Bool = true, colorSpace: Gradient.ColorSpace = .device) {
        self.init(width: width, height: height, locations: .points(points),
            colors: .colors(colors), background: background,
            smoothsColors: smoothsColors, colorSpace: colorSpace)
    }

    @_alwaysEmitIntoClient public init(width: Int, height: Int, points: [SIMD2<Float>], resolvedColors: [Color.Resolved], background: Color = .clear, smoothsColors: Bool = true, colorSpace: Gradient.ColorSpace = .device) {
        self.init(width: width, height: height, locations: .points(points),
            colors: .resolvedColors(resolvedColors), background: background,
            smoothsColors: smoothsColors, colorSpace: colorSpace)
    }

    @_alwaysEmitIntoClient public init(width: Int, height: Int, bezierPoints: [MeshGradient.BezierPoint], colors: [Color], background: Color = .clear, smoothsColors: Bool = true, colorSpace: Gradient.ColorSpace = .device) {
        self.init(width: width, height: height,
            locations: .bezierPoints(bezierPoints), colors: .colors(colors),
            background: background, smoothsColors: smoothsColors,
            colorSpace: colorSpace)
    }

    @_alwaysEmitIntoClient public init(width: Int, height: Int, bezierPoints: [MeshGradient.BezierPoint], resolvedColors: [Color.Resolved], background: Color = .clear, smoothsColors: Bool = true, colorSpace: Gradient.ColorSpace = .device) {
        self.init(width: width, height: height,
            locations: .bezierPoints(bezierPoints),
            colors: .resolvedColors(resolvedColors),
            background: background, smoothsColors: smoothsColors,
            colorSpace: colorSpace)
    }

    public static func == (a: MeshGradient, b: MeshGradient) -> Bool {
        assertUnimplemented()
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Body = _ShapeView<Rectangle, MeshGradient>

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Resolved = Never
}

@available(iOS 18.0, macOS 15.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension MeshGradient : View {}

@available(iOS 18.0, macOS 15.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
extension MeshGradient.BezierPoint : BitwiseCopyable {}

extension MeshGradient {
    public var body: Body {
        assertUnimplemented()
    }
}

extension MeshGradient {
    struct _Paint {
        // TODO
    }
}
