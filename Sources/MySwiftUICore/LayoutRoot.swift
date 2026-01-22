@frozen public struct _LayoutRoot<L>: _VariadicView.UnaryViewRoot where L : Layout {
    @usableFromInline internal var layout: L
    
    @inlinable package init(_ layout: L) {
        self.layout = layout
    }
    
    public static nonisolated func _makeView(root: _GraphValue<_LayoutRoot<L>>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        let layout: _GraphValue<L> = root[{ .of(&$0.layout) }]
        return L._makeLayoutView(root: layout, inputs: inputs, body: body)
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _LayoutRoot : Sendable {
}
