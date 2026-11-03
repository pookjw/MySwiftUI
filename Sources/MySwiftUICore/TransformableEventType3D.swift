package import Spatial

package protocol TransformableEventType3D : EventType {
    func convert(_ convertion: TransformableEventConversion, using: (inout Point3D) -> Void)
}

package enum TransformableEventConversion {
    case global
    case globalToLocal
}
