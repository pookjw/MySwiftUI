// 2D6196CBE9271629B89E259BFBFD6A9A

private import AttributeGraph

package struct HostPreferencesKey: PreferenceKey {
    package static var defaultValue: PreferenceValues {
        return PreferenceValues()
    }
    
    package static func reduce(value: inout PreferenceValues, nextValue: () -> PreferenceValues) {
        value.combine(with: nextValue())
    }
    
    static func makeNoteId() -> UInt32 {
        let id = HostPreferencesKey.nodeId
        HostPreferencesKey.nodeId &+= 1
        return id
    }
    
    @safe fileprivate static nonisolated(unsafe) var nodeId: UInt32 = 0
}

struct PreferenceKeys: Equatable, RandomAccessCollection {
    static func == (lhs: PreferenceKeys, rhs: PreferenceKeys) -> Bool {
        let lhsKeys = lhs.keys
        let rhsKeys = rhs.keys
        let lhsCount = lhsKeys.count
        let rhsCount = rhsKeys.count
        
        guard lhsCount == rhsCount else {
            return false
        }
        
        for i in 0..<lhsCount {
            if lhsKeys[i] != rhsKeys[i] {
                return false
            }
        }
        
        return true
    }
    
    var keys: [any PreferenceKey.Type]
    
    init() {
        keys = []
    }
    
    mutating func remove(_ key: any PreferenceKey.Type) {
        let index = _index(of: key)
        guard index != count else {
            return
        }
        
        keys.remove(at: index)
    }
    
    func contains(_ key: any PreferenceKey.Type) -> Bool {
        let index = _index(of: key)
        let count = count
        if index == count {
            return false
        } else {
            return keys[index] == key
        }
    }
    
    mutating func add(_ key: any PreferenceKey.Type) {
        guard !contains(key) else {
            return
        }
        keys.append(key)
    }
    
    subscript(_ index: Int) -> any PreferenceKey.Type {
        return keys[index]
    }
    
    var isEmpty: Bool {
        return keys.isEmpty
    }
    
    private func _index(of key: any PreferenceKey.Type) -> Int {
        let keys = keys
        let count = keys.count
        guard count > 0 else {
            return 0
        }
        
        var result = 0
        for _ in 0..<count {
            if keys[result] == key {
                return result
            }
            result += 1
        }
        
        return result
    }
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return keys.count
    }
    
    func union(_ other: PreferenceKeys) -> PreferenceKeys {
        // x21
        let otherKeys = other.keys
        // x26
        let selfKeys = self.keys
        
        // x24
        let selfCount = selfKeys.count
        // x23
        let otherCount = otherKeys.count
        
        var keys = PreferenceKeys()
        keys.keys.reserveCapacity(Swift.max(selfCount, otherCount))
        
        if selfCount == 0 {
            keys.keys.append(contentsOf: otherKeys)
        } else {
            keys.keys.append(contentsOf: selfKeys)
            
            for otherKey in otherKeys {
                if !keys.keys.contains(where: { $0 == otherKey }) {
                    keys.keys.append(otherKey)
                }
            }
        }
        
        return keys
    }
}

package protocol PreferenceKey {
    associatedtype Value
    
    static var defaultValue: Value {
        get
    }
    
    static func reduce(value: inout Value, nextValue: () -> Value)
    
    static var _includesRemovedValues: Bool {
        get
    }
    
    static var _isReadableByHost: Bool {
        get
    }
}

extension PreferenceKey {
    package static func _delay<Content : View>(_: (_PreferenceValue<Value>) -> Content) -> some View {
        fatalError("TODO")
        return MainActor.assumeIsolated { 
            return EmptyView()
        }
    }
    
    package static var _isReadableByHost: Bool {
        return false
    }
    
    package static var _includesRemovedValues: Bool {
        return false
    }
    
    package static func visitKey<T: PreferenceKeyVisitor>(_ visitor: inout T) {
        visitor.visit(key: self)
    }
    
    package static var readableName: String {
        fatalError("TODO")
    }
}

extension PreferenceKey where Value: ExpressibleByNilLiteral {
    package static var defaultValue: Value {
        return nil
    }
}

package struct _PreferenceValue<Key: PreferenceKey> {
    private var attribute: WeakAttribute<Key.Value>
}

package protocol PreferenceKeyVisitor {
    mutating func visit<Key: PreferenceKey>(key: Key.Type)
}

package struct PreferenceValues {
    static func combineHostKeyValues(into values: inout PreferenceValues, keys: PreferenceKeys, childIndices: Range<Int>, childAt: (Int) -> (PreferenceKeys, PreferenceValues)) {
        struct Child {
            let keys: PreferenceKeys // 0x0
            let values: PreferenceValues // 0x8
            var from: Int // 0x10
            var to: Int // 0x18
        }
        
        withUnsafeTemporaryAllocation(of: Child.self, capacity: childIndices.count) { pointer in
            // $s7SwiftUI16PreferenceValuesV014combineHostKeyD04into4keys12childIndices0J2AtyACz_AA0C4KeysVSnySiGAJ_ACtSiXEtFZySryAcdefgHyACz_AjkJ_ACtSiXEtFZ5ChildL_VGXEfU_03$s7a4UI23f30PreferencesCombinerV5valueAA16cd8VvgAA0G4M12V_AFtSiXEfU_SayAA0fqR0VALVGTf1nnnncnn_n
            /*
             pointer -> x0 -> x23
             childIndices -> x2/x3
             values -> x4 -> x29 - 0xd8
             keys -> x5 -> x29 - 0x128
             */
            // x24
            var bufferCount = 0
            if !childIndices.isEmpty {
                // <+1168>
                /*
                 childIndices.upperBound -> x3 -> x19
                 childIndices.lowerBound -> x2 -> x20
                 */
                for index in childIndices {
                    // x0, x28
                    let child = childAt(index)
                    guard !child.0.isEmpty else {
                        continue
                    }
                    
                    pointer.initializeElement(
                        at: bufferCount,
                        to: Child(keys: child.0, values: child.1, from: 0, to: 0)
                    )
                    
                    bufferCount &+= 1
                }
            }
            
            // <+72>
            /*
             values (inout pointer) -> x29 - 0xd8 -> x20
             */
            var x290xe8 = values.entries.count
            // x22
            let keysCount = keys.count
            
            guard keysCount != 0 else {
                return
            }
            
            // x29 - 0xd0
            var x290xd0 = 0
            
            /*
             index -> x13
             keys (buffer) -> x14
             key -> x22
             */
            for key in keys {
                // <+240>
                let x12 = x290xe8
                var x15 = x290xd0
                
                if x15 < x12 {
                    // <+272>
                    var x9 = x15
                    let x11 = values.entries.count
                    
                    var shoudContinue = false
                    var tmp = x15
                    while true {
                        assert(!(x9 >= x11))
                        
                        // x11 (x10 = values.entries[x15 &+ 1])
                        let entry = values.entries[tmp]
                        tmp &+= 1
                        
                        if entry.key == key {
                            // <+1140>
                            x290xd0 = x9 &+ 1
                            // <+220>
                            // <+240>
                            shoudContinue = true
                            break
                        } else if ObjectIdentifier(entry.key) > ObjectIdentifier(key) {
                            // <+1128>
                            x15 = x9
                            // <+336>
                            break
                        } else {
                            x9 &+= 1
                            guard x12 == x9 else {
                                continue
                            }
                            
                            // <+328>
                            x15 = x12
                            // <+332>
                            break
                        }
                    }
                   
                    if shoudContinue {
                        continue
                    }
                }
                
                // <+332>
                x290xd0 = x15
                
                // <+344>
                var x290xe0 = false
                var x290xec = false
                // index -> x19
                for index in 0..<bufferCount {
                    // <+424>
                    // x20
                    let max = Swift.max(index, bufferCount)
                    // <+444>
                    assert(index != max)
                    
                    do {
                        let child = pointer[index]
                        let x8 = child.keys
                        var x9 = child.from
                        let x10 = Swift.max(x9, child.keys.count)
                        
                        var x12 = x9
                        var tmp = x9
                        var shouldContinue = false
                        
                        while true {
                            if x10 == x12 {
                                // <+560>
                                break
                            } else {
                                assert(!(x12 >= child.keys.count))
                                let x13 = x8[tmp]
                                tmp &+= 1
                                
                                if ObjectIdentifier(key) < ObjectIdentifier(x13) {
                                    // <+560>
                                    break
                                } else {
                                    // <+532>
                                    x12 &+= 1
                                    pointer[index].from = x12
                                    
                                    if x13 != key {
                                        continue
                                    } else {
                                        shouldContinue = true
                                        break
                                    }
                                }
                            }
                        }
                        
                        if shouldContinue {
                            continue
                        }
                    }
                    
                    // <+560>
                    var shouldContinue = false
                    // x29 - 0x90
                    var entry: PreferenceValues.Entry!
                    while true {
                        let child = pointer[index]
                        let x9 = child.values
                        let x26 = child.to
                        let x8 = x9.entries.count
                        
                        if x26 >= x8 {
                            shouldContinue = true
                            break
                        } else {
                            // <+584>
                            entry = x9.entries[x26]
                            if ObjectIdentifier(key) < ObjectIdentifier(entry.key) {
                                shouldContinue = true
                                break
                            }
                            
                            // <+600>
                            assert(!(x26 >= x8))
                            pointer[index].to = x26 &+ 1
                            
                            if entry.key != key {
                                continue
                            } else {
                                // <+632>
                                break
                            }
                        }
                    }
                    
                    if shouldContinue {
                        continue
                    }
                    
                    // <+632>
                    if x290xe0 {
                        values.entries[x290xd0].reduce(entry)
                    } else {
                        values.entries.insert(entry, at: x290xd0)
                        x290xec = true
                    }
                    
                    x290xe0 = true
                }
                
                if x290xec {
                    // <+172>
                    x290xe8 &+= 1
                    x290xd0 &+= 1
                }
            }
        }
    }
    
    private var entries: [PreferenceValues.Entry] = []
    
    @inlinable
    init() {}
    
    var seed: VersionSeed {
        var seed = VersionSeed.empty
        
        for entry in entries {
            seed.merge(entry.seed)
        }
        
        return seed
    }
    
    package subscript<T: PreferenceKey>(_ key: T.Type) -> Value<T.Value> {
        get {
            if let value = index(of: key).map({ index -> Value<T.Value> in entries[index][] }) {
                return value
            } else {
                return Value(value: T.defaultValue, seed: .empty)
            }
        }
        set {
            let index = _index(of: key)
            setValue(newValue, of: key, at: index)
        }
    }
    
    package mutating func combine(with values: PreferenceValues) {
        // self -> x29 - 0xd8
        // x29 - 0xe0
        let otherEntries = values.entries
        // x29 - 0xe8
        let x290xe8 = otherEntries.count
        
        guard !otherEntries.isEmpty else {
            return
        }
        
        guard !self.entries.isEmpty else {
            self.entries = otherEntries
            return
        }
        
        // x24 -> self.entries
        // x26
        var count = self.entries.count
        // x25
        var otherIndex = 0
        // x19
        var iterationCount = 0
        // x23
        var selfIndex = 0
        // <+68>
        while true {
            // x8
            let key = self.entries[selfIndex].key
            let otherEntry = otherEntries[otherIndex]
            // x9
            let otherKey = otherEntry.key
            
            if key == otherKey {
                // <+240>
                self.entries[selfIndex].reduce(otherEntry)
                otherIndex &+= 1
                // <+808>
            } else if ObjectIdentifier(otherKey) >= ObjectIdentifier(key) {
                // <+808>
            } else {
                // <+164>
                self.entries.insert(otherEntry, at: selfIndex)
                count &+= 1
                otherIndex &+= 1
                // <+808>
            }
            
            // <+808>
            iterationCount &+= 1
            
            if iterationCount >= count {
                // <+868>
                break
            } else {
                selfIndex &+= 1
                
                if otherIndex < x290xe8 {
                    // <+96>
                    continue
                } else {
                    // <+868>
                    break
                }
            }
        }
        
        if !(otherIndex >= x290xe8) {
            // <+880>
            self.entries.append(contentsOf: otherEntries[otherIndex..<x290xe8])
        }
        
        // <+976>
    }
    
    fileprivate func index<T: PreferenceKey>(of key: T.Type) -> Int? {
        let index = _index(of: key.self)
        let count = entries.count
        if index == count {
            return nil
        }
        if entries[index].key != key {
            return nil
        }
        return index
    }
    
    fileprivate func _index(of key: (any PreferenceKey.Type)) -> Int {
        var i = 0
        for entry in entries {
            if entry.key == key {
                return i
            }
            i += 1
        }
        return i
    }
    
    fileprivate mutating func setValue<T>(_ value: PreferenceValues.Value<T>, of key: any PreferenceKey.Type, at index: Int) {
        /*
         value -> x0 -> x24
         key -> x1/x2 -> x26/x25
         index -> x3 -> x19
         */
        if (entries.count == index) || (entries[index].key != key) {
            if !value.seed.isEmpty {
                // <+156>
                let entry = PreferenceValues.Entry(key: key, seed: value.seed, value: value.value)
                entries.insert(entry, at: index)
            }
        } else {
            if !value.seed.isEmpty {
                entries[index][] = value
            } else {
                entries.remove(at: index)
            }
        }
    }
}

extension PreferenceValues {
    package struct Value<T> {
        package var value: T
        package var seed: VersionSeed
        
        package init(value: T, seed: VersionSeed) {
            self.value = value
            self.seed = seed
        }
    }
}

extension PreferenceValues {
    fileprivate struct Entry {
        var key: (any PreferenceKey.Type)
        var seed: VersionSeed
        var value: Any
        
        subscript<T>() -> PreferenceValues.Value<T> {
            get {
                return PreferenceValues.Value(value: value as! T, seed: seed)
            }
            set {
                self.value = newValue.value
                self.seed = newValue.seed
            }
        }
        
        mutating func reduce(_ other: PreferenceValues.Entry) {
            func reduce<T: PreferenceKey>(key: T.Type) {
                var value = value as! T.Value
                T.reduce(value: &value) {
                    // $s7SwiftUI16PreferenceValuesV5Entry33_2D6196CBE9271629B89E259BFBFD6A9ALLV6reduceyyAFFAGL_3keyyxm_tAA0C3KeyRzlF5ValueQzyXEfU_
                    seed.merge(other.seed)
                    return other.value as! T.Value
                }
                self.value = value
            }
            
            reduce(key: other.key)
        }
    }
}
