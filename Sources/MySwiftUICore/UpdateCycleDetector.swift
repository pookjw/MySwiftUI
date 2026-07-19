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
    
    package mutating func dispatch(label: @autoclosure () -> String, isDebug: Bool = false) -> Bool {
        /*
         label -> x0/x1 -> x19/x21
         isDebug -> w2 -> w22
         */
        // w24
        let updateSeed = Graph.withoutUpdate { 
            return self.updateSeed.value
        }
        
        if self.lastSeed != updateSeed {
            // <+116>
            self.lastSeed = updateSeed
            self.ttl = 2
            return true
        }
        
        // <+88>
        if self.ttl == 0 {
            // <+132>
        } else {
            self.ttl &-= 1
            if self.ttl == 0 {
                // <+132>
            } else {
                return true
            }
        }
        
        // <+132>
        if self.hasLogged {
            return false
        }
        
        // <+148>
        if isDebug {
            self.hasLogged = true
            return false
        }
        
        Log.externalWarning("\(label()) tried to update multiple times per frame.")
        self.hasLogged = true
        return false
    }
}
