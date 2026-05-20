// 89AD1D9EE1555AAC4E0F57DBF89A1DFC

struct HeterogeneousCollection {
    private let subCollections: ContiguousArray<AbstractHomogeneousCollection>
    private let runningTotal: [UInt32]
    private var lookupTableCache: HeterogeneousIndexLookupTable? = nil
    
    var count: Int {
        if let last = runningTotal.last {
            return Int(last)
        } else {
            return 0
        }
    }
    
    init(_ subCollections: ContiguousArray<AbstractHomogeneousCollection> = []) {
        // sp + 0x8
        var copy_1 = subCollections
        // x22
        var endIndex = copy_1.count
        // x21
        var startIndex: Int
        
        if endIndex != 0 {
            startIndex = 0
            let x9 = endIndex &- 1
            
            loop: for collection in copy_1 {
                // <+68>
                let count = collection.count
                if count == 0 {
                    // <+108>
                    if x9 != startIndex {
                        // <+460>
                        var x24 = startIndex &+ 5
                        
                        while true {
                            // <+528>
                            let x25 = x24 &- 4
                            // x23
                            let collection_1 = copy_1[x24 &- 4]
                            
                            let flag: Bool // true -> <+512> / false -> <+560>
                            if collection_1.count == 0 {
                                // <+512>
                                flag = true
                            } else if x25 == startIndex {
                                // <+504>
                                startIndex &+= 1
                                endIndex = copy_1.count
                                // <+512>
                                flag = true
                            } else {
                                // <+560>
                                flag = false
                            }
                            
                            if flag {
                                // <+512>
                            } else {
                                // <+560>
                                // x22
                                let collection_2 = copy_1[startIndex]
                                copy_1[startIndex] = collection_1
                                // <+468>
                                copy_1[x24 &- 4] = collection_2
                                // <+500>
                                startIndex &+= 1
                                endIndex = copy_1.count
                                // <+512>
                            }
                            
                            // <+512>
                            let x8 = x24 &- 3
                            x24 &+= 1
                            
                            if x8 == endIndex {
                                // <+116>
                                // <+128>
                                break loop
                            } else {
                                // <+528>
                                continue
                            }
                        }
                    } else {
                        // <+116>
                        // <+128>
                        break
                    }
                } else {
                    // <+80>
                    startIndex &+= 1
                    if endIndex != startIndex {
                        // <+68>
                        continue
                    } else {
                        // <+128>
                        break
                    }
                }
            }
            
            // <+128>
        } else {
            startIndex = 0
        }
        
        // <+128>
        copy_1.replaceSubrange(startIndex..<endIndex, with: EmptyCollection())
        self.subCollections = copy_1
        
        // <+236>
        // copy_1 -> sp + 0x8 -> x21
        var x22: [UInt32] = []
        let count = copy_1.count
        if count != 0 {
            x22.reserveCapacity(count)
            
            var w24: UInt32 = 0
            
            for collection in copy_1 {
                w24 += UInt32(collection.count)
                x22.append(w24)
            }
        }
        
        // <+424>
        self.runningTotal = x22
    }
    
    func element(at index: Int) -> Any {
        assertUnimplemented()
    }
    
    func forEach(_: (Any) -> Void) {
        assertUnimplemented()
    }
    
    func map<T>(_: (Any) -> T) -> [T] {
        assertUnimplemented()
    }
    
    func asAnyHashable2() -> [AnyHashable2] {
        assertUnimplemented()
    }
    
    func difference(to collection: inout HeterogeneousCollection) -> DiffResult {
        assertUnimplemented()
    }
    
    fileprivate func differenceWithDuplicates(to collection: HeterogeneousCollection) -> DiffResult {
        assertUnimplemented()
    }
}
