internal import Spatial
internal import AttributeGraph


package struct ServerHitTest {
    var responderID: UInt64?
    var leafHitTestedEntityProxy: Any?
    var responderHitPointGlobal: Point3D?
}

struct RequiresServerHitTesting: ViewInput {
    static var defaultValue: Attribute<Bool>? {
        return nil
    }
    
    static func valuesEqual(_ lhs: Attribute<Bool>?, _ rhs: Attribute<Bool>?) -> Bool {
        fatalError("TODO")
    }
}
