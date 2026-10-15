package class AnyResolvedPaint {
    package var isOpaque: Bool {
        return false
    }
    
    package func visit<T : ResolvedPaintVisitor>(_ visitor: inout T) {
        // noop
    }
}

final class _AnyResolvedPaint<P : ResolvedPaint> : AnyResolvedPaint {
    let paint: P
    
    init(_ paint: P) {
        self.paint = paint
    }
    
    override var isOpaque: Bool {
        assertUnimplemented()
    }
    
    override func visit<T>(_ visitor: inout T) {
        assertUnimplemented()
    }
}

package protocol ResolvedPaintVisitor {
    func visitPaint<T : ResolvedPaint>(_ point: T)
}
