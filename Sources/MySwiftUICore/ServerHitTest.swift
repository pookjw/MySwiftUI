package import Spatial
internal import AttributeGraph

package struct ServerHitTest {
    package var responderID: UInt64? // 0x0
    package var leafHitTestedEntityProxy: Any? // 0x10
    package var responderHitPointGlobal: Point3D? // 0x30~0x50 / 0x51
    
    package init(responderID: UInt64?, leafHitTestedEntityProxy: Any?) {
        self.responderID = responderID
        self.leafHitTestedEntityProxy = leafHitTestedEntityProxy
        self.responderHitPointGlobal = nil
    }
}

struct RequiresServerHitTesting: ViewInput {
    static var defaultValue: Attribute<Bool>? {
        return nil
    }
    
    static func valuesEqual(_ lhs: Attribute<Bool>?, _ rhs: Attribute<Bool>?) -> Bool {
        fatalError("TODO")
    }
}
