// A66FCB65C49D586C0CA23AF611BF2C2B
package protocol CodableByProxy : Serializable {
    associatedtype CodingProxy : Codable
    var codingProxy: CodingProxy { get }
    static func unwrap(codingProxy: CodingProxy) -> Self
}

extension CodableByProxy {
    package func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    package static func deserialize(from decoder: any Decoder) throws -> Self {
        assertUnimplemented()
    }
}

extension CodableByProxy where CodingProxy : CodableProxy, CodingProxy.Base == Self {
    package static func unwrap(codingProxy: CodingProxy) -> Self {
        assertUnimplemented()
    }
}

extension Optional: Serializable where Wrapped: CodableByProxy {
    package func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    package static func deserialize(from decoder: any Decoder) throws -> Self {
        assertUnimplemented()
    }
}

extension Optional : CodableByProxy where Wrapped : CodableByProxy {
    package var codingProxy: CodableOptional<Wrapped> {
        assertUnimplemented()
    }
    
    package static func unwrap(codingProxy: CodableOptional<Wrapped>) -> Optional<Wrapped> {
        assertUnimplemented()
    }
}

extension Array: Serializable where Element : CodableByProxy {
    package func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    package static func deserialize(from decoder: any Decoder) throws -> Self {
        assertUnimplemented()
    }
}

extension Array : CodableByProxy where Element : CodableByProxy {
    package var codingProxy: [Element.CodingProxy] {
        assertUnimplemented()
    }
    
    package static func unwrap(codingProxy: [Element.CodingProxy]) -> [Element] {
        assertUnimplemented()
    }
}

package protocol CodableProxy : Codable {
    associatedtype Base
    var base: Base { get }
}

package struct CodableOptional<T> : Codable {
    // TODO
}

struct RawRepresentableProxy<T : RawRepresentable> : Codable where T.RawValue : Codable {
    let base: T
    
    init(base: T) {
        self.base = base
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

@propertyWrapper
struct ProxyCodable<T : Serializable> : Codable {
    var wrappedValue: T
    
    var projectedValue: ProxyCodable<T> {
        return self
    }
    
    init(_ value: T) {
        self.wrappedValue = value
    }
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
}

extension ProxyCodable : Equatable where T : Equatable {}
extension ProxyCodable : Hashable where T : Hashable {}

extension ProxyCodable : AccessibilityValue where T : AccessibilityValue {}
