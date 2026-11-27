protocol ViewTransformable {
    mutating func convert(to space: CoordinateSpace, transform: ViewTransform)
    mutating func convert(from space: CoordinateSpace, transform: ViewTransform)
    mutating func convertGlobal(to space: CoordinateSpace, transform: ViewTransform)
    mutating func convertGlobal(from space: CoordinateSpace, transform: ViewTransform)
}

extension ViewTransformable {
    mutating func convert(from space: CoordinateSpace, to placementContext: _PositionAwarePlacementContext) {
        assertUnimplemented()
    }
    
    mutating func convert(from placementContext: _PositionAwarePlacementContext, to space: CoordinateSpace) {
        assertUnimplemented()
    }
}
