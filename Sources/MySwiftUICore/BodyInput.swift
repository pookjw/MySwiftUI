// 2BA0A33A15B7F322F46AFB9D0D1A262D

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
