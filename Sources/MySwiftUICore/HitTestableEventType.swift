package import CoreGraphics
package import Spatial

package protocol HitTestableEventType : EventType {
    var hitTestLocation: CGPoint { get }
    var hitTestRadius: CGFloat { get }
}

extension HitTestableEventType where Self : SpatialEventType {
    package var hitTestLocation: CGPoint {
        assertUnimplemented()
    }
    
    package var hitTestRadius: CGFloat {
        assertUnimplemented()
    }
}

package protocol HitTestableEventType3D : HitTestableEventType {
    var hitTestLocation3D: Point3D { get }
    var serverHitTest: ServerHitTest? { get }
}

extension HitTestableEventType3D where Self : SpatialEventType3D {
    package var hitTestLocation3D: Point3D {
        assertUnimplemented()
    }
}
