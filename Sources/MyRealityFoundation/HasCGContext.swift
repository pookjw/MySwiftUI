@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol __HasCGContext : HasTransform {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension __HasCGContext {
    @MainActor @preconcurrency public var cgContext: __CGContextComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
