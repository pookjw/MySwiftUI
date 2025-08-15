#warning("TODO")
private import AttributeGraph

package struct UniqueID {
    private let value: Int
    
    @inlinable
    package init() {
        value = AGMakeUniqueID()
    }
    
    @inlinable
    package init(value: Int) {
        self.value = value
    }
}
