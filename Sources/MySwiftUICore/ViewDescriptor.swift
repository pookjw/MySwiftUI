// 1ABF77B82C037C602A176AE349787FED
private import _MySwiftUIShims

struct ViewDescriptor : TupleDescriptor{
    static var descriptor: UnsafeRawPointer {
        return unsafe _viewProtocolDescriptor()
    }
    
    nonisolated(unsafe) static var typeCache: [ObjectIdentifier: TupleTypeDescription<ViewDescriptor>] = [:]
}

extension ViewDescriptor : ConditionalProtocolDescriptor {
    nonisolated(unsafe) fileprivate static var conditionalCache: [ObjectIdentifier: ConditionalTypeDescriptor<ViewDescriptor>] = [:]
    
    static func fetchConditionalType(key: ObjectIdentifier) -> ConditionalTypeDescriptor<ViewDescriptor>? {
        return unsafe conditionalCache[key]
    }
    
    static func insertConditionalType(key: ObjectIdentifier, value: ConditionalTypeDescriptor<ViewDescriptor>) {
        unsafe conditionalCache[key] = value
    }
}
