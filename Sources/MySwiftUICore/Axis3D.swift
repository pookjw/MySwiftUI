enum _Axis3D : Int8, CaseIterable, Hashable {
    case horizontal
    case vertical
    case depth
}

extension _Axis3D : CustomStringConvertible {
    var description: String {
        assertUnimplemented()
    }
}
