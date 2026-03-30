// 2BA0A33A15B7F322F46AFB9D0D1A262D
private import AttributeGraph

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
        return Self.makeView(modifier: modifier, inputs: inputs, body: body)
    }
    
    public static nonisolated func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

extension ViewModifier where Self: Animatable {
    public nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        let attribute = makeAnimatable(value: modifier, inputs: inputs.base)
        return makeView(modifier: _GraphValue(attribute), inputs: inputs, body: body)
    }
    
    public nonisolated static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

extension ViewModifier where Self.Body == Swift.Never {
    @MainActor @preconcurrency public func body(content: Self.Content) -> Self.Body {
        return bodyError()
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

extension ViewModifier where Self : _GraphInputsModifier, Self.Body == Never {
//    public nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
//        assertUnimplemented()
//    }
//    
//    public nonisolated static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
//        assertUnimplemented()
//    }
//    
//    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
//        assertUnimplemented()
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
    static nonisolated func makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w22
         inputs -> x1 -> x26
         body -> x2/x3 -> x28/x27
         */
        let fields = DynamicPropertyCache.fields(of: self)
        // x19 + 0x120
        var copy_1 = inputs
        let (_body, buffer) = Self.makeBody(modifier: modifier, inputs: &copy_1.base, fields: fields)
        
        let input = BodyInputElement.view(body)
        copy_1.append(input, to: BodyInput<Content>.self)
        
        let outputs = Body.makeDebuggableView(view: _body, inputs: copy_1)
        
        if let buffer {
            buffer.traceMountedProperties(to: modifier, fields: fields)
        }
        
        return outputs
    }
    
    fileprivate static nonisolated func makeBody(modifier: _GraphValue<Self>, inputs: inout _GraphInputs, fields: DynamicPropertyCache.Fields) -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer?) {
        precondition(TypeID(self).isValueType, "view modifiers must be value types: \(_typeName(self, qualified: false))")
        
        let body = ModifierBodyAccessor<Self>()
            .makeBody(container: modifier, inputs: &inputs, fields: fields)
        return body
    }
}

package protocol MultiViewModifier: ViewModifier where Body == Never {
    
}

package protocol PrimitiveViewModifier: ViewModifier where Body == Never {
    
} 

public struct _ViewModifier_Content<Modifier>: View where Modifier: ViewModifier {
    public static nonisolated func _makeView(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        return Self.providerMakeView(view: view, inputs: inputs)
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @_alwaysEmitIntoClient public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
//        _viewListCount(inputs: inputs) { _ in nil }
        _assertUnimplemented()
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

extension _ViewModifier_Content: ViewModifierContentProvider {
}

extension View {
  @inlinable public nonisolated func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        return .init(content: self, modifier: modifier)
    }
}

public struct PlaceholderContentView<Value>: View {
    public nonisolated static func _makeView(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewInputs) -> _ViewOutputs {
        return providerMakeView(view: view, inputs: inputs)
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Swift.Int? {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension PlaceholderContentView: Sendable {
}

extension _ViewInputs {
    mutating func pushModifierBody<Body>(_ bodyType: Body.Type, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) {
        append(
            BodyInputElement.view(body),
            to: BodyInput<Body>.self
        )
    }
}

fileprivate struct BodyInput<Body>: ViewInput {
    typealias Value = Stack<BodyInputElement>
    
    static var defaultValue: Stack<BodyInputElement> {
        return .empty
    }
}

fileprivate enum BodyInputElement: GraphReusable, Equatable {
    func makeReusable(indirectMap: IndirectAttributeMap) {
        assertUnimplemented()
    }
    
    func tryToReuse(by: BodyInputElement, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
    
    static func == (lhs: BodyInputElement, rhs: BodyInputElement) -> Bool {
        assertUnimplemented() // _AGCompareValues
    }
    
    case view((_Graph, _ViewInputs) -> _ViewOutputs)
    case list((_Graph, _ViewListInputs) -> _ViewListOutputs)
}

fileprivate protocol ViewModifierContentProvider: PrimitiveView {
}

extension PlaceholderContentView: ViewModifierContentProvider {}

extension ViewModifierContentProvider {
    static nonisolated func providerMakeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // sp + 0x230
        let _ = inputs
        // sp + 0x1d0
        var copy_2 = inputs
        
        if let last = copy_2.popLast(BodyInput<Self>.self) {
            // <+176>
            switch last {
            case .view(let transform):
                // <+664>
                // sp + 0x160
                let copy_3 = copy_2
                // sp + 0x80
                let copy_4 = copy_2
                // sp + 0xe0
                let _ = copy_3
                let outputs = transform(_Graph(), copy_4)
                return outputs
            case .list(let _):
                // <+184>
                assertUnimplemented()
            }
        } else {
            // <+588>
            return _ViewOutputs()
        }
    }
    
    static nonisolated func providerMakeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

fileprivate struct ModifierBodyAccessor<T: ViewModifier>: BodyAccessor {
    typealias Container = T
    typealias Body = T.Body
    
    func updateBody(of container: T, changed: Bool) {
        /*
         container -> x24
         changed -> w1 -> w21
         */
        let unchecked = UncheckedSendable(container)
        if changed {
            MainActor.assumeIsolated { 
                // $s7SwiftUI20ModifierBodyAccessor33_2BA0A33A15B7F322F46AFB9D0D1A262DLLV06updateD02of7changedyx_SbtFyyScMYcXEfU_
                setBody {
                    return unchecked.value.body(content: _ViewModifier_Content<T>())
                }
            }
        }
    }
}
