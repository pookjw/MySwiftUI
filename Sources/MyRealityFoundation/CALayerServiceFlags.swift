internal import CoreRE

struct CALayerServiceFlags : __CoreConvertible {
    var core: CoreRE::CALayerServiceFlags
    
    static func __fromCore(_: Any) -> MyRealityFoundation::CALayerServiceFlags {
        assertUnimplemented()
    }
    
    func __as<T>(_ type: T.Type) -> T {
        assertUnimplemented()
    }
}
