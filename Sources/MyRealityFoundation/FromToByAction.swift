@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct FromToByAction<Value> : EntityAction, Codable where Value : AnimatableData {
    public let from: Value?
    
    public let to: Value?
    
    public let by: Value?
    
    public var timingFunction: AnimationTimingFunction
    
    public enum TransformMode : Equatable, Codable {
        case parent
        case local
        case scene
        case relative(to: ActionEntityResolution)
        
        public static var `default`: FromToByAction<Value>.TransformMode {
            get {
                assertUnimplemented()
            }
        }
        
        public static func == (a: FromToByAction<Value>.TransformMode, b: FromToByAction<Value>.TransformMode) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public var isAdditive: Bool
    
    public init(from: Value? = nil, to: Value, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public init(from: Value? = nil, by: Value, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public init(from: Value, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public init(to: Value, by: Value, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public let isReversible: Bool
    
    public let animatedValueType: (any AnimatableData.Type)?
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias EventParameterType = Never
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension FromToByAction where Value == Transform {
    public var mode: FromToByAction<Transform>.TransformMode? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(from: Value? = nil, to: Value, mode: FromToByAction<Value>.TransformMode = .default, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public init(from: Value, by: Value? = nil, mode: FromToByAction<Value>.TransformMode = .default, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public init(to: Value, by: Value, mode: FromToByAction<Value>.TransformMode = .default, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    public init(by: Value, timing: AnimationTimingFunction = .linear, isAdditive: Bool = false) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension FromToByAction {
    public enum DecodingErrors : Error {
        case unsupportedValueType
        
        public static func == (a: FromToByAction<Value>.DecodingErrors, b: FromToByAction<Value>.DecodingErrors) -> Bool {
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
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension FromToByAction.DecodingErrors : Equatable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension FromToByAction.DecodingErrors : Hashable {}
