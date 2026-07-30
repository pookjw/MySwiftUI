// C907048D367572FD9E6EC4CB4F65EE59

final class REEventBus {
    private let coreHandle: OpaquePointer
    private var dispatchersByHandle: [REEventBus.DispatcherHandle : Any]
    
    init() {
        assertUnimplemented()
    }
    
    deinit {
        assertUnimplemented()
    }
}

extension REEventBus {
    @safe fileprivate struct DispatcherHandle : Hashable {
        private let eventID: UInt64
        private let sourceObject: OpaquePointer?
        private let componentType: OpaquePointer?
        private let matching: String?
        
        init<T>(event: T.Type, sourceObject: EventSource?, componentType: (any MyRealityFoundation::Component.Type)?, matching: String?) {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: REEventBus.DispatcherHandle, rhs: REEventBus.DispatcherHandle) -> Bool {
            assertUnimplemented()
        }
    }
}
