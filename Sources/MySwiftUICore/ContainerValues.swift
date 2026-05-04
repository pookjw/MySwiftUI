// C5395F2C967F1B7CF8C524BFF68CD054
private import AttributeGraph

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct ContainerValues {
    private(set) var base: ViewTraitCollection
    
    init(base: ViewTraitCollection = ViewTraitCollection()) {
        self.base = base
    }
    
    public subscript<Key>(key: Key.Type) -> Key.Value where Key : ContainerValueKey {
        get {
            return base[ContainerValueViewTraitKey<Key>.self]
        }
        set {
            base[ContainerValueViewTraitKey<Key>.self] = newValue
        }
    }
    
    public func tag<V>(for type: V.Type) -> V? where V : Hashable {
        assertUnimplemented()
    }
    
    public func hasTag<V>(_ tag: V) -> Bool where V : Hashable {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension ContainerValues : Sendable {}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public protocol ContainerValueKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension View {
    @_alwaysEmitIntoClient nonisolated public func containerValue<V>(_ keyPath: WritableKeyPath<ContainerValues, V>, _ value: V) -> some View {
        modifier(_ContainerValueWritingModifier(keyPath: keyPath, value: value))
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
@frozen public struct _ContainerValueWritingModifier<Value> {
    public var keyPath: WritableKeyPath<ContainerValues, Value>
    public var value: Value
    
    @_alwaysEmitIntoClient public init(keyPath: WritableKeyPath<ContainerValues, Value>, value: Value) {
        self.keyPath = keyPath
        self.value = value
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_ContainerValueWritingModifier<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<_ContainerValueWritingModifier<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         modifier -> x0 -> w24
         inputs -> x1 -> x23
         body -> x2/x3 -> x20/x21
         */
        // sp + 0x40
        var copy_1 = inputs
        let traits = _ContainerValueWritingModifier<Value>.AddTrait(modifier: modifier.value, _traits: OptionalAttribute(inputs.$traits))
        copy_1.$traits = Attribute(traits)
        return body(_Graph(), copy_1)
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _ContainerValueWritingModifier : Sendable {
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension _ContainerValueWritingModifier : ViewModifier {}


@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension _ContainerValueWritingModifier : PrimitiveViewModifier {}

extension _ContainerValueWritingModifier {
    fileprivate struct AddTrait : Rule, AsyncAttribute {
        @Attribute private(set) var modifier: _ContainerValueWritingModifier<Value>
        private(set) var _traits: OptionalAttribute<ViewTraitCollection>
        
        var traits: ViewTraitCollection? {
            return _traits.wrappedValue
        }
        
        var value: ViewTraitCollection {
            // x29 - 0x58
            var values = ContainerValues(base: self.traits ?? ViewTraitCollection())
            values[keyPath: self.modifier.keyPath] = self.modifier.value
            return values.base
        }
    }
}

struct ContainerValueViewTraitKey<T: ContainerValueKey> : _ViewTraitKey {
    static var defaultValue: T.Value {
        return T.defaultValue
    }
}
