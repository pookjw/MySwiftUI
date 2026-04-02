// 3E2D3733C4CBF57EC1EA761D02CE8317
private import Foundation
private import _DarwinFoundation3._stdlib

package protocol GraphInput : PropertyKey {
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
        assertUnimplemented()
    }
    
    package static func tryToReuse(_ value: Self.Value, by: Self.Value, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        return false
    }
}

extension GraphInput where Self.Value : GraphReusable {
    package static var isTriviallyReusable: Bool {
        assertUnimplemented()
    }
    
    package static func makeReusable(indirectMap: IndirectAttributeMap, value: inout Self.Value) -> any GraphInput {
        assertUnimplemented()
    }
    
    package static func tryToReuse(_ value: Self.Value, by: Self.Value, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
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
    
    package func makeReusable(indirectMap: IndirectAttributeMap) {
        assertUnimplemented()
    }
    
    package func tryToReuse(by: Self, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
}

extension Stack : GraphReusable where Element : GraphReusable {
    func tryToReuse(by: Stack<Element>, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
    }
}

struct GraphReuseOptions : OptionSet {
    var rawValue: Int
    
    static var current: GraphReuseOptions {
        return unsafe overrideValue ?? defaultsValue
    }
    
    static var lazyLayouts: GraphReuseOptions {
        return GraphReuseOptions(rawValue: 1 << 1)
    }
    
    static var viewListContent: GraphReuseOptions {
        return GraphReuseOptions(rawValue: 1 << 2)
    }
    
    static var expandedReuse: GraphReuseOptions {
        return GraphReuseOptions(rawValue: 1 << 3)
    }
    
    static var `default`: GraphReuseOptions {
        return []
    }
    
    nonisolated(unsafe) static var overrideValue: GraphReuseOptions?
    
    fileprivate static let defaultsValue: GraphReuseOptions = {
        if let value = UserDefaults.standard.object(forKey: "GraphReuseOptions") as? Int {
            return GraphReuseOptions(rawValue: value)
        } else if let value = unsafe getenv("SWIFTUI_GRAPH_REUSE_OPTIONS") {
            return unsafe GraphReuseOptions(rawValue: Int(atoi(value)))
        } else {
            return .default
        }
    }()
}

struct ReusableInputs : GraphInput {
    @safe nonisolated(unsafe) static let defaultValue = ReusableInputStorage(filter: BloomFilter(), stack: Stack())
}

struct ReusableInputStorage {
    var filter: BloomFilter
    private(set) var stack: Stack<any GraphInput.Type>
}
