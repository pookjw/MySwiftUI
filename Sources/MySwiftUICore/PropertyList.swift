#warning("TODO")

@usableFromInline
@frozen package struct PropertyList: CustomStringConvertible {
    @usableFromInline
    var elements: Element?
    
    @inlinable package init() {
        elements = nil
    }
    
    @inlinable package var data: AnyObject? {
        get {
            return elements
        }
    }
    
    @inlinable package var isEmpty: Bool {
        get {
            return elements == nil
        }
    }
    
    @inlinable package func isIdentical(to other: PropertyList) -> Bool {
        return elements === other.elements
    }
    
    @usableFromInline
    package var description: Swift.String {
        fatalError("TODO")
    }
    
    package func mayNotBeEqual(to: PropertyList) -> Bool {
        fatalError("TODO")
    }
    
    package subscript<T: PropertyKey>(_ type: T.Type) -> T.Value {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    package init(data: AnyObject?) {
        fatalError("TODO")
    }
    
    package func override(with other: PropertyList) {
        fatalError("TODO")
    }
    
    package func forEach<T: PropertyKey>(keyType: T.Type, _ handler: (T.Value, inout Bool) -> Void) -> Bool {
        fatalError("TODO")
    }
    
    package func merge(_ other: PropertyList) {
        fatalError("TODO")
    }
    
    package var id: UniqueID {
        fatalError("TODO")
    }
    
    package func valueWithSecondaryLookup<T: PropertyKeyLookup>(_ type: T.Type) -> T.Primary.Value {
        fatalError("TODO")
    }
    
    package subscript<T: DerivedPropertyKey>(_ type: T.Type) -> T.Value {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    package func prependValue<T: PropertyKey>(_ value: T.Value, for type: T.Type) {
        fatalError("TODO")
    }
}

extension PropertyList {
    @usableFromInline
    package final class Tracker {
        @AtomicBox var data: TrackerData
        
        public init() {
            let trackerData = TrackerData(
                plistID: UniqueID(value: 0),
                values: [:],
                derivedValues: [:],
                invalidValues: [],
                unrecordedDependencies: false
            )
            _data = AtomicBox(wrappedValue: trackerData)
        }
        
        public func reset() {
            _data.access { value in
                value.plistID = UniqueID(value: 0)
                value.values.removeAll()
                value.derivedValues.removeAll()
                value.invalidValues = []
                value.unrecordedDependencies = false
            }
        }
        
        public func hasDifferentUsedValues(_ other: PropertyList) -> Bool {
            let selfData = _data.wrappedValue
            guard !selfData.unrecordedDependencies else {
                return true
            }
            
            fatalError("TODO")
        }
        
        public func initializeValues(from other: PropertyList) {
            fatalError("TODO")
        }
        
        public func invalidateAllValues(from: PropertyList, to: PropertyList) {
            fatalError("TODO")
        }
        
        public func formUnion(_: PropertyList.Tracker) {
            fatalError("TODO")
        }
        
        public func valueWithSecondaryLookup<T: PropertyKeyLookup>(_ other: PropertyList, secondaryLookupHandler: T.Type) -> T.Primary.Value {
            fatalError("TODO")
        }
        
        public func value<T: PropertyKey>(_ other: PropertyList, for type: T.Type) -> T.Value {
            fatalError("TODO")
        }
        
        public func invalidateValue<T: PropertyKey>(for type: T.Type, from: PropertyList, to: PropertyList) {
            fatalError("TODO")
        }
        
        public func derivedValue<T: DerivedPropertyKey>(_ other: PropertyList, for type: T.Type) -> T.Value {
            fatalError("TODO")
        }
    }
}

extension PropertyList {
    @safe @usableFromInline
    final class Element: CustomStringConvertible {
        fileprivate let keyType: Any.Type
        fileprivate let before: Element?
        fileprivate var after: Element?
        fileprivate var skip: Unmanaged<Element>?
        fileprivate let length: UInt32
        fileprivate let skipCount: UInt32
        fileprivate let skipFilter: BloomFilter
        fileprivate let id: UniqueID = UniqueID()
        
        fileprivate init(keyType: Any.Type, before: Element?, after: Element?) {
            self.keyType = keyType
            self.before = before
            self.after = after
            var skipFilter = BloomFilter(type: keyType)
            
            if let before {
                var length = before.length &+ 1
                if let after {
                    length += after.length
                }
                self.length = length
                self.skipCount = 0
                skipFilter = BloomFilter(value: .max)
                self.skipFilter = skipFilter
                unsafe self.skip = .passUnretained(self)
            } else if let after {
                let length = after.length &+ 1
                if after.skipCount > 15 {
                    self.length = length
                    self.skipCount = 1
                    unsafe self.skip = .passUnretained(after)
                    self.skipFilter = skipFilter
                } else {
                    self.length = length
                    self.skipCount = after.skipCount &+ 1
                    unsafe self.skip = after.skip
                    self.skipFilter = after.skipFilter.union(skipFilter)
                }
            } else {
                self.length = 1
                self.skipCount = 1
                unsafe self.skip = nil
                self.skipFilter = skipFilter
            }
        }
        
        @usableFromInline
        var description: String {
            fatalError() // abstract
        }
        
        func matches(_ other: Element, ignoredTypes: inout [ObjectIdentifier]) -> Bool {
            fatalError() // abstract
        }
        
        func copy(before: Element?, after: Element?) -> Element {
            fatalError() // abstract
        }
        
        func value<T>(as type: T.Type) -> T {
            fatalError() // abstract
        }
        
        func forEach(filter: BloomFilter, _ handler: (Unmanaged<Element>, inout Bool) -> Void) -> Bool {
            fatalError("TODO")
        }
    }
}

package protocol PropertyKeyLookup {
    associatedtype Primary: PropertyKey
    associatedtype Secondary: PropertyKey
} 

package protocol PropertyKey {
    associatedtype Value
    
    static var defaultValue: Value {
        get
    }
}

package protocol DerivedPropertyKey {
    associatedtype Value
}
