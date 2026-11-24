// 372497ED4F569296C4450147CA418CD0
internal import AttributeGraph
private import _MySwiftUICoreShims
internal import CoreGraphics

extension Subgraph {
    func willInvalidate(isInserted: Bool) {
        self.forEach(isInserted ? [.unknown1, .unknown2] : [.unknown2]) { attribute in
            // $sSo13AGSubgraphRefa7SwiftUIE14willInvalidate10isInsertedySb_tFySo11AGAttributeaXEfU_TA
            let bodyType = attribute._bodyType
            
            if let conformance = InvalidatableAttributeDescriptor.cachedConformance(of: bodyType) {
                conformance
                    .unsafeExistentialMetatype((any InvalidatableAttribute.Type).self)
                    .willInvalidate(attribute: attribute)
            } else if isInserted, let conformance = RemovableAttributeDescriptor.cachedConformance(of: bodyType) {
                conformance
                    .unsafeExistentialMetatype((any RemovableAttribute.Type).self)
                    .willRemove(attribute: attribute)
            }
        }
    }
    
    func willRemove() {
        forEach(.unknown1) { attribute in
            // $sSo13AGSubgraphRefa7SwiftUIE10willRemoveyyFySo11AGAttributeaXEfU_Tf4nd_n
            let bodyType = attribute._bodyType
            
            guard let conformance = RemovableAttributeDescriptor.cachedConformance(of: bodyType) else {
                return
            }
            
            conformance
                .unsafeExistentialMetatype((any RemovableAttribute.Type).self)
                .willRemove(attribute: attribute)
        }
    }
    
    func didReinsert() {
        forEach(.unknown1) { attribute in
            // $sSo13AGSubgraphRefa7SwiftUIE11didReinsertyyFySo11AGAttributeaXEfU_
            let type = attribute._bodyType
            
            if let conformance = RemovableAttributeDescriptor.cachedConformance(of: type) {
                conformance
                    .unsafeExistentialMetatype((any RemovableAttribute.Type).self)
                    .didReinsert(attribute: attribute)
            }
        }
    }
    
    func addSecondaryChild(_ subgraph: Subgraph) {
        assertUnimplemented()
    }
}

fileprivate struct RemovableAttributeDescriptor : ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer {
        return unsafe _removableAttributeProtocolDescriptor()
    }
    
    nonisolated(unsafe) private static var typeCache: [ObjectIdentifier: TypeConformance<RemovableAttributeDescriptor>] = [:]
    
    static func cachedConformance(of type: Any.Type) -> TypeConformance<RemovableAttributeDescriptor>? {
        Update.assertIsLocked()
        
        if let conformance = unsafe typeCache[ObjectIdentifier(type)] {
            return conformance
        }
        
        // <+196>
        let conformance = conformance(of: type)
        unsafe typeCache[ObjectIdentifier(type)] = conformance
        return conformance
    }
}

fileprivate struct InvalidatableAttributeDescriptor : ProtocolDescriptor {
    static var descriptor: UnsafeRawPointer {
        return unsafe _invalidatableAttributeProtocolDescriptor()
    }
    
    nonisolated(unsafe) private static var typeCache: [ObjectIdentifier: TypeConformance<InvalidatableAttributeDescriptor>] = [:]
    
    static func cachedConformance(of type: Any.Type) -> TypeConformance<InvalidatableAttributeDescriptor>? {
        Update.assertIsLocked()
        
        if let conformance = unsafe typeCache[ObjectIdentifier(type)] {
            return conformance
        }
        
        let conformance = conformance(of: type)
        unsafe typeCache[ObjectIdentifier(type)] = conformance
        return conformance
    }
}

extension Attribute {
    var toOptional: Attribute<T?> {
        return Attribute<T?>(ToOptional(data: self))
    }
}

fileprivate struct ToOptional<T> : AsyncAttribute, Rule {
    @Attribute private(set) var data: T
    
    var value: T? {
        return self.data
    }
}

extension Attribute where T == ViewGeometry {
    func origin() -> Attribute<CGPoint> {
        return self[keyPath: \.origin]
    }
    
    func size() -> Attribute<ViewSize> {
        return self[keyPath: \.dimensions.size]
    }
}

extension Attribute where T == ViewSize {
    func cgSize() -> Attribute<CGSize> {
        return self[keyPath: \.value]
    }
}

extension Attribute {
    mutating func makeReusable(indirectMap: IndirectAttributeMap) {
        makeReusable(indirectMap: indirectMap, withoutInvalidation: false)
    }
    
    mutating func makeReusable(indirectMap: IndirectAttributeMap, withoutInvalidation: Bool) {
        if let other = indirectMap.map[self.identifier] {
            self = Attribute(identifier: other)
            return
        }
        
        let other = indirectMap.subgraph.apply {
            return self.identifier.createIndirectAttribute3(UInt32(truncatingIfNeeded: MemoryLayout<T>.size), withoutInvalidation ? 1 : 0)
        }
        
        indirectMap.map[self.identifier] = other
        self = Attribute(identifier: other)
    }
    
    func tryToReuse(by other: Attribute<T>, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        tryToReuse(by: other, indirectMap: indirectMap, withoutInvalidation: false, testOnly: testOnly)
    }
    
    func tryToReuse(by other: Attribute<T>, indirectMap: IndirectAttributeMap, withoutInvalidation: Bool, testOnly: Bool) -> Bool {
        /*
         other = x23
         indirectMap = x20
         withoutInvalidation = x24
         testOnly = x25
         self = x26
         T = x21
         */
        // x19
        if let _other = indirectMap.map[self.identifier] {
            if testOnly {
                return true
            } else {
                _other.setIndirectAttribute2(other.identifier, withoutInvalidation ? 1 : 0)
                return true
            }
        }
        
        // <+184>
        Log.graphReuse?.log(level: .debug, "Reuse failed: missing indirection for \(_typeName(T.self, qualified: false))")
        return false
    }
    
    func unsafeBitCast<U>(to type: U.Type) -> Attribute<U> {
        return self.unsafeOffset(at: 0, as: type)
    }
    
    package func syncMainIfReferences<U>(do transform: (T) -> U) -> U {
        // <+204>
        let (value, flags) = self.valueAndFlags(options: [.unknown1])
        
        if flags.contains(.requiresMainThread) {
            var result: U!
            
            withoutActuallyEscaping(transform) { escapingClosure in
                Update.syncMain {
                    result = escapingClosure(value)
                }
            }
            
            return result
        } else {
            return transform(value)
        }
    }
}

extension WeakAttribute {
    package func allowsAsyncUpdate() -> Bool {
        assertUnimplemented()
    }
}

extension TypeID {
    @inline(always)
    func projectEnum(at pointer: UnsafeRawPointer, tag: Int, _ body: (UnsafeRawPointer) -> Void) {
        unsafe projectEnumData(UnsafeMutableRawPointer(mutating: pointer))
        unsafe body(pointer)
        unsafe injectEnumTag(UInt32(truncatingIfNeeded: tag), UnsafeMutableRawPointer(mutating: pointer))
    }
}
