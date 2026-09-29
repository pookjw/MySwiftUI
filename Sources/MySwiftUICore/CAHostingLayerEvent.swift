// _2095A85BBACBB369317EE0CF616E6EA7

struct CAHostingLayerEvent {
    private let _resolve: (inout CAHostingLayerEvent.Context) -> [CAHostingLayerEvent.Resolved]
}

extension CAHostingLayerEvent {
    struct MouseButton {
//        private let value: MouseEvent.Button
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
