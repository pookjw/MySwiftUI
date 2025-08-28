#warning("TODO")
internal import AttributeGraph
internal import CoreGraphics

struct ViewGeometry {
    var origin: CGPoint
    var dimensions: ViewDimensions
}

struct RootGeometry: Rule {
    var value: ViewGeometry {
        fatalError("TODO")
    }
}

public struct ViewDimensions {
    let guideComputer: LayoutComputer
    var size: ViewSize
}
