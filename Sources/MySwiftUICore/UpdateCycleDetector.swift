private import AttributeGraph

package struct UpdateCycleDetector {
    private var updateSeed: Attribute<UInt32>
    private var lastSeed: UInt32
    private var ttl: UInt32
    private var hasLogged: Bool
    
    package init() {
        self.updateSeed = GraphHost.currentHost.data.$updateSeed
        self.lastSeed = .max
        self.ttl = .max
        self.hasLogged = false
    }
}
