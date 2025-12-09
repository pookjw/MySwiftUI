// 1ABF77B82C037C602A176AE349787FED
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
    fileprivate static let conditionalCache: [ObjectIdentifier: ConditionalTypeDescriptor<ViewDescriptor>] = [:]
    
    static func fetchConditionalType(key: ObjectIdentifier) -> ConditionalTypeDescriptor<ViewDescriptor>? {
        return conditionalCache[key]
    }
    
    static func insertConditionalType(key: ObjectIdentifier, value: ConditionalTypeDescriptor<ViewDescriptor>) {
        fatalError("TODO")
    }
}

protocol TupleDescriptor: ProtocolDescriptor {
}
