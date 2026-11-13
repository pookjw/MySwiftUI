protocol CodableByProxy : Serializable {
    associatedtype CodingProxy : Codable
    var codingProxy: CodingProxy { get }
    static func unwrap(codingProxy: CodingProxy) -> Self
}

extension CodableByProxy {
    func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    static func deserialize(from decoder: any Decoder) throws -> Self {
        assertUnimplemented()
    }
}

extension CodableByProxy where CodingProxy : CodableProxy, CodingProxy.Base == Self {
    static func unwrap(codingProxy: CodingProxy) -> Self {
        assertUnimplemented()
    }
}

protocol CodableProxy : Codable {
    associatedtype Base
    var base: Base { get }
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
