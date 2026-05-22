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
    
    mutating func withExplicitID<T : Hashable>(_ explicitID: T, isUnary: Bool, body: (inout HeterogeneousViewIDsAccumulator) -> Void) {
        /*
         self -> x20 -> x19
         explicitID -> x0 -> x25
         isUnary -> w1 -> w24
         body -> x2/x3 -> x23/x22
         */
        // sp + 0x30
        let copy_1 = self.currentExplicitID
        self.currentExplicitID = (explicitID, isUnary)
        body(&self)
        self.currentExplicitID = copy_1
    }
    
    fileprivate func append(_: _ViewList_ID.Canonical) {
        assertUnimplemented()
    }
    
    mutating func append<T : Hashable>(index: Int32 = 0, implicitID: Int32 = -1, explicitID: T) {
        /*
         self -> x20 -> x29 - 0x58
         index -> x0 -> x24
         implicitID -> x1 -> x23
         explicitID -> x2 -> x20
         */
        if index != 0 || implicitID != -1 {
            // <+244>
            let id = TypedCanonicalViewID<T>(index: index, implicitID: implicitID, explicitID: explicitID)
            self.append(id)
        } else {
            // <+172>
            self.withBuffer(of: T.self) { array in
                // $s7SwiftUI31HeterogeneousViewIDsAccumulatorV6append5index10implicitID08explicitJ0ys5Int32V_AIxtSHRzlFys15ContiguousArrayVyxGzXEfU_TA
                /*
                 array -> x0
                 explicitID -> x1
                 */
                // x21
                let copy_1 = explicitID
                array.append(copy_1)
            }
        }
    }
    
    mutating func append(index: Int32, implicitID: Int32) {
        /*
         self -> x20
         index -> w0 -> w21
         implicitID -> w1 -> w19
         */
        // sp
        let copy_1 = self.currentExplicitID
        
        if let copy_1 {
            // <+88>
            // sp + 0x30
            let copy_2 = copy_1
            // sp
            let copy_3 = copy_2
            self.append(
                index: index,
                implicitID: copy_3.isUnary ? -1 : implicitID,
                explicitID: copy_2.0
            )
        } else {
            // <+204>
            self.append(
                TypedCanonicalViewID<Nil>(
                    index: index,
                    implicitID: implicitID,
                    explicitID: nil
                )
            )
        }
    }
    
    mutating func append<T : Hashable>(_ viewID: TypedCanonicalViewID<T>) {
        self.withBuffer(of: TypedCanonicalViewID<T>.self) { array in
            array.append(viewID)
        }
    }
    
    mutating func appendWithUnsafeOutputBuffer<T : Hashable>(
        explicitID: T.Type = T.self,
        count: Int,
        body: (HeterogeneousViewIDsAccumulator.UnsafeOutputBuffer) -> Void
    ) {
        if count < 1 {
            return
        }
        
        let array = unsafe ContiguousArray<TypedCanonicalViewID<T>>(unsafeUninitializedCapacity: count) { buffer, initializedCount in
            // $s7SwiftUI31HeterogeneousViewIDsAccumulatorV28appendWithUnsafeOutputBuffer10explicitID5count4bodyyxm_SiyAC0ijK0VXEtSHRzlFySryAA014TypedCanonicaldM0VyxGGz_SiztXEfU_TA
            let buffer = unsafe HeterogeneousViewIDsAccumulator.UnsafeOutputBuffer(
                pointer: UnsafeMutableRawPointer(buffer.baseAddress.unsafelyUnwrapped),
                count: buffer.count,
                stride: MemoryLayout<TypedCanonicalViewID<T>>.stride,
                indexOffset: 0,
                implicitIDOffset: 4,
                explicitIDOffset: MemoryLayout<TypedCanonicalViewID<T>>.offset(of: \.explicitID).unsafelyUnwrapped
            )
            
            unsafe body(buffer)
            initializedCount = count
        }
        
        self.append(contentsOf: array)
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
    @unsafe struct UnsafeOutputBuffer {
        fileprivate let pointer: UnsafeMutableRawPointer // 0x0
        fileprivate let count: Int // 0x8
        fileprivate let stride: Int // 0x10
        fileprivate let indexOffset: Int // 0x18
        fileprivate let implicitIDOffset: Int // 0x20
        fileprivate let explicitIDOffset: Int // 0x28
        
        func initialize<T : Hashable>(at fromIndex: Int, index toIndex: Int32, implicitID: Int32, explicitID: T) {
            // x8
            let offset = unsafe stride &* fromIndex
            // x9
            let implicitIDOffset = unsafe self.implicitIDOffset
            // x22
            let explicitIDOffset = unsafe self.explicitIDOffset
            // x10
            let indexOffset = unsafe self.indexOffset
            // x11
            let pointer = unsafe self.pointer
                .advanced(by: offset)
            
            unsafe pointer
                .advanced(by: indexOffset)
                .assumingMemoryBound(to: Int32.self)
                .initialize(to: toIndex)
            
            unsafe pointer
                .advanced(by: implicitIDOffset)
                .assumingMemoryBound(to: Int32.self)
                .initialize(to: implicitID)
            
            unsafe pointer
                .advanced(by: explicitIDOffset)
                .assumingMemoryBound(to: T.self)
                .initialize(to: explicitID)
        }
        
        func initialize(at index: Int, index toIndex: Int32, implicitID: Int32) {
            // x8
            let offset = unsafe self.stride &* index
            // x10
            let indexOffset = unsafe self.indexOffset
            // x9
            let implicitIDOffset = unsafe self.implicitIDOffset
            // x11
            let pointer = unsafe self.pointer
            // x8
            let base = unsafe pointer
                .advanced(by: offset)
            
            unsafe base
                .advanced(by: indexOffset)
                .assumingMemoryBound(to: Int32.self)
                .initialize(to: toIndex)
            
            unsafe base
                .advanced(by: implicitIDOffset)
                .assumingMemoryBound(to: Int32.self)
                .initialize(to: implicitID)
        }
        
        func mutableExplicitIDPointer<T : Hashable>(at index: Int, for type: T.Type = T.self) -> UnsafeMutablePointer<T> {
            // x8
            let offset = unsafe self.stride &* index
            // x9
            let explicitIDOffset = unsafe self.explicitIDOffset
            // x10
            let pointer = unsafe self.pointer
            
            return unsafe pointer
                .advanced(by: explicitIDOffset)
                .advanced(by: offset)
                .assumingMemoryBound(to: T.self)
        }
    }
}

class AbstractHomogeneousCollection {
    let elementTypeID: ObjectIdentifier
    final let count: Int
    
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

struct TypedCanonicalViewID<T : Hashable> : Hashable {
    var index: Int32
    var implicitID: Int32
    var explicitID: T
    
    init(index: Int32, implicitID: Int32, explicitID: T) {
        self.index = index
        self.implicitID = implicitID
        self.explicitID = explicitID
    }
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
    
    @safe static nonisolated(unsafe) let empty: HeterogeneousViewIDs = {
        assertUnimplemented()
    }()
    
    var count: Int {
        return collection.count
    }
    
    subscript(index: Int) -> _ViewList_ID.Canonical {
        assertUnimplemented()
    }
    
    func asCanonical() -> [_ViewList_ID.Canonical] {
        assertUnimplemented()
    }
    
    func forEach(_: (_ViewList_ID.Canonical) -> Void) {
        assertUnimplemented()
    }
    
    func makeIndexLookupTableIfNeeded() -> HeterogeneousViewIDIndexLookupTable {
        assertUnimplemented()
    }
    
    init(_ viewList: ViewList) {
        assertUnimplemented()
    }
    
    func difference(to ids: inout HeterogeneousViewIDs) -> DiffResult {
        assertUnimplemented()
    }
}

struct HeterogeneousIndexLookupTable {
    private let homogenousLookupTable: [ObjectIdentifier : HomogeneousLookupTable]
    private let count: Int
}

struct HeterogeneousViewIDIndexLookupTable {
    private var lookupTable: HeterogeneousIndexLookupTable
}

fileprivate struct Nil : Hashable, ExpressibleByNilLiteral {
    init(nilLiteral: ()) {
    }
}
