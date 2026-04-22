internal import AttributeGraph

package struct UpdateCycleDetector {
    private(set) var updateSeed: Attribute<UInt32>
    var lastSeed: UInt32
    var ttl: UInt32
    var hasLogged: Bool
    
    package init() {
        self.updateSeed = GraphHost.currentHost.data.$updateSeed
        self.lastSeed = .max
        self.ttl = .max
        self.hasLogged = false
    }
    
    package mutating func reset() {
        assertUnimplemented()
    }
    
    package func dispatch(label: @autoclosure () -> String, isDebug: Bool = false) -> Bool {
        assertUnimplemented()
    }
}
