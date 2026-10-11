
protocol Paint : ShapeStyle {
    associatedtype ResolvedPaintType
}

package protocol ResolvedPaint : Equatable, Animatable, ProtobufEncodableMessage {
    // TOOD
}
