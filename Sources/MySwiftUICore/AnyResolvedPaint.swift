package class AnyResolvedPaint {
    package func visit<T : ResolvedPaintVisitor>(_ visitor: inout T) {
        // noop
    }
}

final class _AnyResolvedPaint : AnyResolvedPaint {
    override func visit<T>(_ visitor: inout T) {
        assertUnimplemented()
    }
}

package protocol ResolvedPaintVisitor {
    func visitPaint<T : ResolvedPaint>(_ point: T)
}
