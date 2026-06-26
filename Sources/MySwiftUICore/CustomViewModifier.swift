// 2BA0A33A15B7F322F46AFB9D0D1A262D
private import AttributeGraph

@preconcurrency @MainActor public protocol ViewModifier {
    nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
    
    nonisolated static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int?
    
    associatedtype Body : View
    
    @ViewBuilder @MainActor @preconcurrency func body(content: Self.Content) -> Self.Body
    typealias Content = _ViewModifier_Content<Self>
}

extension ViewModifier {
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return Self.makeView(modifier: modifier, inputs: inputs, body: body)
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        return Self.makeViewList(modifier: modifier, inputs: inputs, body: body)
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

extension ViewModifier where Self : Animatable {
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        let attribute = makeAnimatable(value: modifier, inputs: inputs.base)
        return makeView(modifier: _GraphValue(attribute), inputs: inputs, body: body)
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

extension ViewModifier where Self.Body == Swift.Never {
    @MainActor @preconcurrency public func body(content: Self.Content) -> Self.Body {
        return bodyError()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        return body(inputs)
    }
}

extension ViewModifier where Self : _GraphInputsModifier, Self.Body == Never {
//    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
//        assertUnimplemented()
//    }
//    
//    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
//        assertUnimplemented()
//    }
//    
//    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
//        assertUnimplemented()
//    }
}

extension ViewModifier {
    @inlinable nonisolated public func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        return .init(content: self, modifier: modifier)
    }
}

extension ViewModifier {
//    @inlinable nonisolated public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some ViewModifier {
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
    nonisolated static func makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w22
         inputs -> x1 -> x26
         body -> x2/x3 -> x28/x27
         */
        let fields = unsafe DynamicPropertyCache.fields(of: self)
        // x19 + 0x120
        var copy_1 = inputs
        let (_body, buffer) = unsafe Self.makeBody(modifier: modifier, inputs: &copy_1.base, fields: fields)
        
        let input = BodyInputElement.view(body)
        copy_1.append(input, to: BodyInput<Content>.self)
        
        let outputs = Body.makeDebuggableView(view: _body, inputs: copy_1)
        
        if let buffer {
            unsafe buffer.traceMountedProperties(to: modifier, fields: fields)
        }
        
        return outputs
    }
    
    nonisolated static func makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         modifier -> x0 -> w24
         inputs -> x1 -> x26
         body -> x2/x3 -> x28 / sp + 0x8
         */
        let fields = unsafe DynamicPropertyCache.fields(of: self)
        // sp + 0x68
        var copy_1 = inputs
        
        // sp + 0x34 / sp + 0x50
        let (_body, buffer) = unsafe Self.makeBody(modifier: modifier, inputs: &copy_1.base, fields: fields)
        
        let input = BodyInputElement.list(body)
        copy_1.base.append(input, to: BodyInput<Content>.self)
        
        let outputs = Body.makeDebuggableViewList(view: _body, inputs: copy_1)
        
        if let buffer {
            unsafe buffer.traceMountedProperties(to: modifier, fields: fields)
        }
        
        return outputs
    }
    
    nonisolated fileprivate static func makeBody(modifier: _GraphValue<Self>, inputs: inout _GraphInputs, fields: DynamicPropertyCache.Fields) -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer?) {
        precondition(TypeID(self).isValueType, "view modifiers must be value types: \(_typeName(self, qualified: false))")
        
        let body = ModifierBodyAccessor<Self>()
            .makeBody(container: modifier, inputs: &inputs, fields: fields)
        return body
    }
}

extension ViewModifier {
    nonisolated static func makeMultiViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        var outputs = body(_Graph(), inputs)
        outputs.multiModifier(modifier, inputs: inputs)
        return outputs
    }
}

package protocol MultiViewModifier : ViewModifier where Body == Never {
}

extension MultiViewModifier {
    public nonisolated static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        var outputs = body(_Graph(), inputs)
        outputs.multiModifier(modifier, inputs: inputs)
        return outputs
    }
}

package protocol PrimitiveViewModifier : ViewModifier where Body == Never {
} 

public struct _ViewModifier_Content<Modifier> : View where Modifier : ViewModifier {
    nonisolated public static func _makeView(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        return Self.providerMakeView(view: view, inputs: inputs)
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        return Self.providerMakeViewList(view: view, inputs: inputs)
    }
    
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @_alwaysEmitIntoClient nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
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

extension _ViewModifier_Content : ViewModifierContentProvider {
}

extension View {
  @inlinable nonisolated public func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        return .init(content: self, modifier: modifier)
    }
}

public struct PlaceholderContentView<Value> : View {
    nonisolated public static func _makeView(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewInputs) -> _ViewOutputs {
        return providerMakeView(view: view, inputs: inputs)
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Swift.Int? {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension PlaceholderContentView : Sendable {
}

extension _ViewInputs {
    mutating func pushModifierBody<Body>(_ bodyType: Body.Type, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) {
        append(
            BodyInputElement.view(body),
            to: BodyInput<Body>.self
        )
    }
}

fileprivate struct BodyInput<Body> : ViewInput {
    typealias Value = Stack<BodyInputElement>
    
    static var defaultValue: Stack<BodyInputElement> {
        return .empty
    }
}

fileprivate enum BodyInputElement : GraphReusable, Equatable {
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

fileprivate protocol ViewModifierContentProvider : PrimitiveView {
}

extension PlaceholderContentView : ViewModifierContentProvider {}

extension ViewModifierContentProvider {
    nonisolated static func providerMakeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // x29 - 0x100
        var copy_1 = inputs
        // x29 - 0xa0
        let copy_2 = inputs.base
        // sp + 0x80
        let _ = copy_2
        
        if let last = copy_1.popLast(BodyInput<Self>.self) {
            // <+176>
            switch last {
            case .view(let transform):
                // <+576>
                let outputs = transform(_Graph(), copy_1)
                return outputs
            case .list(let transform):
                // <+228>
                return _ViewOutputs.multiView(inputs: copy_1) { graph, inputs in
                    // $s7SwiftUI27ViewModifierContentProvider33_2BA0A33A15B7F322F46AFB9D0D1A262DLLPAAE012providerMakeC04view6inputsAA01_C7OutputsVAA11_GraphValueVyxG_AA01_C6InputsVtFZAA01_c4ListU0VAA01_V0V_ANtcfU_TA
                    /*
                     graph -> x0
                     inputs -> x1
                     copy_2 -> x2
                     transform -> x3/x4 -> x19/x20
                     */
                    let listInputs = _ViewListInputs(
                        inputs.base,
                        implicitID: 0,
                        options: _ViewListInputs.Options(rawValue: copy_2[ViewListOptionsInput.self])
                    )
                    
                    return transform(_Graph(), listInputs)
                }
            }
        } else {
            // <+188>
            return _ViewOutputs()
        }
    }
    
    nonisolated static func providerMakeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        // sp + 0x18
        var copy_1 = inputs
        
        if let last = copy_1.base.popLast(BodyInput<Self>.self) {
            switch last {
            case .view(let transform):
                // <+156>
                return _ViewListOutputs.unaryViewList(viewType: self, inputs: copy_1) { inputs in
                    // $s7SwiftUI22makeSpatialOverlayView9alignment13primaryInputs0H7Outputs09secondaryI04bodyAA01_fJ0V14AttributeGraph0M0VyAA11Alignment3DVG_AA01_fI0VAiqiA01_N0V_AQtctFAiQXEfU0_TA
                    return transform(_Graph(), inputs)
                }
            case .list(let transform):
                // <+128>
                return transform(_Graph(), copy_1)
            }
        } else {
            // <+112>
            return _ViewListOutputs.emptyViewList(inputs: copy_1)
        }
    }
}

fileprivate struct ModifierBodyAccessor<T : ViewModifier>: BodyAccessor {
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
