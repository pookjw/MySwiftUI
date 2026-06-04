@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct EmphasizeAction : EntityAction, Codable {
    public enum EmphasisAnimationStyle : Int, Codable {
        case basic
        case playful
        case wild
        
        public init?(rawValue: Int) {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias RawValue = Int
        
        public var rawValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public enum EmphasisMotionType : Int, Codable {
        case pop
        case blink
        case bounce
        case flip
        case float
        case jiggle
        case pulse
        case spin
        
        public init?(rawValue: Int) {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias RawValue = Int
        
        public var rawValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var motionType: EmphasizeAction.EmphasisMotionType
    
    public var style: EmphasizeAction.EmphasisAnimationStyle
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public var isAdditive: Bool
    
    public init(motionType: EmphasizeAction.EmphasisMotionType, style: EmphasizeAction.EmphasisAnimationStyle = .basic, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias EventParameterType = Never
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EmphasizeAction.EmphasisAnimationStyle : Equatable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EmphasizeAction.EmphasisAnimationStyle : Hashable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EmphasizeAction.EmphasisAnimationStyle : RawRepresentable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EmphasizeAction.EmphasisMotionType : Equatable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EmphasizeAction.EmphasisMotionType : Hashable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EmphasizeAction.EmphasisMotionType : RawRepresentable {}
