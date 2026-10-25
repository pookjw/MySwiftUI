@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    @_alwaysEmitIntoClient nonisolated public func tag<V>(_ tag: V, includeOptional: Bool = true) -> some View where V : Hashable {
        return _trait(TagValueTraitKey<V>.self, .tagged(tag))
            ._trait(
                TagValueTraitKey<V?>.self,
                includeOptional ? .tagged(Optional(tag)) : .untagged)
    }

    @usableFromInline
    @MainActor @preconcurrency internal func tag<V>(_ tag: V) -> some View where V : Hashable {
        assertUnimplemented()
    }
}

@usableFromInline
package struct TagValueTraitKey<V> : _ViewTraitKey where V : Hashable {
    @usableFromInline
    @frozen package enum Value {
        case untagged
        case tagged(V)
    }
    
    @inlinable package static var defaultValue: TagValueTraitKey<V>.Value {
        get { .untagged }
    }
}

@available(*, unavailable)
extension TagValueTraitKey.Value : Sendable {
}

@available(*, unavailable)
extension TagValueTraitKey : Sendable {
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
@frozen public struct _TagTraitWritingModifier<TagValue> where TagValue : Hashable {
    public let tag: TagValue

    public let includeOptional: Bool

    @_alwaysEmitIntoClient public init(tag: TagValue, includeOptional: Bool) {
        self.tag = tag
        self.includeOptional = includeOptional
    }

    nonisolated public static func _makeView(modifier: _GraphValue<_TagTraitWritingModifier<TagValue>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _makeViewList(modifier: _GraphValue<_TagTraitWritingModifier<TagValue>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }

    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }

    @available(iOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, macOS 26.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _TagTraitWritingModifier : Sendable {
}
