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
        /*
         modifier -> x0 -> w28
         inputs -> x1 -> x21
         body -> x2/x3 -> x22/x23
         */
        if (Trait.self == LayoutPriorityTraitKey.self) && !inputs.options.contains(.layoutPriorityIsTrait) {
            // <+108>
            let layoutAttribute = modifier.unsafeBitCast(to: LayoutPriorityLayout.self)
            
            let shouldRecordTree = Subgraph.shouldRecordTree
            if shouldRecordTree {
                Subgraph.beginTreeElement(value: layoutAttribute.value, flags: 1)
            }
            
            var outputs = body(_Graph(), inputs)
            outputs.multiModifier(layoutAttribute, inputs: inputs)
            
            if shouldRecordTree {
                Subgraph.endTreeElement(value: layoutAttribute.value)
            }
            
            return outputs
        } else {
            // <+276>
            // x29 - 0xe8
            var copy_1 = inputs
            let addTrait = _TraitWritingModifier.AddTrait(
                modifier: modifier.value,
                _traits: OptionalAttribute(inputs.$traits)
            )
            let addTraitAttribute = Attribute(addTrait)
            copy_1.$traits = addTraitAttribute
            copy_1.addTraitKey(Trait.self)
            return body(_Graph(), copy_1)
        }
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
        private(set) var _traits: OptionalAttribute<ViewTraitCollection>
        
        var traits: ViewTraitCollection? {
            return self._traits.wrappedValue
        }
        
        var value: ViewTraitCollection {
            // x24
            var traits = self.traits ?? ViewTraitCollection()
            traits[Trait.self] = self.modifier.value
            return traits
        }
    }
}

extension View {
    @inlinable nonisolated public func _trait<K>(_ key: K.Type, _ value: K.Value) -> some View where K : _ViewTraitKey {
        return modifier(_TraitWritingModifier<K>(value: value))
    }
}
