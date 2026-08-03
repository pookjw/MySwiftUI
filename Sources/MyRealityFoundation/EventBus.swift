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
    if let existing = unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(T.self)] {
        return existing
    }
    
    // <+136>
    var _type: Any.Type
    if type is AccessibilityActivateEvent.Type {
        _type = AccessibilityActivateEvent.self
    } else if type is AccessibilityIncrementEvent.Type {
        _type = AccessibilityIncrementEvent.self
    } else if type is AccessibilityDecrementEvent.Type {
        _type = AccessibilityDecrementEvent.self
    } else if type is AccessibilityCustomActionEvent.Type {
        _type = AccessibilityCustomActionEvent.self
    } else if type is AccessibilityRotorNavigationEvent.Type {
        _type = AccessibilityRotorNavigationEvent.self
    } else {
        _type = T.self
    }
    
    // <+232>
    if type is ImagePresentationComponent.Spatial3DImage.GenerationStartedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationStartedEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationFailedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationFailedEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationCancelledEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationCancelledEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationCompletedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationCompletedEvent.self
    } else if type is ImagePresentationComponent.Spatial3DImage.GenerationProgressUpdatedEvent.Type {
        _type = ImagePresentationComponent.Spatial3DImage.GenerationProgressUpdatedEvent.self
    }
    
    // <+356>
    if let existing = unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(_type)] {
        return existing
    }
    
    let eventID = String(describing: type)
        .utf8CString
        .withUnsafeBufferPointer { pointer in
            return unsafe CoreRE::EventBus.makeID(pointer.baseAddress.unsafelyUnwrapped)
        }
    
    unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(T.self)] = eventID
    return unsafe RegisteredEventsToEventBusIds.registeredEventsToEventBusIds[ObjectIdentifier(T.self)]!
}

fileprivate enum RegisteredEventsToEventBusIds {
    static nonisolated(unsafe) var registeredEventsToEventBusIds: [ObjectIdentifier : UInt64] = RegisteredEventsToEventBusIds.generateRegisteredEventsToEventBusIds()
    
    static func generateRegisteredEventsToEventBusIds() -> [ObjectIdentifier : UInt64] {
        // x21
        var map_1: [ObjectIdentifier : UInt64] = unsafe [
            ObjectIdentifier(REEngineDoUpdateEvent.self) : EventBus.makeID("REEngineDoUpdateEvent"),
            ObjectIdentifier(REEngineDoRenderEvent.self) : EventBus.makeID("REEngineDoRenderEvent"),
            ObjectIdentifier(RESceneAnchoredStateChangedEvent.self) : EventBus.makeID("RESceneAnchoredStateChangedEvent"),
            ObjectIdentifier(RESceneEntityDidAddEvent.self) : EventBus.makeID("RESceneEntityDidAddEvent"),
            ObjectIdentifier(RESceneEntityDidActivateEvent.self) : EventBus.makeID("RESceneEntityDidActivateEvent"),
            ObjectIdentifier(RESceneEntityWillDeactivateEvent.self) : EventBus.makeID("RESceneEntityWillDeactivateEvent"),
            ObjectIdentifier(RESceneEntityWillRemoveEvent.self) : EventBus.makeID("RESceneEntityWillRemoveEvent"),
            ObjectIdentifier(RESceneEntityDidReparentEvent.self) : EventBus.makeID("RESceneEntityDidReparentEvent"),
            ObjectIdentifier(REAnimationHasCompletedEvent.self) : EventBus.makeID("REAnimationHasCompletedEvent"),
            ObjectIdentifier(REAnimationHasLoopedEvent.self) : EventBus.makeID("REAnimationHasLoopedEvent"),
            ObjectIdentifier(REAnimationHasTerminatedEvent.self) : EventBus.makeID("REAnimationHasTerminatedEvent"),
            ObjectIdentifier(REAnimationHasStartedEvent.self) : EventBus.makeID("REAnimationHasStartedEvent"),
            ObjectIdentifier(REAnimationHasTimelineEventStart.self) : EventBus.makeID("REAnimationHasTimelineEventStart"),
            ObjectIdentifier(REAnimationHasTimelineEventUpdate.self) : EventBus.makeID("REAnimationHasTimelineEventUpdate"),
            ObjectIdentifier(REAnimationHasTimelineEventEnd.self) : EventBus.makeID("REAnimationHasTimelineEventEnd"),
            ObjectIdentifier(REAnimationTimelineEventSkipped.self) : EventBus.makeID("REAnimationTimelineEventSkipped"),
            ObjectIdentifier(REAnimationTimelineEventPause.self) : EventBus.makeID("REAnimationTimelineEventPause"),
            ObjectIdentifier(REAnimationTimelineEventResume.self) : EventBus.makeID("REAnimationTimelineEventResume"),
            ObjectIdentifier(REAnimationTimelineEventTerminated.self) : EventBus.makeID("REAnimationTimelineEventTerminated"),
            ObjectIdentifier(REAnimationTimelineEventCreated.self) : EventBus.makeID("REAnimationTimelineEventCreated"),
            ObjectIdentifier(RECollisionDidStartEventEx.self) : EventBus.makeID("RECollisionDidStartEventEx"),
            ObjectIdentifier(RECollisionDidUpdateEventEx.self) : EventBus.makeID("RECollisionDidUpdateEventEx"),
            ObjectIdentifier(RECollisionDidStopEvent.self) : EventBus.makeID("RECollisionDidStopEvent"),
            ObjectIdentifier(REComponentDidAddEvent.self) : EventBus.makeID("REComponentDidAddEvent"),
            ObjectIdentifier(REComponentDidActivateEvent.self) : EventBus.makeID("REComponentDidActivateEvent"),
            ObjectIdentifier(REComponentWillDeactivateEvent.self) : EventBus.makeID("REComponentWillDeactivateEvent"),
            ObjectIdentifier(REComponentWillRemoveEvent.self) : EventBus.makeID("REComponentWillRemoveEvent"),
            ObjectIdentifier(REComponentDidChangeEvent.self) : EventBus.makeID("REComponentDidChangeEvent"),
            ObjectIdentifier(REMotionStateDidChangeEvent.self) : EventBus.makeID("REMotionStateDidChangeEvent"),
            ObjectIdentifier(REOwnershipRequestEvent.self) : EventBus.makeID("REOwnershipRequestEvent"),
            ObjectIdentifier(REOwnershipResponseEvent.self) : EventBus.makeID("REOwnershipResponseEvent"),
            ObjectIdentifier(REOwnershipChangedEvent.self) : EventBus.makeID("REOwnershipChangedEvent"),
            ObjectIdentifier(REAudioPlayerDidStartEvent.self) : EventBus.makeID("REAudioPlayerDidStartEvent"),
            ObjectIdentifier(REAudioPlayerDidCompleteEvent.self) : EventBus.makeID("REAudioPlayerDidCompleteEvent"),
            ObjectIdentifier(EngineRenderEvent.self) : EventBus.makeID("EngineRenderEvent"),
            ObjectIdentifier(REEntityPhysicsWillSimulateEvent.self) : EventBus.makeID("REEntityPhysicsWillSimulateEvent"),
            ObjectIdentifier(REEntityPhysicsDidSimulateEvent.self) : EventBus.makeID("REEntityPhysicsDidSimulateEvent"),
            ObjectIdentifier(REEntityForceEffectComputeForcesEvent.self) : EventBus.makeID("REEntityForceEffectComputeForcesEvent"),
            ObjectIdentifier(REAnimationSkeletalPoseUpdateCompleteEvent.self) : EventBus.makeID("REAnimationSkeletalPoseUpdateCompleteEvent"),
            ObjectIdentifier(REVideoPlayerContentTypeChangedEvent.self) : EventBus.makeID("REVideoPlayerContentTypeChangedEvent"),
            ObjectIdentifier(REVideoPlayerVideoSizeChangedEvent.self) : EventBus.makeID("REVideoPlayerVideoSizeChangedEvent"),
            ObjectIdentifier(REVideoPlayerViewingModeChangedEvent.self) : EventBus.makeID("REVideoPlayerViewingModeChangedEvent"),
            ObjectIdentifier(REVideoPlayerVideoReceiverEndpointChangedEvent.self) : EventBus.makeID("REVideoPlayerVideoReceiverEndpointChangedEvent"),
            ObjectIdentifier(REAnchorStateDidAnchorEvent.self) : EventBus.makeID("REAnchorStateDidAnchorEvent"),
            ObjectIdentifier(REAnchorStateWillUnanchorEvent.self) : EventBus.makeID("REAnchorStateWillUnanchorEvent"),
            ObjectIdentifier(REAnchorStateDidFailToAnchorEvent.self) : EventBus.makeID("REAnchorStateDidFailToAnchorEvent"),
            ObjectIdentifier(REAnchoringTrackingStateEvent.self) : EventBus.makeID("REAnchoringTrackingStateEvent")
        ]

        // <+1412>
        // x22
        let map_2: [ObjectIdentifier : UInt64] = unsafe [
            ObjectIdentifier(REVideoPlayerContentProfileChangedEvent.self) : EventBus.makeID("REVideoPlayerContentProfileChangedEvent"),
            ObjectIdentifier(REVideoPlayerImmersiveViewingModeDidChangeEvent.self) : EventBus.makeID("REVideoPlayerImmersiveViewingModeDidChangeEvent"),
            ObjectIdentifier(REVideoPlayerImmersiveViewingModeWillTransitionEvent.self) : EventBus.makeID("REVideoPlayerImmersiveViewingModeWillTransitionEvent"),
            ObjectIdentifier(REVideoPlayerImmersiveViewingModeDidTransitionEvent.self) : EventBus.makeID("REVideoPlayerImmersiveViewingModeDidTransitionEvent"),
            ObjectIdentifier(REVideoPlayerVideoComfortViolationEvent.self) : EventBus.makeID("REVideoPlayerVideoComfortViolationEvent"),
            ObjectIdentifier(REVideoPlayerSpatialVideoModeChangedEvent.self) : EventBus.makeID("REVideoPlayerSpatialVideoModeChangedEvent"),
            ObjectIdentifier(REVideoPlayerRenderingStatusEvent.self) : EventBus.makeID("REVideoPlayerRenderingStatusEvent"),
            ObjectIdentifier(REImagePresentationTransitionStartedEvent.self) : EventBus.makeID("REImagePresentationTransitionStartedEvent"),
            ObjectIdentifier(REImagePresentationTransitionCompletedEvent.self) : EventBus.makeID("REImagePresentationTransitionCompletedEvent"),
            ObjectIdentifier(RESpatialMediaImmersiveFrameSizeDidChangeEvent.self) : EventBus.makeID("RESpatialMediaImmersiveFrameSizeDidChangeEvent")
        ]

        // <+1732>
        map_1.merge(map_2) { lhs, _ in
            // $sxq_xq_Iegnnrr_x3key_q_5valuetx_q_tIegnr_SHRzr0_lTRSO_s6UInt64VTG5072$sSD5merge_16uniquingKeysWithySDyxq_Gn_q_q__q_tKXEtKFx_q_tx_q_tcfU_SO_s6C4VTG5Tf3nnpf_n
            return lhs
        }
        
        // map_1 -> x22
        // <+1792>
        // x24
        let map_3: [ObjectIdentifier : UInt64] = unsafe [
            ObjectIdentifier(ImagePresentationComponent.Spatial3DImage.GenerationStartedEvent.self) : EventBus.makeID("IPCSpatial3DImageGenerationStartedEvent"),
            ObjectIdentifier(ImagePresentationComponent.Spatial3DImage.GenerationFailedEvent.self) : EventBus.makeID("IPCSpatial3DImageGenerationFailedEvent"),
            ObjectIdentifier(ImagePresentationComponent.Spatial3DImage.GenerationCancelledEvent.self) : EventBus.makeID("IPCSpatial3DImageGenerationCancelledEvent"),
            ObjectIdentifier(ImagePresentationComponent.Spatial3DImage.GenerationCompletedEvent.self) : EventBus.makeID("IPCSpatial3DImageGenerationCompletedEvent"),
            ObjectIdentifier(ImagePresentationComponent.Spatial3DImage.GenerationProgressUpdatedEvent.self) : EventBus.makeID("IPCSpatial3DImageGenerationProgressUpdatedEvent")
        ]

        // <+1964>
        map_1.merge(map_3) { lhs, _ in
            // $sxq_xq_Iegnnrr_x3key_q_5valuetx_q_tIegnr_SHRzr0_lTRSO_s6UInt64VTG5072$sSD5merge_16uniquingKeysWithySDyxq_Gn_q_q__q_tKXEtKFx_q_tx_q_tcfU_SO_s6C4VTG5Tf3nnpf_n
            return lhs
        }
        
        // <+2028>
        // x24
        let map_4: [ObjectIdentifier : UInt64] = unsafe [
            ObjectIdentifier(AccessibilityRotorNavigationEvent.self) : EventBus.makeID("AccessibilityRotorNavigationEvent"),
            ObjectIdentifier(AccessibilityActivateEvent.self) : EventBus.makeID("AccessibilityActivateEvent"),
            ObjectIdentifier(AccessibilityIncrementEvent.self) : EventBus.makeID("AccessibilityIncrementEvent"),
            ObjectIdentifier(AccessibilityDecrementEvent.self) : EventBus.makeID("AccessibilityDecrementEvent"),
            ObjectIdentifier(AccessibilityCustomActionEvent.self) : EventBus.makeID("AccessibilityCustomActionEvent")
        ]
        
        // <+2268>
        map_1.merge(map_4) { lhs, _ in
            // $sxq_xq_Iegnnrr_x3key_q_5valuetx_q_tIegnr_SHRzr0_lTRSO_s6UInt64VTG5072$sSD5merge_16uniquingKeysWithySDyxq_Gn_q_q__q_tKXEtKFx_q_tx_q_tcfU_SO_s6C4VTG5Tf3nnpf_n
            return lhs
        }
        
        // <+2332>
        // x23
        let map_5: [ObjectIdentifier : UInt64] = unsafe [
            ObjectIdentifier(ManipulationEvents.WillBegin.self) : EventBus.makeID("ManipulationEvents.WillBegin"),
            ObjectIdentifier(ManipulationEvents.DidUpdateTransform.self) : EventBus.makeID("ManipulationEvents.DidUpdateTransform"),
            ObjectIdentifier(ManipulationEvents.WillEnd.self) : EventBus.makeID("ManipulationEvents.WillEnd"),
            ObjectIdentifier(ManipulationEvents.WillRelease.self) : EventBus.makeID("ManipulationEvents.WillRelease"),
            ObjectIdentifier(ManipulationEvents.DidReachMovementThreshold.self) : EventBus.makeID("ManipulationEvents.DidReachMovementThreshold"),
            ObjectIdentifier(ManipulationEvents.DidChangeGestureAnchorPoint.self) : EventBus.makeID("ManipulationEvents.DidChangeGestureAnchorPoint"),
            ObjectIdentifier(ManipulationEvents.DidHandOff.self) : EventBus.makeID("ManipulationEvents.DidHandOff")
        ]
        
        // <+2548>
        map_1.merge(map_5) { lhs, _ in
            // $sxq_xq_Iegnnrr_x3key_q_5valuetx_q_tIegnr_SHRzr0_lTRSO_s6UInt64VTG5072$sSD5merge_16uniquingKeysWithySDyxq_Gn_q_q__q_tKXEtKFx_q_tx_q_tcfU_SO_s6C4VTG5Tf3nnpf_n
            return lhs
        }
        
        return map_1
    }
}
