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
            indices.append(contentsOf: [-1])
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
                var w9 = (x11 >= x24 &- 1)
                let x10: Int
                if w9 {
                    x10 = x25
                } else {
                    x10 = x24
                }
                
                w9 = w9 && w8
                
                if w9 || w8 {
                    x25 = x10
                    w8 = w9
                    continue
                }
                
                let x26 = x11 &+ 1
                // <+180>
                ranges.append(x25..<x26)
            }
            
            return ranges
        }
        
        // sp + 0x128 (x29 - 0xa8)
        let ranges0 = convertOffsetsToRanges(offsets.0)
        // sp + 0xd8 (x29 - 0xf8)
        let ranges1 = convertOffsetsToRanges(offsets.1)
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
        // from -> x25 -> sp + 0xf0 (x29 - 0xe0)
        // self -> x26 -> sp + 0xf8 (x29 - 0xd8)
        // sp + 0x130 (x28 - 0xa0)
        let fromStartIndex = from.startIndex
        // sp + 0xe0 (x29 - 0xf0)
        let toStartIndex = to.startIndex
        
        // <+660>
        // self -> sp + 0x108 (x29 - 0xc8)
        self.changes = .init()
        // toCount -> sp + 0xe8 (x29 - 0xe8)
        let w25 = (toCount > 0)
        
        if fromCount > 0 || toCount >= 1 {
            // <+848>
            // sp + 0x90 (x29 - 0x140)
            var x290x40 = 0
            var w21 = 0
            
            func iterateRange(from: inout U.Index, length: Int, in: U) -> Range<U.Index> {
                fatalError("TODO")
            }
            
            for range0 in ranges0 {
                print(range0.lowerBound, w21)
                fatalError()
            }
            fatalError("TODO")
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
