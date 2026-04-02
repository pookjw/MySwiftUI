extension BidirectionalCollection where Self: MutableCollection {
    mutating func insertionSort(by block: (Self.Element, Self.Element) throws -> Bool) rethrows {
        /*
         self = x28
         */
        guard !isEmpty else {
            return
        }
        
        // <+372>
        // x26 -> sp + 0xc0
        let startIndex = startIndex
        // x19 -> sp + 0x68
        var index = index(after: startIndex)
        
        while index != endIndex {
            let value = self[index]
            // x26
            var beforeIndex = index
            
            repeat {
                formIndex(before: &beforeIndex)
                let before = self[beforeIndex]
                
                do {
                    let result = try block(value, before)
                    if result {
                        // <+912>
                        self[index] = before
                        formIndex(before: &beforeIndex)
                    } else {
                        // <+1108>
                        break
                    }
                } catch {
                    // <+1260>
                    self[index] = value
                    throw error
                }
            } while beforeIndex != startIndex
            
            // <+1108>
            if beforeIndex != index {
                self[beforeIndex] = value
            }
            
            // <+480>
            formIndex(after: &index)
        }
    }
}
