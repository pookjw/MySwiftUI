public import CoreGraphics

public protocol GeometryEffect : Animatable, ViewModifier, _RemoveGlobalActorIsolation where Self.Body == Never {
    func effectValue(size: CGSize) -> ProjectionTransform
    static var _affectsLayout: Bool { get }
}

extension GeometryEffect {
    public static var _affectsLayout: Bool {
        assertUnimplemented()
    }
}

extension GeometryEffect {
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        return Self.makeMultiViewList(modifier: modifier, inputs: inputs, body: body)
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

//extension GeometryEffect {
//    @inlinable public func ignoredByLayout() -> _IgnoredByLayoutEffect<Self> {
//        return _IgnoredByLayoutEffect(self)
//    }
//}
