protocol ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer { get }
}

extension ProtocolDescriptor {
    static func conformance(of type: any Any.Type) -> TypeConformance<Self>? {
        let descriptor = unsafe descriptor
        
        guard let conformance = unsafe swift_conformsToProtocol(type, descriptor) else {
            return nil
        }
        
        return unsafe TypeConformance(storage: (type: type, conformance: conformance))
    }
}
