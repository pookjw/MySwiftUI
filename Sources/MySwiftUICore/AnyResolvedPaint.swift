package import CoreGraphics

package class AnyResolvedPaint {
    package func draw(path: Path, style: PathDrawingStyle, in context: GraphicsContext, bounds: CGRect?) {
        assertUnimplemented()
    }
    
    package var protobufPaint: Any? {
        assertUnimplemented()
    }
    
    package var isClear: Bool {
        assertUnimplemented()
    }
    
    package var isOpaque: Bool {
        return false
    }
    
    package var resolvedGradient: ResolvedGradient? {
        assertUnimplemented()
    }
    
    package var isCALayerCompatible: Bool {
        return false
    }

    package var allowedDynamicRange: Image.DynamicRange {
        assertUnimplemented()
    }
    
    package var contentHeadroom: Float {
        assertUnimplemented()
    }

    package func isEqual(to other: AnyResolvedPaint) -> Bool {
        assertUnimplemented()
    }
    
    package func visit<T : ResolvedPaintVisitor>(_ visitor: inout T) {
        // noop
    }
    
    package func encode(to encoder: Encoder) throws {
        assertUnimplemented()
    } 

    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    init() {}
}

final class _AnyResolvedPaint<P : ResolvedPaint> : AnyResolvedPaint {
    let paint: P
    
    nonisolated init(_ paint: P) {
        self.paint = paint
    }
    
    override func draw(path: Path, style: PathDrawingStyle, in context: GraphicsContext, bounds: CGRect?) {
        assertUnimplemented()
    }
    
    override var protobufPaint: Any? {
        assertUnimplemented()
    }
    
    override var isClear: Bool {
        assertUnimplemented()
    }
    
    override var isOpaque: Bool {
        assertUnimplemented()
    }
    
    override var resolvedGradient: ResolvedGradient? {
        assertUnimplemented()
    }
    
    override var isCALayerCompatible: Bool {
        return self.paint.isCALayerCompatible
    }

    override var allowedDynamicRange: Image.DynamicRange {
        assertUnimplemented()
    }
    
    override var contentHeadroom: Float {
        assertUnimplemented()
    }

    override func isEqual(to other: AnyResolvedPaint) -> Bool {
        assertUnimplemented()
    }
    
    override func visit<T : ResolvedPaintVisitor>(_ visitor: inout T) {
        visitor.visitPaint(self.paint)
    }
    
    override func encode(to encoder: Encoder) throws {
        assertUnimplemented()
    } 

    override func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}

package protocol ResolvedPaintVisitor {
    mutating func visitPaint<T : ResolvedPaint>(_ paint: T)
}
