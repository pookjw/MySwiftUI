#warning("TODO")
package import Foundation
private import AttributeGraph

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
    
    package func mayNotBeEqual(to other: PropertyList) -> Bool {
        guard
            let selfElements = elements,
            let otherElements = other.elements
        else {
            return !((elements == nil) && (other.elements == nil))
        }
        
        var ignoredTypes: [ObjectIdentifier] = []
        return !compareLists(Unmanaged.passUnretained(otherElements), Unmanaged.passUnretained(selfElements), ignoredTypes: &ignoredTypes)
    }
    
    package subscript<Key: PropertyKey>(_ key: Key.Type) -> Key.Value {
        get {
            // $s7SwiftUI12PropertyListVy5ValueQzxmcAA0C3KeyRzluig
            withExtendedLifetime(elements) { elements in
                if let result = find(elements.map { .passUnretained($0) }, key: key) {
                    return result.takeUnretainedValue().value
                } else {
                    return key.defaultValue
                }
            }
        }
        set {
            // $s7SwiftUI12PropertyListVy5ValueQzxmcAA0C3KeyRzluis
            let ref: Unmanaged<PropertyList.Element>?
            if let elements {
                ref = .passUnretained(elements)
            } else {
                ref = nil
            }
            
            if let element = find(ref, key: key) {
                if Key.valuesEqual(newValue, element.takeUnretainedValue().value) {
                    return
                }
            }
            
            prependValue(newValue, for: key)
        }
    }
    
    @inlinable
    package init(data: AnyObject?) {
        if let data {
            self.elements = data as! PropertyList.Element
        }
    }
    
    package func override(with other: PropertyList) {
        fatalError("TODO")
    }
    
    package func forEach<T: PropertyKey>(keyType: T.Type, _ handler: (T.Value, inout Bool) -> Void) -> Bool {
        fatalError("TODO")
    }
    
    package mutating func merge(_ other: PropertyList) {
        /*
         self = x19
         */
        // x22
        let selfElements = self.elements
        // x21
        let otherElements = other.elements
        
        if let selfElements {
            guard let otherElements else {
                return
            }
            
            // <+68>
            guard selfElements !== otherElements else {
                return
            }
            
            /*
             otherElements = x24
             */
            // x20
            var depth: Int = 0
            // x23
            var x23 = selfElements
            var x24 = otherElements
            /*
             true = <+328>
             false = <+388>
             */
            var flag = false
            while true {
                // <+164>
                if x23.length >= x24.length {
                    // <+224>
                    depth += 1
                    if let _x24 = x24.after {
                        x24 = _x24
                        // x24 = x29, #-0x60
                        // <+192>
                    } else {
                        // <+388>
                        flag = false
                        break
                    }
                    continue
                }
                
                // <+180>
                if let _x23 = x23.after {
                    x23 = _x23
                    // <+188>
                } else {
                    // <+388>
                    flag = false
                    break
                }
                
                // <+192>
                if x23 !== x24 {
                    continue // <+164>
                }
                
                // <+328>
                flag = true
                break
            }
            
            if flag {
                // <+328>
                // depth = x29, #-0x78
                if x23 === x24 {
                    if x24 === otherElements {
                        return
                    }
                    
                    // <+564>
                    if let selfElement = self.elements,
                       selfElement === x23 {
                        self.elements = otherElements
                        return
                    }
                    
                    // <+592>
                    if depth == 0 {
                        return
                    }
                    
                    // <+628>
                    let afterOtherElements: [PropertyList.Element] = .init(unsafeUninitializedCapacity: depth) { buffer, initializedCount in
                        initializedCount = depth
                        var current: PropertyList.Element = otherElements
                        for i in 0..<depth {
                            buffer.baseAddress.unsafelyUnwrapped.initialize(to: current)
                            current = current.after!
                        }
                    }
                    
                    for element in afterOtherElements.reversed() {
                        self.elements = element.copy(before: element.before, after: self.elements)
                    }
                    return
                } else {
                    // <+388>
                }
            }
            
            // <+388>
            if let before = selfElements.before {
                // <+396>
                self.elements = PropertyList.Element(keyType: EmptyKey.self, before: otherElements, after: selfElements)
                return
            } else {
                // <+484>
                self.elements = selfElements.copy(before: otherElements, after: selfElements.after)
                return
            }
        } else {
            // <+252>
            self.elements = otherElements
            return
        }
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
    
    package mutating func prependValue<T: PropertyKey>(_ value: T.Value, for type: T.Type) {
        self.elements = TypedElement<T>(value: value, before: nil, after: elements)
    }
}

@available(*, unavailable)
extension PropertyList: Sendable {}

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
        fileprivate let id = UniqueID()
        
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

@available(*, unavailable)
extension PropertyList.Element: Sendable {}

package protocol PropertyKeyLookup {
    associatedtype Primary: PropertyKey
    associatedtype Secondary: PropertyKey
    
    static func lookup(in: Secondary.Value) -> Primary.Value?
} 

package protocol PropertyKey {
    associatedtype Value
    
    static var defaultValue: Value {
        get
    }
    
    static func valuesEqual(_ lhs: Value, _ rhs: Value) -> Bool
}

extension PropertyKey {
    package static func valuesEqual(_ lhs: Value, _ rhs: Value) -> Bool {
        return compareValues(lhs, rhs, options: [.unknown1, .unknown2])
    }
}

extension PropertyKey where Value : Equatable {
    package static func valuesEqual(_ lhs: Value, _ rhs: Value) -> Bool {
        return lhs == rhs
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
     secondaryLookupHandler = x29 - 0x88 ~ - 0x90
     filter = x27
     secondaryFilter = x20
     T = x23
     Primary = x28
     Secondary = x29 = 0x80
     */
    guard let element else {
        return nil
    }
    
    // x21
    var skip: Unmanaged<PropertyList.Element> = element
    while true {
        if skip.takeUnretainedValue().skipFilter.mayContain(filter) {
            if
                let before = skip.takeUnretainedValue().before,
                let result = findValueWithSecondaryLookup(Unmanaged.passUnretained(before), secondaryLookupHandler: secondaryLookupHandler, filter: filter, secondaryFilter: secondaryFilter)
            {
                return result
            }
            
            let keyType = skip.takeUnretainedValue().keyType
            if keyType == T.Primary.self {
                // <+876>
                // offset 0x48에 접근하는 것을 보아 TypedElement.value를 가져오는 것으로 보임
                let element = Unmanaged<TypedElement<T.Primary>>.fromOpaque(skip.toOpaque())
                let value = element.takeUnretainedValue().value
                return value
            }
            
            if keyType == T.Secondary.self {
                // <+672>
                // offset 0x48에 접근하는 것을 보아 TypedElement.value를 가져오는 것으로 보임
                let element = Unmanaged<TypedElement<T.Secondary>>.fromOpaque(skip.toOpaque())
                let value = element.takeUnretainedValue().value
                guard let result = T.lookup(in: value) else {
                    continue
                }
                return result
            }
            
            if let after = skip.takeUnretainedValue().after {
                skip = .passUnretained(after)
                continue
            }
            
            return nil
        } else {
            guard let newSkip = skip.takeUnretainedValue().skip else {
                return nil
            }
            skip = newSkip
        }
    }
    
    return nil
}

fileprivate func find1<T: PropertyKey>(_ element: Unmanaged<PropertyList.Element>?, key: T.Type, filter: BloomFilter) -> Unmanaged<TypedElement<T>>? {
    guard let element else {
        return nil
    }
    
    // filter = x22
    var skip: Unmanaged<PropertyList.Element> = element
    while true {
        if skip.takeUnretainedValue().skipFilter.mayContain(filter) {
            if
                let before = skip.takeUnretainedValue().before,
                let result = find1(Unmanaged.passUnretained(before), key: key, filter: filter)
            {
                return result
            }
            
            if skip.takeUnretainedValue().keyType == key {
                return Unmanaged.fromOpaque(skip.toOpaque())
            }
            
            if let after = skip.takeUnretainedValue().after {
                skip = .passUnretained(after)
                continue
            }
            
            return nil
        } else {
            guard let newSkip = skip.takeUnretainedValue().skip else {
                return nil
            }
            skip = newSkip
        }
    }
    
    return nil
}

fileprivate func compareLists(_ source: Unmanaged<PropertyList.Element>, _ against: Unmanaged<PropertyList.Element>, ignoredTypes: inout [ObjectIdentifier]) -> Bool {
    guard source.takeUnretainedValue().length == against.takeUnretainedValue().length else {
        return false
    }
    
    /*
     source = x20
     against = x19
     */
    guard source == against else {
        return false
    }
    
    // ignoredTypes = x21
    guard source.takeUnretainedValue().matches(against.takeUnretainedValue(), ignoredTypes: &ignoredTypes) else {
        return false
    }
    
    return true
}

fileprivate func move(_ source: inout [ObjectIdentifier: AnyTrackedValue], to destination: inout [AnyTrackedValue]) {
    /*
     source = x20
     destination = x21
     */
    guard !source.isEmpty else {
        return
    }
    
    destination.append(contentsOf: source.values)
    source.removeAll()
}

fileprivate func compare(_ source: [ObjectIdentifier: AnyTrackedValue], against: PropertyList) -> Bool {
    /*
     source = x19
     against = x21
     */
    for value in source.values {
        guard value.hasMatchingValue(in: against) else {
            return false
        }
    }
    return true
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
        return TypedElement(value: value, before: before, after: after)
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
    
    package convenience init?(coder: NSCoder) {
        self.init()
    }
    
    package override init() {
        super.init()
    }
    
    package func encode(with coder: NSCoder) {
        // nop
    }
    
    package override func isEqual(_ object: Any?) -> Bool {
        guard let casted = object as? ViewGraphHostEnvironmentWrapper else {
            return false
        }
        
        guard self.phase.base != casted.phase.base else {
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

fileprivate struct EmptyKey: PropertyKey {
    static let defaultValue = ()
}
