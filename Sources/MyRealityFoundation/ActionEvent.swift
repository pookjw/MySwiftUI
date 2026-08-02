public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ActionEvent<ActionType> where ActionType : EntityAction {
    public let playbackController: AnimationPlaybackController
    public let action: ActionType
    public let parameter: ActionType.EventParameterType?
    
    public var animationState: (any AnimationStateProtocol)? {
        get {
            assertUnimplemented()
        }
    }
    
    public let targetEntity: Entity?
    public let reversed: Bool
    public let startTime: TimeInterval
    public let duration: TimeInterval
    private let engine: __Engine
    private var coreAnimationState: OpaquePointer?
    private var deltaTime: Double?
    private var evaluationTime: Double?
    private var normalizedTime: Double?
    private let eventData: ActionEventData
    private let instanceID: UnsafeRawPointer
    
    init(
        playbackController: AnimationPlaybackController,
        action: ActionType,
        parameter: ActionType.EventParameterType?,
        targetEntity: MyRealityFoundation::Entity?,
        reversed: Bool,
        startTime: Double,
        duration: Double,
        engine: __Engine,
        coreAnimationState: OpaquePointer?,
        deltaTime: Double?,
        evaluationTime: Double?,
        normalizedTime: Double?,
        eventData: ActionEventData,
        instanceID: UnsafeRawPointer
    ) {
        self.playbackController = playbackController
        self.action = action
        self.parameter = parameter
        self.targetEntity = targetEntity
        self.reversed = reversed
        self.startTime = startTime
        self.duration = duration
        self.engine = engine
        unsafe self.coreAnimationState = coreAnimationState
        self.deltaTime = deltaTime
        self.evaluationTime = evaluationTime
        self.normalizedTime = normalizedTime
        self.eventData = eventData
        unsafe self.instanceID = instanceID
    } 
}
