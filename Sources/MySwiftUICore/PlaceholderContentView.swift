// 2BA0A33A15B7F322F46AFB9D0D1A262D

public struct PlaceholderContentView<Value>: View {
    public nonisolated static func _makeView(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewInputs) -> _ViewOutputs {
        return providerMakeView(view: view, inputs: inputs)
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<PlaceholderContentView<Value>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Swift.Int? {
        fatalError("TODO")
    }
    
    public typealias Body = Never
}

extension PlaceholderContentView: ViewModifierContentProvider {}

@available(*, unavailable)
extension PlaceholderContentView: Sendable {
}

fileprivate protocol ViewModifierContentProvider: PrimitiveView {
}

extension ViewModifierContentProvider {
    static nonisolated func providerMakeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // sp + 0x230
        var copy_1 = inputs
        // sp + 0x1d0
        var copy_2 = inputs
        
        if let last = copy_2.popLast(BodyInput<Self>.self) {
            // <+176>
            fatalError("TODO")
        } else {
            // <+588>
            fatalError("TODO")
        }
    }
    
    static nonisolated func providerMakeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
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
        fatalError("TODO")
    }
    
    func tryToReuse(by: BodyInputElement, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
    
    static func == (lhs: BodyInputElement, rhs: BodyInputElement) -> Bool {
        fatalError("TODO") // _AGCompareValues
    }
    
    case view((_Graph, _ViewInputs) -> _ViewOutputs)
    case list((_Graph, _ViewListInputs) -> _ViewListOutputs)
}
