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
                    guard !child.0.keys.isEmpty else {
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
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    package mutating func combine(with values: PreferenceValues) {
        fatalError("TODO")
    }
    
    private func index<T: PreferenceKey>(of key: T.Type) -> Int? {
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
    
    private func _index(of key: (any PreferenceKey.Type)) -> Int {
        var i = 0
        for entry in entries {
            if entry.key == key {
                return i
            }
            i += 1
        }
        return i
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
            return PreferenceValues.Value(value: value as! T, seed: seed)
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
