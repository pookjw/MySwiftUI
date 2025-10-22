// 0EC4D15D4D4D8FD0340271BA6BA4D1B4

#warning("TODO")
package import AttributeGraph

package struct ScrapeableID: Hashable, GraphReusable {
    package static var none: ScrapeableID {
        return ScrapeableID(value: 0)
    }
    
    private let value: UInt32
    
    init() {
        self.value = UInt32(AGMakeUniqueID())
    }
    
    fileprivate init(value: UInt32) {
        self.value = value
    }
    
    package func makeReusable(indirectMap: IndirectAttributeMap) {
        fatalError("TODO")
    }
    
    package func tryToReuse(by: ScrapeableID, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
}

extension _ViewInputs {
    package var scrapeableParentID: ScrapeableID {
        get {
            return self[_ViewInputs.ScrapeableParentID.self]
        }
        set {
            self[_ViewInputs.ScrapeableParentID.self] = newValue
        }
        _modify {
            yield &self[_ViewInputs.ScrapeableParentID.self]
        }
    }
    
    fileprivate struct ScrapeableParentID: ViewInput {
        static var defaultValue: ScrapeableID {
            return ScrapeableID(value: 0)
        }
    }
}

package protocol ScrapeableAttribute: _AttributeBody {
    // TODO
}
