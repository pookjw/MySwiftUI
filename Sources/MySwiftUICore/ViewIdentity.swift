
package struct ViewIdentity {
    package static var invalid: ViewIdentity { ViewIdentity(seed: 0) }
    private let seed: UInt32
    
    @safe nonisolated(unsafe) private static var nextSeed: UInt32 = 0
    
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
    
    package var description: String {
        assertUnimplemented()
    }
    
    package struct Tracker {
        package var id: ViewIdentity {
            assertUnimplemented()
        }
        
        package init() {
            assertUnimplemented()
        }
        
        package func update(for phase: _GraphInputs.Phase) -> (value: ViewIdentity, changed: Bool) {
            assertUnimplemented()
        }
    }
}

extension ViewIdentity : Hashable {}
extension ViewIdentity : BitwiseCopyable {}
extension ViewIdentity : CustomStringConvertible {}
