
protocol Paint : ShapeStyle {
    associatedtype ResolvedPaintType
}

package protocol ResolvedPaint : Equatable, Animatable, ProtobufEncodableMessage {
    var isCALayerCompatible: Bool { get }
    // TOOD
}
