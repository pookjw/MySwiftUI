package protocol Serializable {
    func serialize(to encoder: any Encoder) throws
    static func deserialize(from decoder: Decoder) throws -> Self
}

protocol CodableSerializable : Codable, Serializable {}

extension CodableSerializable {
    func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    static func deserialize(from decoder: Decoder) throws -> Self {
        assertUnimplemented()
    }
}

protocol EmptySerializable : Serializable {
    init()
}

extension EmptySerializable {
    func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    static func deserialize(from decoder: Decoder) throws -> Self {
        assertUnimplemented()
    }
}
