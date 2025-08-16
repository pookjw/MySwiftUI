#warning("TODO")

package protocol GraphInput: PropertyKey {
    static var isTriviallyReusable: Bool {
        get
    }
    
    static func makeReusable(indirectMap: IndirectAttributeMap, value: inout Self.Value) -> any GraphInput
    static func tryToReuse(_ value: Self.Value, by: Self.Value, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
}

extension GraphInput {
    package static var isTriviallyReusable: Bool {
        return false
    }
    
    package static func makeReusable(indirectMap: IndirectAttributeMap, value: inout Self.Value) -> any GraphInput {
        fatalError("TODO")
    }
    
    package static func tryToReuse(_ value: Self.Value, by: Self.Value, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        return false
    }
}

extension GraphInput where Self.Value: GraphReusable {
    package static var isTriviallyReusable: Bool {
        fatalError("TODO")
    }
    
    package static func makeReusable(indirectMap: IndirectAttributeMap, value: inout Self.Value) -> any GraphInput {
        fatalError("TODO")
    }
    
    package static func tryToReuse(_ value: Self.Value, by: Self.Value, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
}

package protocol GraphReusable {
    func makeReusable(indirectMap: IndirectAttributeMap)
    func tryToReuse(by: Self, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
    static var isTriviallyReusable: Bool {
        get
    }
}

extension GraphReusable {
    package static var isTriviallyReusable: Bool {
        return false
    }
}
