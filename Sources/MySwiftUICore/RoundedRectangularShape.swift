public import CoreGraphics

public protocol RoundedRectangularShape {
    typealias Corners = RoundedRectangularShapeCorners
    func corners(in size: CGSize?) -> Self.Corners?
}

public struct RoundedRectangularShapeCorners {
    // TODO
}
