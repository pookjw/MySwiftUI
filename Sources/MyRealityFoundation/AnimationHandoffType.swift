@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
public struct AnimationHandoffType : Equatable {
    public static func snapshotAndReplace(applyToAllLayers: Bool = true) -> AnimationHandoffType {
        assertUnimplemented()
    }
    
    public static func replace(applyToAllLayers: Bool = true) -> AnimationHandoffType {
        assertUnimplemented()
    }
    
    public static var compose: AnimationHandoffType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var stop: AnimationHandoffType {
        get {
            assertUnimplemented()
        }
    }
    
    public static var `default`: AnimationHandoffType {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: AnimationHandoffType, b: AnimationHandoffType) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension AnimationHandoffType : Codable {
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
