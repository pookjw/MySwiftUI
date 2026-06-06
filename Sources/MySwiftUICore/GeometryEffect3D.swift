internal import Spatial

protocol GeometryEffect3D : ViewModifier, VisualEffect {
    func effectValue(size: Size3D) -> AffineTransform3D
    static var _affectsLayout: Bool { get }
}

extension GeometryEffect3D {
    public typealias Body = Never
    
    static var _affectsLayout: Bool {
        return true
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeVisualEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return Self.makeGeometryEffect3D(modifier: effect, inputs: inputs, body: body)
    }
    
    nonisolated static func makeGeometryEffect3D(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return Self._makeVisualEffect(effect: modifier, inputs: inputs, body: body)
    }
}
