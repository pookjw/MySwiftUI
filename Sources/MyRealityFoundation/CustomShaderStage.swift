@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
public enum CustomShaderStage : Equatable, Hashable, Sendable {
    case geometryModifier
    case surfaceShader
    
    public static func == (a: CustomShaderStage, b: CustomShaderStage) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}
