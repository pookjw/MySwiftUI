private import AttributeGraph

package struct UniqueID : Hashable, Sendable {
    private let value: Int
    
    package init() {
        value = AGMakeUniqueID()
    }
    
    static var invalid: UniqueID {
        return UniqueID(value: 0)
    }
    
    @inline(always) // 원래 없음
    fileprivate init(value: Int) {
        self.value = value
    }
}
