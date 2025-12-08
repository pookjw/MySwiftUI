internal import AttributeGraph
internal import CoreGraphics

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
            return self.identifier.createIndirectAttribute3(UInt32(MemoryLayout<T>.size), withoutInvalidation ? 1 : 0)
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
        if let other = indirectMap.map[self.identifier] {
            if testOnly {
                fatalError("TODO")
            } else {
                fatalError("TODO")
            }
        }
        
        // <+184>
        fatalError("TODO")
    }
}
