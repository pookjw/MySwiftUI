// FC193EF4CDDE14447FC4651D4987AA15

package struct CollectionChanges<A: Comparable, B: Comparable>: RandomAccessCollection, CustomStringConvertible {
    private var changes: [CollectionChanges<A, B>.Element]
    
    init() {
        changes = .init()
    }
    
    var removals: CollectionChanges<A, B>.Projection<Range<A>> {
        fatalError("TODO")
    }
    
    var insertions: CollectionChanges<A, B>.Projection<Range<B>> {
        fatalError("TODO")
    }
    
    var matches: CollectionChanges<A, B>.Projection<(Range<A>, Range<B>)> {
        fatalError("TODO")
    }
    
    package init<T, U>(from: T, to: U) where A == T.Index, B == U.Index, T: BidirectionalCollection, U: BidirectionalCollection, T.Element: Hashable, T.Element == U.Element {
        changes = .init()
        formChanges(from: from, to: to)
    }
    
    package var startIndex: Int {
        fatalError("TODO")
    }
    
    package var endIndex: Int {
        fatalError("TODO")
    }
    
    package func index(after i: Int) -> Int {
        fatalError("TODO")
    }
    
    package func index(before i: Int) -> Int {
        fatalError("TODO")
    }
    
    package subscript(position: Int) -> Element {
        get {
            fatalError("TODO")
        }
    }
    
    package var description: String {
        fatalError("TODO")
    }
    
    mutating func formChanges<T, U>(from: T, to: U) where A == T.Index, B == U.Index, T: BidirectionalCollection, U: BidirectionalCollection, T.Element: Hashable, T.Element == U.Element {
        /*
         self -> x20 -> x28 -> x23
         from -> x0 -> x25 -> x21
         to -> x1 -> sp + 0xd0 (x29 - 0x100) -> x24
         */
        // self.changes -> sp + 0x158 (x29 - 0x78)
        // x20, x19
        let offsets = changedOffsets(from: from, to: to, limit: .max)!
        
        func convertOffsetsToRanges(_ indices: [Int]) -> [Range<Int>] {
            // sp + 0x8
            var indices = indices
            indices.append(contentsOf: [Int.max])
            // indices -> x19
            // x20
            var x25 = 0
            var ranges: [Range<Int>] = []
            var x24 = Int.min
            var w8 = true
            
            for index in indices {
                // <+132>
                let x11 = x24
                x24 = index
                let ge = (x11 >= x24 &- 1)
                var x10: Int
                if ge {
                    x10 = x25
                } else {
                    x10 = x24
                }
                
                var w9 = ge && w8
                
                if ge || w8 {
                    x25 = x10
                    w8 = w9
                    continue
                }
                
                let x26 = x11 &+ 1
                // <+180>
                ranges.append(x25..<x26)
                w9 = false
                x10 = x24
                x25 = x10
                w8 = w9
            }
            
            return ranges
        }
        
        // sp + 0x128 (x29 - 0xa8)
        let ranges0 = convertOffsetsToRanges(offsets.0)
        // sp + 0xd8 (x29 - 0xf8)
        let ranges1 = convertOffsetsToRanges(offsets.1)
        // from -> x25 -> x29 - 0xd0
        // self -> x28 -> x26
        
        // sp + 0x150 (x29 - 0x80)
        let fromCount = from.count
        // from -> x21 -> x25
        // x28
        let toCount = to.count
        // sp + 0xc0 (x29 - 0x110)
        let fromEndIndex = from.endIndex
        // sp + 0xc8 (x29 - 0x108)
        let toEndIndex = to.endIndex
        // from -> x25/x26 -> sp + 0xf0 (x29 - 0xe0) / sp + 0xf8 (x29 - 0xd8)
        // sp + 0x130 (x29 - 0xa0)
        var fromStartIndex = from.startIndex
        // sp + 0xe0 (x29 - 0xf0)
        var toStartIndex = to.startIndex
        
        // <+660>
        // self -> sp + 0x108 (x29 - 0xc8)
        self.changes = .init()
        // toCount -> sp + 0xe8 (x29 - 0xe8)
        var w25 = (toCount > 0)
        
        if fromCount > 0 || toCount >= 1 {
            // <+848>
            var w24 = false
            var x21 = 0
            var x28 = 0
            var x290x140 = 0
            var x23 = 0
            // ranges1 (buffer pointer) -> x29 - 0x158
            
            func iterateRange<V>(from index: inout V.Index, length: Int, in collection: V) -> Range<V.Index> where V: BidirectionalCollection {
                /*
                 index -> x0 -> x24
                 length -> x1 -> x29 - 0x58
                 in -> x2 -> x20
                 return pointer -> x8 -> x29 - 0x60
                 from/to -> x7 -> x27
                 */
                // <+276>
                let x19 = index
                collection.formIndex(&index, offsetBy: length, limitedBy: collection.endIndex)
                
                let x26 = index
                
                // <+372>
                // sp + 0x20 -> sp + 0x30
                let range = x19..<x26
                return range
            }
            
            var x26: Int
            
            while true {
                // ranges0[x28] -> x27
                x26 = x23
                
                if !w24 && (x28 < ranges0.count) && (ranges0[x28].lowerBound == x21) {
                    let x19 = ranges0[x28].upperBound - x21
                    /*
                     from (sp + 0x10)
                     fromEndIndex (sp + 0x18)
                     */
                    let range = iterateRange(from: &fromStartIndex, length: x19, in: from)
                    self.changes.append(.removed(range))
                    
                    x28 &+= 1
                    x21 &+= x19
                    
                    var w8 = x21 < fromCount
                    w8 = (w8 || w25)
                    
                    if x21 < fromCount {
                    } else {
                        x26 = x23
                    }
                    
                    if w8 {
                        continue
                    } else {
                        return
                    }
                }
                
                // <+1112>
                var x25 = x290x140
                if (x25 >= 0) && (x25 < ranges1.count) && (ranges1[x25].lowerBound == x26) {
                    // <+1164>
                    x23 = ranges1[x25].upperBound - x26
                    let range = iterateRange(from: &toStartIndex, length: x23, in: to)
                    self.changes.append(.inserted(range))
                    x25 &+= 1
                    x290x140 = x25
                    // <+1692>
                } else {
                    // <+1308>
                    var x8 = fromCount
                    if w24 {
                        // <+1340>
                    } else {
                        // <+1316>
                        let x9 = ranges0.count
                        x8 = fromCount
                        if x28 >= x9 {
                            // <+1340>
                        } else {
                            x8 = ranges0[x28].lowerBound
                        }
                    }
                    
                    // <+1340>
                    var x9 = toCount
                    if x25 >= 0 {
                        let x10 = ranges1.count
                        x9 = toCount
                        if x25 >= x10 {
                            // <+1384>
                        } else {
                            // <+1368>
                            x9 = ranges1[x25].lowerBound
                        }
                    }
                    
                    // <+1384>
                    x8 = x8 &- x21
                    x9 = x9 &- x26
                    
                    let x24: Int
                    if x9 < x8 {
                        x24 = x9
                    } else {
                        x24 = x8
                    }
                    // x24 -> x29 - 0x120
                    // x22
                    let range2 = iterateRange(from: &fromStartIndex, length: x24, in: from)
                    x23 = x24
                    // x22 + 0x10
                    let range3 = iterateRange(from: &toStartIndex, length: x24, in: to)
                    
                    // <+1636>
                    self.changes.append(.matched(range2, range3))
                    x21 = x23 &+ x21
                    // <+1692>
                }
                
                // <+1692>
                x23 = x23 &+ x26
                
                w25 = (x23 < toCount)
                w24 = (x28 < 0)
                
                if x21 < fromCount {
                    continue
                }
                
                if x23 < toCount {
                    continue
                }
                
                break
            }
        }
        
        // <+712>
    }
    
    func getOffset<T>(from change: CollectionDifference<T>.Change) -> Int {
        switch change {
        case .insert(let offset, let _, let _):
            return offset
        case .remove(let offset, let _, let _):
            return offset
        }
    }
    
    fileprivate func changedOffsets<T, U>(from: T, to: U, limit: Int) -> ([Int], [Int])? where A == T.Index, B == U.Index, T: BidirectionalCollection, U: BidirectionalCollection, T.Element: Hashable, T.Element == U.Element {
        return from.withContiguousStorageIfAvailable { fromBuffer -> ([Int], [Int])? in
            return to.withContiguousStorageIfAvailable { toBuffer -> ([Int], [Int])? in
                // $s7SwiftUI17CollectionChangesV14changedOffsets33_FC193EF4CDDE14447FC4651D4987AA15LL4from2to5limitSaySiG_AItSgqd___qd_0_SitSKRd__SKRd_0_SH7ElementRpd__AKQyd_0_ALRSr0_lFAJSRyALGXEfU_AjNXEfU_TA
                /*
                 toBuffer -> x0 -> sp + 0x230 (x29 - 0x90)
                 toBuffer count -> x1 -> sp + 0x228 (x29 - 0x98)
                 fromBuffer -> x2 -> x22
                 fromBuffer count -> x3 -> x23
                 changes -> x4 -> sp + 0x1a0 (x29 - 0x120)
                 limit -> x5 -> sp + 0x218 (x29 - 0xa8)
                 */
                // sp + 0x138 (x29 - 0x48)
                var fromDictionary: [U.Element: Int] = .init()
                fromDictionary.reserveCapacity(fromBuffer.count)
                /*
                 fromBuffer -> x22 -> sp + 0x220 (x29 - 0xa0)
                 fromBuffer count -> x23 -> sp + 0x1c8 (x29 - 0xf8)
                 */
                for index in fromBuffer.indices {
                    fromDictionary[fromBuffer[index]] = index
                }
                
                // <+560>
                // sp + 0x120 (x29 - 0x60)
                var toDictionary: [T.Element: Int] = .init()
                toDictionary.reserveCapacity(toBuffer.count)
                for index in toBuffer.indices {
                    toDictionary[toBuffer[index]] = index
                }
                
                // <+736>
                // fromDictionary -> sp + 0x138 (x29 - 0x48) -> sp + 0xc8 (x29 - 0xb8)
                // toDictionary -> sp + 0x120 (x29 - 0x60) -> sp + 0x50 (x28 - 0x130)
                if (fromDictionary.count != fromBuffer.count) || (toDictionary.count != toBuffer.count) {
                    // <+952>
                    // x20
                    let difference = toBuffer.difference(from: fromBuffer)
                    
                    let removalIndices: [Int] = difference.removals.map { change in
                        // $s7SwiftUI17CollectionChangesV14changedOffsets33_FC193EF4CDDE14447FC4651D4987AA15LL4from2to5limitSaySiG_AItSgqd___qd_0_SitSKRd__SKRd_0_SH7ElementRpd__AKQyd_0_ALRSr0_lFAJSRyALGXEfU_AjNXEfU_Sis0C10DifferenceV6ChangeOyAL_GXEfU_TA
                        return getOffset(from: change)
                    }
                    
                    let insertionIndices: [Int] = difference.insertions.map { change in
                        return getOffset(from: change)
                    }
                    
                    return (removalIndices, insertionIndices)
                } else {
                    // <+824>
                    // x23
                    let fromEndIndex = fromBuffer.endIndex
                    let toEndIndex = toBuffer.endIndex
                    var x290xc0 = toEndIndex > 0
                    
                    // x3
                    var removalIndices: [Int] = []
                    // x28
                    var insertionIndices: [Int] = []
                    
                    if (fromEndIndex > 0) || (toEndIndex >= 1) {
                        // <+1580>
                        // fromEndIndex -> x23 -> x29 - 0xe8
                        // toEndIndex -> x0 -> x29 - 0xf8
                        var x9 = 0
                        var x22 = 0
                        
                        while (removalIndices.count &+ insertionIndices.count) <= limit {
                            // <+1688>
                            if toEndIndex == x9 {
                                // <+1696>
                                removalIndices.append(x22)
                                // <+1640>
                                x22 &+= 1
                                var w8 = (x22 < fromEndIndex)
                                w8 = w8 || x290xc0
                                if x22 >= fromEndIndex {
                                    x9 = fromEndIndex
                                }
                                
                                if !w8 {
                                    break
                                }
                                
                                continue
                            } else {
                                // <+1796>
                                // x9 -> x29 - 0x98
                                if fromEndIndex != x22 {
                                    // <+1808>
                                    // x22 -> x29 - 0xd8
                                    // removalIndices -> x3 -> x29 - 0xd0
                                    // x22
                                    let fromValue = fromBuffer[x22]
                                    // x19
                                    let toValue = toBuffer[x9]
                                    
                                    // <+1880>
                                    // x20
                                    let isEqual = fromValue == toValue
                                    
                                    if !isEqual {
                                        // <+1944>
                                        // x29 - 0x70
                                        let fromIndex = toDictionary[fromValue]
                                        // x29 - 0x80
                                        let toIndex = fromDictionary[toValue]
                                        
                                        if let fromIndex {
                                            // fromIndex -> x20
                                            // <+2468>
                                            if let toIndex {
                                                // <+2552>
                                                var x8 = fromIndex &- x9
                                                // toIndex -> x25
                                                // toEndIndex -> x27
                                                
                                                if fromIndex < x9 {
                                                    // <+2580>
                                                    // toEndIndex -> x0
                                                    // toIndex -> x27
                                                    removalIndices.append(x22)
                                                    x22 &+= 1
                                                } else {
                                                    // <+2648>
                                                    let x9_2 = toIndex &- x22
                                                    if x9_2 < 0 {
                                                        // <+2660>
                                                        insertionIndices.append(x9)
                                                        x9 &+= 1
                                                        x8 = x9
                                                    } else {
                                                        // <+2692>
                                                        if x9_2 >= x8 {
                                                            // <+2700>
                                                            insertionIndices.append(x9)
                                                            x9 &+= 1
                                                            x8 = x9
                                                        } else {
                                                            // <+2580>
                                                            removalIndices.append(x22)
                                                            x22 &+= 1
                                                        }
                                                    }
                                                }
                                                
                                                // <+2764>
                                                let w10 = x8 < toEndIndex
                                                x290xc0 = w10
                                                if x22 >= fromEndIndex {
                                                    x9 = x8
                                                }
                                                
                                                if x22 < fromEndIndex {
                                                    continue
                                                } else if x8 < toEndIndex {
                                                    continue
                                                } else {
                                                    break
                                                }
                                            } else {
                                                // <+2488>
                                                insertionIndices.append(x9)
                                                
                                                x9 &+= 1
                                                x290xc0 = (x9 < toEndIndex)
                                                continue
                                            }
                                        } else {
                                            // <+2100>
                                            removalIndices.append(x22)
                                            // <+1640>
                                            x22 &+= 1
                                            var w8 = (x22 < fromEndIndex)
                                            w8 = w8 || x290xc0
                                            if x22 >= fromEndIndex {
                                                x9 = fromEndIndex
                                            }
                                            
                                            if !w8 {
                                                break
                                            }
                                            
                                            continue
                                        }
                                    } else {
                                        // <+2324>
                                        x22 &+= 1
                                        x9 &+= 1
                                        let w8 = (x9 < toEndIndex)
                                        x290xc0 = w8
                                        continue
                                    }
                                } else {
                                    // <+2392>
                                    insertionIndices.append(x9)
                                    // <+2452>
                                    x9 &+= 1
                                    let x8 = x9
                                    x22 = fromEndIndex
                                    // <+2764>
                                    let w10 = (x8 < toEndIndex)
                                    x290xc0 = w10
                                    
                                    if x22 >= fromEndIndex {
                                        x9 = x8
                                    }
                                    
                                    if x22 < fromEndIndex || x8 < toEndIndex {
                                        continue
                                    } else {
                                        break
                                    }
                                }
                            }
                        }
                    } else {
                        // <+884>
                    }
                    
                    // <+900>
                    if (removalIndices.count &+ insertionIndices.count) <= limit {
                        return (removalIndices, insertionIndices)
                    } else {
                        return nil
                    }
                }
            } ?? nil
        } ?? nil
    }
}

extension CollectionChanges {
    package enum Element {
        case removed(Range<A>)
        case inserted(Range<B>)
        case matched(Range<A>, Range<B>)
    }
    
    struct Projection<C>: BidirectionalCollection {
        let kind: CollectionChanges<A, B>.Element.Kind
        let changes: [CollectionChanges<A, B>.Element]
        let startIndex: Int
        let endIndex: Int
        
        init(kind: CollectionChanges<A, B>.Element.Kind, changes: [CollectionChanges<A, B>.Element]) {
            fatalError("TODO")
        }
        
        func index(before i: Int) -> Int {
            fatalError("TODO")
        }
        
        func index(after i: Int) -> Int {
            fatalError("TODO")
        }
        
        subscript(position: Int) -> Slice<CollectionChanges<A, B>.Projection<C>> {
            get {
                fatalError("TODO")
            }
        }
    }
}

extension CollectionChanges.Element {
    enum Kind: Hashable {
        case removed
        case inserted
        case matched
    }
}
