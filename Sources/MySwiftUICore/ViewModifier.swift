
@preconcurrency @MainActor public protocol ViewModifier {
    static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
    
    static nonisolated func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int?
    
    associatedtype Body : View
    
    @ViewBuilder @MainActor @preconcurrency func body(content: Self.Content) -> Self.Body
    typealias Content = _ViewModifier_Content<Self>
}

extension ViewModifier {
    public static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
}

extension ViewModifier where Self: Animatable {
    public nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        let attribute = makeAnimatable(value: modifier, inputs: inputs.base)
        return makeView(modifier: _GraphValue(attribute), inputs: inputs, body: body)
    }
    
    public nonisolated static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}

extension ViewModifier where Self.Body == Swift.Never {
    @MainActor @preconcurrency public func body(content: Self.Content) -> Self.Body {
        return bodyError()
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
}

extension ViewModifier where Self : _GraphInputsModifier, Self.Body == Never {
//    public nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
//        fatalError("TODO")
//    }
//    
//    public nonisolated static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
//        fatalError("TODO")
//    }
//    
//    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
//        fatalError("TODO")
//    }
}

extension ViewModifier {
    @inlinable public nonisolated func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        return .init(content: self, modifier: modifier)
    }
}

extension ViewModifier {
//    @inlinable public nonisolated func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some ViewModifier {
//        return _PushPopTransactionModifier(content: self, transform: transform)
//    }
//    
//    @inlinable @MainActor @preconcurrency public func animation(_ animation: Animation?) -> some ViewModifier {
//        return transaction { t in
//            if !t.disablesAnimations {
//                t.animation = animation
//            }
//        }
//    }
}

extension ViewModifier {
    static nonisolated func makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
}

package protocol MultiViewModifier: ViewModifier where Body == Never {
    
}

package protocol PrimitiveViewModifier: ViewModifier where Body == Never {
    
} 

public struct _ViewModifier_Content<Modifier>: View where Modifier: ViewModifier {
    public static nonisolated func _makeView(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @_alwaysEmitIntoClient public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
//        _viewListCount(inputs: inputs) { _ in nil }
        fatalError("TODO")
    }
    
    public var body: some View {
        bodyError()
    }
}

extension ViewModifier {
    func bodyError() -> Never {
        fatalError()
    }
}
