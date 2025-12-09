#warning("TODO")
internal import AttributeGraph

public struct _GraphValue<Value>: Equatable {
    var value: Attribute<Value>
    
    init(_ value: Attribute<Value>) {
        self.value = value
    }
    
    init<T: Rule>(_ rule: T) where T.Value == Value {
        self.value = Attribute(rule)
    }
    
    init<T: StatefulRule>(_ rule: T) where T.Value == Value {
        self.value = Attribute(rule)
    }
    
    func unsafeBitCast<T>(to type: T.Type = T.self) -> _GraphValue<T> {
        let casted = self.value.identifier.unsafeCast(to: T.self)
        return _GraphValue<T>(casted)
    }
    
    public subscript<U>(keyPath: KeyPath<Value, U>) -> _GraphValue<U> {
        let result = self.value[keyPath: keyPath]
        return _GraphValue<U>(result)
    }
    
    public static func == (lhs: _GraphValue<Value>, rhs: _GraphValue<Value>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension _GraphValue {
    mutating func makeReusable(indirectMap: IndirectAttributeMap) {
        self.value.makeReusable(indirectMap: indirectMap, withoutInvalidation: false)
    }
    
    func tryToReuse(by other: _GraphValue<Value>, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        // self는 w4에 들어감
        self.value.tryToReuse(by: other.value, indirectMap: indirectMap, withoutInvalidation: false, testOnly: testOnly)
    }
}

@available(*, unavailable)
extension _GraphValue: Sendable {}
