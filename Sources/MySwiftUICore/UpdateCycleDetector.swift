internal import AttributeGraph

package struct UpdateCycleDetector {
    private(set) var updateSeed: Attribute<UInt32> // 0x0
    var lastSeed: UInt32 // 0x4
    var ttl: UInt32 // 0x8
    var hasLogged: Bool // 0xc
    
    package init() {
        self.updateSeed = GraphHost.currentHost.data.$updateSeed
        self.lastSeed = .max
        self.ttl = 0
        self.hasLogged = false
    }
    
    package mutating func reset() {
        self.lastSeed = .max
        self.ttl = 0
        self.hasLogged = false
    }
    
    package func dispatch(label: @autoclosure () -> String, isDebug: Bool = false) -> Bool {
        assertUnimplemented()
    }
}
