@_spi(Internal) internal import MySwiftUICore
internal import Spatial
internal import CoreGraphics

struct HoverEvent3D : TransformableEventType3D, HitTestableEventType3D, Equatable, NonGestureEventType {
    static func == (lhs: HoverEvent3D, rhs: HoverEvent3D) -> Bool {
        assertUnimplemented()
    }
    
    private(set) var timestamp: Time
    private(set) var phase: EventPhase
    var binding: EventBinding?
    private var location3D: Point3D
    private var globalLocation3D: Point3D
    private var radius: CGFloat
    private var touchType: TouchType
    private(set) var serverHitTest: ServerHitTest?
    private var manipulatorPose: Pose3D?
    
    var customHitTestOptions: ViewResponder.ContainsPointsOptions? {
        assertUnimplemented()
    }
    
    init?(_ event: any EventType) {
        assertUnimplemented()
    }
    
    func convert(_ convertion: TransformableEventConversion, using: (inout Point3D) -> Void) {
        assertUnimplemented()
    }
    
    var hitTestLocation: CGPoint {
        assertUnimplemented()
    }
    
    var hitTestRadius: CGFloat {
        assertUnimplemented()
    }
    
    var hitTestLocation3D: Point3D {
        assertUnimplemented()
    }
}

struct HoverEventDispatcher3D : ForwardedEventDispatcher {
    static var eventType: any EventType.Type {
        return HoverEvent3D.self
    }

    private var eventBindings: [EventID : EventBinding] = [:]

    func receiveEvents(_ events: [EventID : EventType], manager: EventBindingManager) -> Set<EventID> {
        assertUnimplemented()
    }
}
