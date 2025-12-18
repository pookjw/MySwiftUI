@safe struct TypeConformance<T: ProtocolDescriptor>: Sendable {
    @safe nonisolated(unsafe) let storage: (type: Any.Type, conformance: UnsafeRawPointer)
    
    init(storage: (type: Any.Type, conformance: UnsafeRawPointer)) {
        unsafe self.storage = storage
    }
    
    var type: Any.Type {
        return storage.type
    }
    
    func unsafeExistentialMetatype<U>(_: U.Type) -> U {
        return unsafe unsafeBitCast(storage, to: U.self)
    }
    
    var conformance: UnsafeRawPointer {
        return storage.conformance
    }
    
    var metadata: UnsafeRawPointer {
        return unsafe unsafeBitCast(storage.type, to: UnsafeRawPointer.self)
    }
}

extension TypeConformance where T == ViewDescriptor {
    func visitType<Visitor: ViewTypeVisitor>(visitor: UnsafeMutablePointer<Visitor>) {
        unsafe visitor.pointee.visit(type: unsafeBitCast(storage, to: (any View.Type).self))
    }
}
