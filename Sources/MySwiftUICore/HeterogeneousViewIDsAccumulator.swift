// BC35AC8A4C97141A50E9554AB9488792

struct HeterogeneousViewIDsAccumulator {
    private var collections: ContiguousArray<AbstractHomogeneousCollection> = [] // 0x0
    private var _count: Int = 0 // 0x8
    private var currentCollection: (any AbstractContiguousArray)? = nil // 0x10
    private var currentExplicitID: (any Hashable, isUnary: Bool)? = nil // 0x38
    
    init() {
    }
    
    consuming func finalize() -> HeterogeneousViewIDs {
        // sp + 0x70 (x22)
        var copy_1 = self
        // sp + 0x18
        let copy_2 = copy_1.currentCollection
        
        if let copy_2 {
            // <+116>
            // sp + 0x40
            let copy_3 = copy_2
            
            func append<T : AbstractContiguousArray>(buffer: T) {
                /*
                 buffer -> x0 -> x20
                 self -> x1 -> x19
                 */
                // x21
                let contiguousArray = buffer.contiguousArray
                // x23
                let collection = HomogeneousCollection(contiguousArray)
                copy_1.collections.append(collection)
                copy_1._count += contiguousArray.count
            }
            
            _openExistential(copy_3, do: append)
            
            // <+160>
            copy_1.currentCollection = nil
            // <+284>
        } else {
            // <+244>
            // <+284>
        }
        
        // <+284>
        return HeterogeneousViewIDs(
            collection: HeterogeneousCollection(copy_1.collections)
        )
    }
    
    var count: Int {
        // x22
        let count = self._count
        // sp + 0x8
        let copy_1 = self.currentCollection
        
        if let copy_1 {
            // <+76>
            return count + copy_1.count
        } else {
            // <+152>
            return count
        }
    }
    
    var isEmpty: Bool {
        let count = self._count
        if count != 0 {
            return false
        }
        
        // sp + 0x8
        let copy_1 = self.currentCollection
        
        if let copy_1 {
            return copy_1.isEmpty
        } else {
            return true
        }
    }
    
    mutating func append<T : Hashable>(contentsOf contents: ContiguousArray<T>) {
        /*
         self -> x20 -> x19
         contents -> x0 -> x22
         */
        if
            let currentCollection,
            var array = currentCollection.asContiguousArray(of: T.self)
        {
            // <+104>
            // array -> sp + 0x10
            self.currentCollection = nil
            // contents -> x22 -> sp + 0x38
            array.append(contentsOf: contents)
            self.currentCollection = array
        } else {
            // <+312>
            if let currentCollection {
                // <+364>
                // sp + 0x38
                let copy_1 = currentCollection
                
                func append<U : AbstractContiguousArray>(buffer: U) {
                    /*
                     buffer -> x0 -> x20
                     self -> x1 -> x19
                     */
                    // x21
                    let contiguousArray = buffer.contiguousArray
                    // x22
                    let collection = HomogeneousCollection(contiguousArray)
                    self.collections.append(collection)
                    self._count += contiguousArray.count
                }
                
                _openExistential(copy_1, do: append)
                self.currentCollection = nil
                // <+520>
            } else {
                // <+480>
                // <+520>
            }
            
            // <+520>
            self.currentCollection = contents
        }
    }
    
    mutating func withBuffer<T : Hashable>(of type: T.Type, body: (inout ContiguousArray<T>) -> Void) {
        /*
         self -> x20 -> x22
         body -> x1/x2 -> x23/x24
         */
        var result: ContiguousArray<T>
        
        defer {
            self.currentCollection = result
        }
        
        if
            let currentCollection,
            let array = currentCollection.asContiguousArray(of: T.self)
        {
            // <+104>
            // array -> sp + 0x28
            self.currentCollection = nil
            result = array
            body(&result)
        } else {
            // <+164>
            if let currentCollection {
                // <+216>
                // sp + 0x28
                let copy_1 = currentCollection
                
                func append<U : AbstractContiguousArray>(buffer: U) {
                    /*
                     buffer -> x0 -> x20
                     self -> x1 -> x19
                     */
                    // x21
                    let contiguousArray = buffer.contiguousArray
                    // x22
                    let collection = HomogeneousCollection(contiguousArray)
                    self.collections.append(collection)
                    self._count += self.collections.count
                }
                
                _openExistential(copy_1, do: append)
                self.currentCollection = nil
                result = ContiguousArray()
                body(&result)
            } else {
                // <+332>
                result = ContiguousArray()
                body(&result)
            }
        }
    }
    
    func withExplicitID<T : Hashable>(_: T, isUnary: Bool, body: (inout HeterogeneousViewIDsAccumulator) -> Void) {
        assertUnimplemented()
    }
    
    fileprivate func append(_: _ViewList_ID.Canonical) {
        assertUnimplemented()
    }
    
    func append<T : Hashable>(index: Int32, implicitID: Int32, explicitID: T) {
        assertUnimplemented()
    }
    
    func append(index: Int32, implicitID: Int32) {
        assertUnimplemented()
    }
    
    func append<T : Hashable>(_: TypedCanonicalViewID<T>) {
        assertUnimplemented()
    }
    
    func appendWithUnsafeOutputBuffer<T : Hashable>(explicitID: T.Type, count: Int, body: (HeterogeneousViewIDsAccumulator.UnsafeOutputBuffer) -> Void) {
        assertUnimplemented()
    }
    
    func appendWithoutExplicitID(indices: Range<Int32>, implicitID: Int32) {
        assertUnimplemented()
    }
    
    func append<T : Hashable>(indices: Range<Int32>, implicitID: Int32, explicitID: T) {
        assertUnimplemented()
    }
    
    fileprivate func prepareForAppendWithSingleExplicitID<T : Hashable>(explicitID: T, isUnary: Bool, count: Int, body: (((index: Int32, implicitID: Int32)) -> Void) -> Void) {
        assertUnimplemented()
    }
    
    func appendSlowPath<T : ViewList>(_: T) {
        assertUnimplemented()
    }
}

extension HeterogeneousViewIDsAccumulator {
    struct UnsafeOutputBuffer {
        private let pointer: UnsafeMutableRawPointer
        private let count: Int
        private let stride: Int
        private let indexOffset: Int
        private let implicitIDOffset: Int
        private let explicitIDOffset: Int
    }
}

class AbstractHomogeneousCollection {
    let elementTypeID: ObjectIdentifier
    private let count: Int
    
    init(elementTypeID: ObjectIdentifier, count: Int) {
        self.elementTypeID = elementTypeID
        self.count = count
    }
    
    func isElementEqual(at fromIndex: Int, toElementIn: AbstractHomogeneousCollection, at toIndex: Int) -> Bool {
        preconditionFailure() // abstract
    }
    
    func element(at index: Int) -> Any {
        preconditionFailure() // abstract
    }
    
    func forEach(_ block: (Any) -> Void) {
        preconditionFailure() // abstract
    }
    
    class func makeHomogenousIndexLookupTable(from collection: [(AbstractHomogeneousCollection, precedingElementCount: Int)]) -> HomogeneousLookupTable {
        preconditionFailure() // abstract
    }
    
    func asAnyHashable() -> [AnyHashable] {
        preconditionFailure() // abstract
    }
    
    func asAnyHashable2() -> [AnyHashable2] {
        preconditionFailure() // abstract
    }
}

final class HomogeneousCollection<T> : AbstractHomogeneousCollection {
    private let wrapped: ContiguousArray<T>
    
    init(_ wrapped: ContiguousArray<T>) {
        self.wrapped = wrapped
        super.init(elementTypeID: ObjectIdentifier(T.self), count: wrapped.count)
    }
    
    override func element(at index: Int) -> Any {
        assertUnimplemented()
    }
    
    override func forEach(_ block: (Any) -> Void) {
        assertUnimplemented()
    }
    
    override func isElementEqual(at fromIndex: Int, toElementIn: AbstractHomogeneousCollection, at toIndex: Int) -> Bool {
        assertUnimplemented()
    }
    
    override class func makeHomogenousIndexLookupTable(from collection: [(AbstractHomogeneousCollection, precedingElementCount: Int)]) -> HomogeneousLookupTable {
        assertUnimplemented()
    }
    
    override func asAnyHashable2() -> [AnyHashable2] {
        assertUnimplemented()
    }
}

class HomogeneousLookupTable {
    private let elementTypeID: ObjectIdentifier
    
    var count: Int {
        preconditionFailure() // abstract
    }
    
    init(elementTypeID: ObjectIdentifier) {
        self.elementTypeID = elementTypeID
    }
    
    func unsafeAbsoluteIndex<T : Hashable>(of value: T) -> Int? {
        preconditionFailure() // abstract
    }
    
    func unsafeAbsoluteIndexOfElement(at index: Swift.Int, in collection: AbstractHomogeneousCollection) -> Int? {
        preconditionFailure() // abstract
    }
}

fileprivate protocol AbstractContiguousArray {
    associatedtype Element
    func asContiguousArray<T>(of type: T.Type) -> ContiguousArray<T>?
    var contiguousArray: ContiguousArray<Self.Element> { get }
    var count: Int { get }
    var isEmpty: Bool { get }
}

extension ContiguousArray : AbstractContiguousArray {
    func asContiguousArray<T>(of type: T.Type) -> ContiguousArray<T>? {
        return self as? ContiguousArray<T>
    }
    
    var contiguousArray: ContiguousArray<Element> {
        return self
    }
}

struct TypedCanonicalViewID<T> {
    private var index: Int32
    private var implicitID: Int32
    private var explicitID: T
}

struct HeterogeneousViewIDs {
    private var collection: HeterogeneousCollection
    
    init() {
        self.collection = HeterogeneousCollection([])
    }
    
    @inline(always) // 원래 없음
    fileprivate init(collection: HeterogeneousCollection) {
        self.collection = collection
    }
}

struct HeterogeneousCollection {
    private let subCollections: ContiguousArray<AbstractHomogeneousCollection>
    private let runningTotal: [UInt32]
    private var lookupTableCache: HeterogeneousIndexLookupTable?
    
    init(_: ContiguousArray<AbstractHomogeneousCollection>) {
        assertUnimplemented()
    }
}

struct HeterogeneousIndexLookupTable {
    private let homogenousLookupTable: [ObjectIdentifier : HomogeneousLookupTable]
    private let count: Int
}
