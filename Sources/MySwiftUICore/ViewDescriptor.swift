private import _MySwiftUIShims

struct ViewDescriptor {
    static var descriptor: UnsafeRawPointer {
        return _viewProtocolDescriptor();
    }
}

protocol ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer { get }
}

extension ProtocolDescriptor {
    static func conformance(of: Any.Type) -> TypeConformance<Self>? {
        fatalError("TODO")
    }
}

extension ViewDescriptor: TupleDescriptor {
}

extension ViewDescriptor: ConditionalProtocolDescriptor {
    static func fetchConditionalType(key: ObjectIdentifier) -> ConditionalTypeDescriptor<ViewDescriptor>? {
        fatalError("TODO")
    }
    
    static func insertConditionalType(key: ObjectIdentifier, value: ConditionalTypeDescriptor<ViewDescriptor>) {
        fatalError("TODO")
    }
}

protocol TupleDescriptor: ProtocolDescriptor {
}
