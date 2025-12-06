public import CoreGraphics

@frozen public struct _VStackLayout {
  public var alignment: HorizontalAlignment
    public var spacing: CGFloat?
    
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
}

extension _VStackLayout: _VariadicView_AnyImplicitRoot {
    public static func _makeViewList(root: _GraphValue<_VStackLayout>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    var implicitRoot: _VStackLayout {
        fatalError("TODO")
    }
    
    public static func _makeView(root: _GraphValue<_VStackLayout>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public var body: Never {
        fatalError("TODO")
    }
}
