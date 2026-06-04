public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityStartAnimateAction : __RKEntityAnimateAction {
    public init(targetEntity: Entity?, loopCount: Int = 1, multiplePerformBehavior: __RKEntityActionMultiplePerformBehavior = .ignore, clipStart: Double = 0.0, clipDuration: Double = 0.0, clipReversed: Bool = false, animationSpeed: Float = 1.0, clipReverses: Bool = false, muteAudio: Bool = false, audioGain: Double = 1.0, targetAnimationEntity: Entity? = nil) {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    override public func reversed() -> __RKEntityAction? {
        assertUnimplemented()
    }
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
    }
