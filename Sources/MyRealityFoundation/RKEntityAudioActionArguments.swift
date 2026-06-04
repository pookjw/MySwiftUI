public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityAudioActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var path: String
    
    public var type: __RKEntityAudioActionType?
    
    public var volume: Double?
    
    public var loops: Bool?
    
    public var spatialMode: __RKAudioSpatialModeSelection?
    
    public let multiplePerformBehavior: __RKEntityActionMultiplePerformBehavior?
    
    public init(target: UUID, path: String, type: __RKEntityAudioActionType, spatialMode: __RKAudioSpatialModeSelection, volume: Double = 0.5, loops: Bool = false, multiplePerformBehavior: __RKEntityActionMultiplePerformBehavior = .ignore) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityAudioActionArguments, b: __RKEntityAudioActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
