#warning("TODO")

package struct ViewIdentity {
    package static var invalid: ViewIdentity { ViewIdentity(seed: 0) }
    private let seed: UInt32
    
    @safe private static nonisolated(unsafe) var nextSeed: UInt32 = 0
    
    init() {
        let seed = ViewIdentity.nextSeed
        
        var next = seed &+ 1
        if next == 0 {
            next = 1
        }
        ViewIdentity.nextSeed = next
        
        self.seed = seed
    }
    
    private init(seed: UInt32) {
        self.seed = seed
    }
}

extension ViewIdentity: Hashable {}
extension ViewIdentity: BitwiseCopyable {}
