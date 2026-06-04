public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKChangeSceneActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var sceneRoot: UUID
    
    public var targetSceneIdentifier: UUID
    
    public init(sceneRoot: UUID, targetSceneIdentifier: UUID) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKChangeSceneActionArguments, b: __RKChangeSceneActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
