#warning("TODO")

package struct ViewIdentity {
    package static let invalid: ViewIdentity = ViewIdentity(seed: 0)
    private let seed: UInt32
    
    private static nonisolated(unsafe) var nextSeed: UInt32 = 0
    
    init() {
        let seed = ViewIdentity.nextSeed
        
        var (next, overflow) = seed.addingReportingOverflow(1)
        if overflow {
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
