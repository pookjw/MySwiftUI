package struct PropertyList {
    private var elements: Element?
}

extension PropertyList {
    package final class Tracker {
        
    }
}

extension PropertyList {
    package class Element: CustomStringConvertible {
        package let keyType: Any.Type
        let before: Element?
        let after: Element?
        let skip: Unmanaged<Element>?
        let length: UInt32
        let skipCount: UInt32
        let skipFilter: BloomFilter
        package let id: UniqueID
        
        package init(keyType: Any.Type, before: Element?, after: Element?) {
            fatalError("TODO")
        }
        
        package var description: String {
            // override me
            fatalError()
        }
        
        package func value<Value>(as: Value.Type) -> Value {
            // override me
            fatalError()
        }
        
        package func forEach(filter: BloomFilter, _ body: (Unmanaged<Element>, inout Bool) -> ()) -> Bool {
            fatalError("TODO")
        }
        
        func matches(_ element: Element, ignoredTypes: inout [ObjectIdentifier]) -> Bool {
            // override me
            fatalError()
        }
        
        func copy(before: Element?, after: Element?) -> Element {
            // override me
            fatalError()
        }
    }
}
