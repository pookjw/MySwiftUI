#warning("TODO")
package import Foundation

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
    
    package subscript<Key: PropertyKey>(_ key: Key.Type) -> Key.Value {
        get {
            // $s7SwiftUI12PropertyListVy5ValueQzxmcAA0C3KeyRzluig
            withExtendedLifetime(elements) { elements in
                find(elements.map { .passUnretained($0) }, key: key)
                fatalError("TODO")
            }
        }
        set {
            // $s7SwiftUI12PropertyListVy5ValueQzxmcAA0C3KeyRzluis
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
        @AtomicBox private var data: TrackerData
        
        package init() {
            let trackerData = TrackerData(
                plistID: UniqueID(value: 0),
                values: [:],
                derivedValues: [:],
                invalidValues: [],
                unrecordedDependencies: false
            )
            _data = AtomicBox(wrappedValue: trackerData)
        }
        
        package func reset() {
            _data.access { value in
                value.plistID = UniqueID(value: 0)
                value.values.removeAll()
                value.derivedValues.removeAll()
                value.invalidValues = []
                value.unrecordedDependencies = false
            }
        }
        
        package func hasDifferentUsedValues(_ other: PropertyList) -> Bool {
            let selfData = _data.wrappedValue
            guard !selfData.unrecordedDependencies else {
                return true
            }
            
            fatalError("TODO")
        }
        
        package func initializeValues(from other: PropertyList) {
            fatalError("TODO")
        }
        
        package func invalidateAllValues(from: PropertyList, to: PropertyList) {
            fatalError("TODO")
        }
        
        package func formUnion(_: PropertyList.Tracker) {
            fatalError("TODO")
        }
        
        package func valueWithSecondaryLookup<T: PropertyKeyLookup>(_ other: PropertyList, secondaryLookupHandler: T.Type) -> T.Primary.Value {
            fatalError("TODO")
        }
        
        package func value<T: PropertyKey>(_ other: PropertyList, for type: T.Type) -> T.Value {
            fatalError("TODO")
        }
        
        package func invalidateValue<T: PropertyKey>(for type: T.Type, from: PropertyList, to: PropertyList) {
            fatalError("TODO")
        }
        
        package func derivedValue<T: DerivedPropertyKey>(_ other: PropertyList, for type: T.Type) -> T.Value {
            fatalError("TODO")
        }
        
        final func forEach(filter: BloomFilter, _ body: (Unmanaged<PropertyList.Element>, inout Bool) -> Void) -> Bool {
            fatalError("TODO")
        }
    }
}

extension PropertyList {
    @safe @usableFromInline
    class Element: CustomStringConvertible {
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
                skipFilter.value = .max
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
        
        fileprivate func matches(_ other: Element, ignoredTypes: inout [ObjectIdentifier]) -> Bool {
            fatalError() // abstract
        }
        
        fileprivate func copy(before: Element?, after: Element?) -> Element {
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

fileprivate func findValueWithSecondaryLookup<T: PropertyKeyLookup>(
    _ element: Unmanaged<PropertyList.Element>?,
    secondaryLookupHandler: T.Type,
    filter: BloomFilter,
    secondaryFilter: BloomFilter
) -> T.Primary.Value? {
    /*
     element = x21
     */
    guard let element else {
        return nil
    }
    
    
    fatalError("TODO")
}

fileprivate func find1<T: PropertyKey>(_ element: Unmanaged<PropertyList.Element>?, key: T.Type, filter: BloomFilter) -> Unmanaged<TypedElement<T>>? {
    guard let element else {
        return nil
    }
    
    // filter = x22
    var skip: Unmanaged<PropertyList.Element>? = element
    while let _skip = skip {
        if _skip.takeUnretainedValue().skipFilter.mayContain(filter) {
            if
                let before = _skip.takeUnretainedValue().before,
                let result = find1(Unmanaged.passUnretained(before), key: key, filter: filter)
            {
                return result
            }
            
            if _skip.takeUnretainedValue().keyType == key {
                return Unmanaged.fromOpaque(_skip.toOpaque())
            }
            
            if let after = _skip.takeUnretainedValue().after {
                skip = .passUnretained(after)
                continue
            }
            
            return nil
        } else {
            skip = _skip.takeUnretainedValue().skip
        }
    }
    
    return nil
}

fileprivate func compareLists(_ source: Unmanaged<PropertyList.Element>, _ against: Unmanaged<PropertyList.Element>, ignoredTypes: inout [ObjectIdentifier]) -> Bool {
    fatalError("TODO")
}

fileprivate func move(_ source: [ObjectIdentifier: AnyTrackedValue], to destination: inout [AnyTrackedValue]) {
    fatalError("TODO")
}

fileprivate func compare(_ source: [ObjectIdentifier: AnyTrackedValue], against: PropertyList) -> Bool {
    /*
     source = x19
     aginst = x21
     */
    
    fatalError("TODO")
}

fileprivate func find<T: PropertyKey>(_ element: Unmanaged<PropertyList.Element>?, key: T.Type) -> Unmanaged<TypedElement<T>>? {
    return find1(element, key: key, filter: BloomFilter(type: key))
}

fileprivate class TypedElement<Key: PropertyKey>: PropertyList.Element {
    let value: Key.Value // 0x48
    
    @inlinable
    init(value: Key.Value, before: PropertyList.Element?, after: PropertyList.Element?) {
        self.value = value
        super.init(keyType: Key.self, before: before, after: after)
    }
    
    override var description: String {
        fatalError("TODO")
    }
    
    override func matches(_: PropertyList.Element, ignoredTypes: inout [ObjectIdentifier]) -> Bool {
        fatalError("TODO")
    }
    
    override func copy(before: PropertyList.Element?, after: PropertyList.Element?) -> PropertyList.Element {
        fatalError("TODO")
    }
    
    override func value<T>(as type: T.Type) -> T {
        fatalError("TODO")
    }
}

package final class ViewGraphHostEnvironmentWrapper: NSObject, NSSecureCoding {
    package static var supportsSecureCoding: Bool {
        return true
    }
    
    package var environment = EnvironmentValues()
    var phase = ViewGraphHost.Phase()
    
    package init?(coder: NSCoder) {
        fatalError("TODO")
    }
    
    package func encode(with coder: NSCoder) {
        fatalError("TODO")
    }
    
    package override func isEqual(_ object: Any?) -> Bool {
        guard let casted = object as? ViewGraphHostEnvironmentWrapper else {
            return false
        }
        
        guard self.phase.base.value != casted.phase.base.value else {
            return false
        }
        
        let selfElement = self.environment.plist.elements
        let otherElement = casted.environment.plist.elements
        
        if let selfElement, let otherElement {
            var ignoreTypes: [ObjectIdentifier] = []
            return compareLists(Unmanaged.passUnretained(selfElement), Unmanaged.passUnretained(otherElement), ignoredTypes: &ignoreTypes)
        } else if (selfElement == nil) && (otherElement == nil) {
            return true
        } else {
            return false
        }
    }
}

fileprivate struct TrackerData {
    var plistID: UniqueID
    var values: [ObjectIdentifier: any AnyTrackedValue]
    var derivedValues: [ObjectIdentifier: any AnyTrackedValue]
    var invalidValues: [any AnyTrackedValue]
    var unrecordedDependencies: Bool
    
    @inlinable
    init(
        plistID: UniqueID,
        values: [ObjectIdentifier : any AnyTrackedValue],
        derivedValues: [ObjectIdentifier : any AnyTrackedValue],
        invalidValues: [any AnyTrackedValue],
        unrecordedDependencies: Bool
    ) {
        self.plistID = plistID
        self.values = values
        self.derivedValues = derivedValues
        self.invalidValues = invalidValues
        self.unrecordedDependencies = unrecordedDependencies
    }
}

fileprivate protocol AnyTrackedValue {
    func unwrap<Value>() -> Value
    func hasMatchingValue(in propertyList: PropertyList) -> Bool
}
