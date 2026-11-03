package import CoreGraphics
package import Spatial

package struct SpatialEvent {
    // TODO
}

extension SpatialEvent {
    package enum Kind {
        case touch
        case mouse
        case pan
    }
}

package protocol SpatialEventType : EventType {
    var globalLocation: CGPoint { get set }
    var location: CGPoint { get set }
    var radius: CGFloat { get }
    var kind: SpatialEvent.Kind? { get }
}

extension SpatialEventType {
    package var kind: SpatialEvent.Kind? {
        return nil
    }
}

package protocol SpatialEventType3D : SpatialEventType, TransformableEventType3D {
    var globalLocation3D: Point3D { get set }
    var location3D: Point3D { get set }
    var globalOrientation: Rotation3D { get set }
}

extension SpatialEventType3D {
    package var globalLocation: CGPoint {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package var location: CGPoint {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package var kind: SpatialEvent.Kind? {
        assertUnimplemented()
    }
    
    package func convert(_ conversion: TransformableEventConversion, using: (inout Point3D) -> Void) {
        assertUnimplemented()
    }
}
