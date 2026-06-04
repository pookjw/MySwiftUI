@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct AnimationTimingFunction : Hashable {
    public enum __Mode {
        case easeIn
        case easeOut
        case easeInOut
        
        public static func == (a: AnimationTimingFunction.__Mode, b: AnimationTimingFunction.__Mode) -> Bool {
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
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __smooth(_ mode: AnimationTimingFunction.__Mode = .easeInOut) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __back(_ mode: AnimationTimingFunction.__Mode = .easeIn, amplitude: Float = 1) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __bounce(_ mode: AnimationTimingFunction.__Mode = .easeOut, bounces: Int = 3, bounciness: Float = 2) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __circle(_ mode: AnimationTimingFunction.__Mode = .easeIn) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __exponential(_ mode: AnimationTimingFunction.__Mode = .easeIn, exponent: Float = 2) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __logarithmic(_ mode: AnimationTimingFunction.__Mode = .easeIn, base: Float = 2) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __power(_ mode: AnimationTimingFunction.__Mode = .easeIn, power: Float = 2) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __sine(_ mode: AnimationTimingFunction.__Mode = .easeIn) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Renamed to `elastic`.")
    public static func __spring(_ mode: AnimationTimingFunction.__Mode = .easeOut, oscillations: Int = 2, springiness: Float = 2) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Will be hidden in RealityKit 2019.")
    public static func __elastic(_ mode: AnimationTimingFunction.__Mode = .easeOut, oscillations: Int = 2, springiness: Float = 2) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    public static var `default`: AnimationTimingFunction {
        get {
            assertUnimplemented()
        }
    }
    
    public static var linear: AnimationTimingFunction {
        get {
            assertUnimplemented()
        }
    }
    
    public static var easeIn: AnimationTimingFunction {
        get {
            assertUnimplemented()
        }
    }
    
    public static var easeOut: AnimationTimingFunction {
        get {
            assertUnimplemented()
        }
    }
    
    public static var easeInOut: AnimationTimingFunction {
        get {
            assertUnimplemented()
        }
    }
    
    public static func cubicBezier(controlPoint1: SIMD2<Float>, controlPoint2: SIMD2<Float>) -> AnimationTimingFunction {
        assertUnimplemented()
    }
    
    public static func == (a: AnimationTimingFunction, b: AnimationTimingFunction) -> Bool {
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

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension AnimationTimingFunction : Codable {
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AnimationTimingFunction.__Mode : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AnimationTimingFunction.__Mode : Hashable {}
