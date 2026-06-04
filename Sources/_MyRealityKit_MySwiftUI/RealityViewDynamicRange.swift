@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct RealityViewDynamicRange : Hashable, Sendable {
    public static var `default`: RealityViewDynamicRange {
        get {
            assertUnimplemented()
        }
    }
    
    public static var standard: RealityViewDynamicRange {
        get {
            assertUnimplemented()
        }
    }
    
    @usableFromInline
    internal static var _hdrRendering: RealityViewDynamicRange {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: RealityViewDynamicRange, b: RealityViewDynamicRange) -> Bool {
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
