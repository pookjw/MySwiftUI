// _2095A85BBACBB369317EE0CF616E6EA7
internal import CoreGraphics

struct CAHostingLayerEvent {
    private let _resolve: (inout CAHostingLayerEvent.Context) -> [CAHostingLayerEvent.Resolved]
    
    static func mousePressed(button: CAHostingLayerEvent.MouseButton, location: CGPoint, instant: ContinuousClock.Instant) -> CAHostingLayerEvent {
        assertUnimplemented()
    }
    
    static func mouseDragged(location: CGPoint, instant: ContinuousClock.Instant) -> CAHostingLayerEvent {
        assertUnimplemented()
    }
    
    static func mouseLifted(button: CAHostingLayerEvent.MouseButton, location: CGPoint, instant: ContinuousClock.Instant) -> CAHostingLayerEvent {
        assertUnimplemented()
    }
}

extension CAHostingLayerEvent {
    struct MouseButton {
//        private let value: MouseEvent.Button
        
        public static var primary: CAHostingLayerEvent.MouseButton {
            assertUnimplemented()
        }
        
        public static var secondary: CAHostingLayerEvent.MouseButton {
            assertUnimplemented()
        }
    }
    
    struct Resolved {
        private let sequence: Int
        private let event: EventType
    }
    
    struct Context {
        private let referenceInstant: ContinuousClock.Instant
//        private var mouseTracker: MouseTracker
    }
}

extension CAHostingLayerEvent.MouseButton : Hashable {
}
