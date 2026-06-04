public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityStartAnimateActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public let loopCount: Int
    
    public let multiplePerformBehavior: __RKEntityActionMultiplePerformBehavior
    
    public let clipStart: Double
    
    public let clipDuration: Double
    
    public let clipReverses: Bool
    
    public let clipReversed: Bool
    
    public let animationSpeed: Float
    
    public let muteAudio: Bool?
    
    public let audioGain: Double?
    
    public var targetAnimation: UUID?
    
    public init(target: UUID, loopCount: Int = 1, multiplePerformBehavior: __RKEntityActionMultiplePerformBehavior = .ignore, clipStart: Double = 0.0, clipDuration: Double = 0.0, clipReversed: Bool = false, animationSpeed: Float = 1.0, clipReverses: Bool = false) {
        assertUnimplemented()
    }
    
    @available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
    public init(target: UUID, loopCount: Int = 1, multiplePerformBehavior: __RKEntityActionMultiplePerformBehavior = .ignore, clipStart: Double = 0.0, clipDuration: Double = 0.0, clipReversed: Bool = false, animationSpeed: Float = 1.0, clipReverses: Bool = false, muteAudio: Bool = false, audioGain: Double = 1.0, targetAnimation: UUID? = nil) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityStartAnimateActionArguments, b: __RKEntityStartAnimateActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
