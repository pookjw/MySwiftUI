struct TextJustification : Hashable, Sendable, CodableByProxy {
    var storage: TextJustification.Storage
    
    static var none: TextJustification {
        assertUnimplemented()
    }
    
    static var full: TextJustification {
        assertUnimplemented()
    }
    
    static func full(allLines: Bool, flexible: Bool) -> TextJustification {
        assertUnimplemented()
    }
    
    static var stretched: TextJustification {
        assertUnimplemented()
    }
    
    static func stretched(_ flexible: Bool) -> TextJustification {
        assertUnimplemented()
    }
    
    static func == (lhs: TextJustification, rhs: TextJustification) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    var codingProxy: TextJustification.Storage {
        assertUnimplemented()
    }
    
    static func unwrap(codingProxy: TextJustification.Storage) -> TextJustification {
        assertUnimplemented()
    }
}

extension TextJustification {
    enum Storage : Hashable, Sendable, Codable {
        case none
        case full(TextJustification.Full)
        
        static func == (lhs: TextJustification.Storage, rhs: TextJustification.Storage) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
}

extension TextJustification {
    struct Full : Hashable, Sendable, Codable {
        // TODO
        
        static func == (lhs: TextJustification.Full, rhs: TextJustification.Full) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
}
