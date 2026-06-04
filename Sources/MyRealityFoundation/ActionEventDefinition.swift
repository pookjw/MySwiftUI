public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ActionEventDefinition<ActionType> where ActionType : EntityAction {
    public typealias EventParameterType = ActionType.EventParameterType
    
    public init(startTime: TimeInterval, duration: TimeInterval, parameter: ActionEventDefinition<ActionType>.EventParameterType? = nil) {
        assertUnimplemented()
    }
    
    public var startTime: TimeInterval
    
    public var duration: TimeInterval
    
    public var parameter: ActionEventDefinition<ActionType>.EventParameterType?
}
