public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct BillboardAction : EntityAction, Codable {
    public struct Transition : Codable {
        public var duration: TimeInterval
        
        public var timingFunction: AnimationTimingFunction
        
        public init(duration: TimeInterval = 0, timingFunction: AnimationTimingFunction = .default) {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public var transitionIn: BillboardAction.Transition
    
    public var transitionOut: BillboardAction.Transition
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(transitionIn: BillboardAction.Transition = .init(), transitionOut: BillboardAction.Transition = .init()) {
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
