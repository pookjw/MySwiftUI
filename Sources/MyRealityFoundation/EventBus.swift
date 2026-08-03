// C907048D367572FD9E6EC4CB4F65EE59
private import CoreRE

@safe final class REEventBus {
    private let coreHandle: OpaquePointer
    private var dispatchersByHandle: [REEventBus.DispatcherHandle : Any]
    
    @inline(__always) // 원래 없음
    init(coreHandle: OpaquePointer) {
        unsafe self.coreHandle = coreHandle
        self.dispatchersByHandle = [:]
        
        unsafe __RERetain(coreHandle)
        unsafe unsafeBitCast(coreHandle, to: CoreRE::EventBus.self)
            .swiftObject = Unmanaged.passUnretained(self).toOpaque()
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

func getEventID<T>(_ type: T.Type) -> UInt64 {
    assertUnimplemented()
}
