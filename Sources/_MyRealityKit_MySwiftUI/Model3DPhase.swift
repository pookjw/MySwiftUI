@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public enum Model3DPhase {
    case empty
    case success(ResolvedModel3D)
    case failure(any Swift.Error)
    
    public var model: ResolvedModel3D? {
        get {
            assertUnimplemented()
        }
    }
    
    public var error: (any Swift.Error)? {
        get {
            assertUnimplemented()
        }
    }
}
