#warning("TODO")

protocol Paint: ShapeStyle {
    associatedtype ResolvedPaintType
}

protocol ResolvedPaint: Equatable, Animatable, ProtobufEncodableMessage {
    
}
