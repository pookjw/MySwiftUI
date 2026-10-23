package class AnyResolvedPaint {
    package var protobufPaint: Any? {
        assertUnimplemented()
    }

    package func isEqual(to other: AnyResolvedPaint) -> Bool {
        assertUnimplemented()
    }

    package func encode(to encoder: inout ProtobufEncoder) throws {
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
    
    package func visit<T : ResolvedPaintVisitor>(_ visitor: inout T) {
        // noop
    }
}

final class _AnyResolvedPaint<P : ResolvedPaint> : AnyResolvedPaint {
    let paint: P

    override var protobufPaint: Any? {
        assertUnimplemented()
    }

    override func isEqual(to other: AnyResolvedPaint) -> Bool {
        assertUnimplemented()
    }

    override func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    nonisolated init(_ paint: P) {
        self.paint = paint
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
    
    override func visit<T : ResolvedPaintVisitor>(_ visitor: inout T) {
        visitor.visitPaint(self.paint)
    }
}

package protocol ResolvedPaintVisitor {
    mutating func visitPaint<T : ResolvedPaint>(_ paint: T)
}
