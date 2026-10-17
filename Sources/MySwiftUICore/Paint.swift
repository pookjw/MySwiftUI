
protocol Paint : ShapeStyle {
    associatedtype ResolvedPaintType
}

package protocol ResolvedPaint : Equatable, Animatable, ProtobufEncodableMessage {
    var isClear: Bool { get }
    var isOpaque: Bool { get }
    var resolvedGradient: ResolvedGradient? { get }
    var isCALayerCompatible: Bool { get }
    var allowedDynamicRange: Image.DynamicRange { get }
    var contentHeadroom: Float { get }
    func encodePaint(to encoder: inout ProtobufEncoder) throws
}

extension ResolvedPaint {
    package var isClear: Bool {
        assertUnimplemented()
    }
    
    package var isOpaque: Bool {
        assertUnimplemented()
    }
    
    package var resolvedGradient: ResolvedGradient? {
        assertUnimplemented()
    }
    
    package var isCALayerCompatible: Bool {
        assertUnimplemented()
    }
    
    package var allowedDynamicRange: Image.DynamicRange {
        assertUnimplemented()
    }
    
    package var contentHeadroom: Float {
        assertUnimplemented()
    }
    
    package func encodePaint(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}
