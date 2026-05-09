// 48526BA25CDCBF890FA91D018A5421B4
private import AttributeGraph

@frozen public struct _TraitWritingModifier<Trait : _ViewTraitKey> {
    public let value: Trait.Value
    
    @inlinable public init(value: Trait.Value) {
        self.value = value
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_TraitWritingModifier<Trait>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<_TraitWritingModifier<Trait>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _TraitWritingModifier : Sendable {
}

extension _TraitWritingModifier : ViewModifier {}
extension _TraitWritingModifier : PrimitiveViewModifier {}

extension _TraitWritingModifier {
    fileprivate struct AddTrait : Rule, AsyncAttribute {
        @Attribute private(set) var modifier: _TraitWritingModifier<Trait>
        @OptionalAttribute var traits: ViewTraitCollection?
        
        var value: Trait.Value {
            assertUnimplemented()
        }
    }
}

extension View {
    @inlinable nonisolated public func _trait<K>(_ key: K.Type, _ value: K.Value) -> some View where K : _ViewTraitKey {
        return modifier(_TraitWritingModifier<K>(value: value))
    }
}
