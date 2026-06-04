@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
public enum CustomMaterialError : Error {
    case geometryModifierFunctionNotFound
    case surfaceShaderFunctionNotFound
    case defaultSurfaceShaderForMaterialNotFound
    
    public static func == (a: CustomMaterialError, b: CustomMaterialError) -> Bool {
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

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterialError : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterialError : Hashable {}
