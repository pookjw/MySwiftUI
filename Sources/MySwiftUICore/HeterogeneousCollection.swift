// 89AD1D9EE1555AAC4E0F57DBF89A1DFC

struct HeterogeneousCollection {
    private let subCollections: ContiguousArray<AbstractHomogeneousCollection>
    private let runningTotal: [UInt32]
    private var lookupTableCache: HeterogeneousIndexLookupTable? = nil
    
    var count: Int {
        assertUnimplemented()
    }
    
    init(_ subCollections: ContiguousArray<AbstractHomogeneousCollection> = []) {
        // self -> x0 -> x20
        assertUnimplemented()
    }
    
    func element(at index: Int) -> Any {
        assertUnimplemented()
    }
    
    func forEach(_: (Any) -> Void) {
        assertUnimplemented()
    }
    
    func map<T>(_: (Any) -> T) -> [T] {
        assertUnimplemented()
    }
    
    func asAnyHashable2() -> [AnyHashable2] {
        assertUnimplemented()
    }
    
    func difference(to collection: inout HeterogeneousCollection) -> DiffResult {
        assertUnimplemented()
    }
    
    fileprivate func differenceWithDuplicates(to collection: HeterogeneousCollection) -> DiffResult {
        assertUnimplemented()
    }
}
