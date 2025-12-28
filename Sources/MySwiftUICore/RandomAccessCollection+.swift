extension RandomAccessCollection {
    func lowerBound(_ block: (Self.Element) -> Bool) -> Self.Index {
        // x24
        var startIndex = startIndex
        // x29 - 0x80
        var count = count
        
        guard count >= 1 else {
            return startIndex
        }
        
        repeat {
            // x23 / x29 - 0x78
            let index = count / 2
            // x22
            var copy = startIndex
            formIndex(&copy, offsetBy: index)
            
            if block(self[copy]) {
                // <+280>
                startIndex = copy
                formIndex(after: &startIndex)
                count &-= (index &+ 1)
            } else {
                count = index
            }
        } while count > 0
        
        return startIndex
    }
}
