// BC35AC8A4C97141A50E9554AB9488792

struct HeterogeneousViewIDsAccumulator {
    private var collections: ContiguousArray<AbstractHomogeneousCollection> = [] // 0x0
    private var _count: Int = 0 // 0x8
    private var currentCollection: AbstractContiguousArray? = nil // 0x10
    private var currentExplicitID: (any Hashable, isUnary: Bool)? = nil // 0x38
    
    init() {
    }
    
    func finalize() {
        assertUnimplemented()
    }
    
    var count: Int {
        assertUnimplemented()
    }
    
    var isEmpty: Bool {
        assertUnimplemented()
    }
    
    func append<T : Hashable>(contentsOf contents: ContiguousArray<T>) {
        assertUnimplemented()
    }
    
    func withBuffer<T : Hashable>(of type: T.Type, body: (inout ContiguousArray<T>) -> Void) {
        assertUnimplemented()
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
        assertUnimplemented()
    }
    
    var contiguousArray: ContiguousArray<Element> {
        assertUnimplemented()
    }
}

struct TypedCanonicalViewID<T> {
    private var index: Int32
    private var implicitID: Int32
    private var explicitID: T
}
