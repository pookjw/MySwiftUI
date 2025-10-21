package struct ScrapeableID: Hashable, GraphReusable {
    package static var none: ScrapeableID {
        return ScrapeableID(value: 0)
    }
    
    private let value: UInt32
    
    package func makeReusable(indirectMap: IndirectAttributeMap) {
        fatalError("TODO")
    }
    
    package func tryToReuse(by: ScrapeableID, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
}
