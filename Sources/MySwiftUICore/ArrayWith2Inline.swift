package struct ArrayWith2Inline<Element> : Sequence, Collection, BidirectionalCollection, RandomAccessCollection, MutableCollection, RangeReplaceableCollection, ExpressibleByArrayLiteral {
    enum Storage {
        case one(Element)
        case two(Element, Element)
        case many(ContiguousArray<Element>)
        case empty
    }
    
    private var storage: ArrayWith2Inline<Element>.Storage
    
    package init() {
        assertUnimplemented()
    }
    
    package init(arrayLiteral elements: Element...) {
        assertUnimplemented()
    }
    
    package var count: Int {
        assertUnimplemented()
    }
    
    package var startIndex: Int {
        assertUnimplemented()
    }
    
    package var endIndex: Int {
        assertUnimplemented()
    }
    
    package subscript(position: Int) -> Element {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package func index(after i: Int) -> Int {
        // Original: add without an explicit overflow check (0x16b014).
        assertUnimplemented()
    }
    
    package func index(before i: Int) -> Int {
        // Original: sub without an explicit overflow check (0x16b01c).
        assertUnimplemented()
    }
    
    package func index(_ i: Int, offsetBy distance: Int) -> Int {
        // Original: adds / b.vs / brk on signed overflow (0x16b024).
        assertUnimplemented()
    }
    
    package mutating func append(_ newElement: Element) {
        assertUnimplemented()
    }
    
    package mutating func reserveCapacity(_ n: Int) {
        assertUnimplemented()
    }
    
    package mutating func replaceSubrange<C : Collection>(_ subrange: Range<Int>, with newElements: C) where C.Element == Element {
        assertUnimplemented()
    }
    
    mutating func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Element>) throws -> R) rethrows -> R {
        assertUnimplemented()
    }
    
    package func _copyToContiguousArray() -> ContiguousArray<Element> {
        assertUnimplemented()
    }
}

extension ArrayWith2Inline : Equatable where Element : Equatable {
    package static func == (lhs: ArrayWith2Inline<Element>, rhs: ArrayWith2Inline<Element>) -> Bool {
        assertUnimplemented()
    }
}
