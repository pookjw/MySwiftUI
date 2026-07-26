struct HashableMetatype<T> : Hashable {
    private let type: T.Type
    
    init(_ type: T.Type) {
        self.type = type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(UInt(bitPattern: ObjectIdentifier(self.type)))
    }
    
    static func == (lhs: HashableMetatype<T>, rhs: HashableMetatype<T>) -> Bool {
        return lhs.type == rhs.type
    }
}
