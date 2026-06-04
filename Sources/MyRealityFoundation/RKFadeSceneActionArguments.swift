@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKFadeSceneActionArguments : Codable, Equatable {
    public var targetOpacity: Float
    
    public var duration: Float?
    
    public init(targetOpacity: Float, duration: Float = 0.0) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKFadeSceneActionArguments, b: __RKFadeSceneActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
