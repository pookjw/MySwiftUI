struct UniqueSeedGenerator {
    private var nextID: Int
    
    init() {
        self.nextID = 0
    }
    
    mutating func generate() -> Int {
        let old = self.nextID
        self.nextID = old &+ 1
        return old
    }
}
