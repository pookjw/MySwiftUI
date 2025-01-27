import AttributeGraph

package struct UniqueID: Hashable {
    private let value: Int
    
    package static var invalid: UniqueID {
        UniqueID(value: 0)
    }
    
    package init() {
        value = AGMakeUniqueID()
    }
    
    package init(value: Int) {
        self.value = value
    }
}
