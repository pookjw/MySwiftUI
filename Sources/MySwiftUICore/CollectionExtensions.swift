extension Collection {
    func partitionPoint(where block: (Self.Element) throws -> Bool) rethrows -> Self.Index {
        // x25
        var count = count
        // x28, x29 - 0x78
        var startIndex = startIndex
        
        guard count >= 1 else {
            return startIndex
        }
        
        repeat {
            // x28
            let pivot = count / 2
            // x27
            let index = self.index(startIndex, offsetBy: pivot)
            
            if try block(self[index]) {
                startIndex = self.index(after: index)
                count &-= (pivot &+ 1)
            } else {
                count = pivot
            }
        } while count > 0
        
        return startIndex
    }
}
