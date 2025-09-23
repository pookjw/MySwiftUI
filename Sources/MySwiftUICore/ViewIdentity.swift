#warning("TODO")

package struct ViewIdentity {
    package static var invalid: ViewIdentity { ViewIdentity(seed: 0) }
    private let seed: UInt32
    
    private static nonisolated(unsafe) var nextSeed: UInt32 = 0
    
    init() {
        let seed = unsafe ViewIdentity.nextSeed
        
        var next = seed &+ 1
        if next == 0 {
            next = 1
        }
        unsafe ViewIdentity.nextSeed = next
        
        self.seed = seed
    }
    
    private init(seed: UInt32) {
        self.seed = seed
    }
}

extension ViewIdentity: Hashable {}
