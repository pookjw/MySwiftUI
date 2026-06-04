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
}
