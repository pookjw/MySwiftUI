struct TypeConformance<T: ProtocolDescriptor>: Sendable {
    let storage: (type: Any.Type, conformance: UnsafeRawPointer)
    
    init(storage: (type: Any.Type, conformance: UnsafeRawPointer)) {
        self.storage = storage
    }
    
    var type: Any.Type {
        return storage.type
    }
    
    func unsafeExistentialMetatype<U>(_: U.Type) -> U {
        return unsafeBitCast(storage, to: U.self)
    }
    
    var conformance: UnsafeRawPointer {
        return storage.conformance
    }
    
    var metadata: UnsafeRawPointer {
        return unsafeBitCast(storage.type, to: UnsafeRawPointer.self)
    }
}

extension TypeConformance where T == ViewDescriptor {
    func visitType<Visitor: ViewTypeVisitor>(visitor: UnsafeMutablePointer<Visitor>) {
        visitor.pointee.visit(type: unsafeBitCast(storage, to: (any View.Type).self))
    }
}
