// 0EC4D15D4D4D8FD0340271BA6BA4D1B4
package import AttributeGraph

package struct ScrapeableID : Hashable, GraphReusable {
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
        assertUnimplemented()
    }
    
    package func tryToReuse(by: ScrapeableID, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        assertUnimplemented()
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
    
    fileprivate struct ScrapeableParentID : ViewInput {
        static var defaultValue: ScrapeableID {
            return ScrapeableID(value: 0)
        }
    }
}

extension _ViewListInputs {
    var scrapeableParentID: ScrapeableID {
        get {
            return self.base[_ViewInputs.ScrapeableParentID.self]
        }
        set {
            self.base[_ViewInputs.ScrapeableParentID.self] = newValue
        }
        _modify {
            yield &self.base[_ViewInputs.ScrapeableParentID.self]
        }
    }
}

package protocol ScrapeableAttribute : _AttributeBody {
    static func scrapeContent(from attribute: AnyAttribute) -> ScrapeableContent.Item?
}

package struct ScrapeableContent {
    // TODO
}

extension ScrapeableContent {
    package enum Content {
        // TODO
    }
    
    package struct Item {
        // TODO
    }
}
