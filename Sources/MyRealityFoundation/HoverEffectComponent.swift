public import Foundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct HoverEffectComponent : Component {
    @available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
    public struct HoverEffect {
        public static func spotlight(_ style: HoverEffectComponent.SpotlightHoverEffectStyle) -> HoverEffectComponent.HoverEffect {
            assertUnimplemented()
        }
        
        public static func highlight(_ style: HoverEffectComponent.HighlightHoverEffectStyle) -> HoverEffectComponent.HoverEffect {
            assertUnimplemented()
        }
        
        public static func shader(_ inputs: HoverEffectComponent.ShaderHoverEffectInputs) -> HoverEffectComponent.HoverEffect {
            assertUnimplemented()
        }
        
        @available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, *)
        public var groupID: HoverEffectComponent.GroupID? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, *)
        public static func spotlight(_ style: HoverEffectComponent.SpotlightHoverEffectStyle, groupID: HoverEffectComponent.GroupID) -> HoverEffectComponent.HoverEffect {
            assertUnimplemented()
        }
        
        @available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, *)
        public static func highlight(_ style: HoverEffectComponent.HighlightHoverEffectStyle, groupID: HoverEffectComponent.GroupID) -> HoverEffectComponent.HoverEffect {
            assertUnimplemented()
        }
        
        @available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, *)
        public static func shader(_ inputs: HoverEffectComponent.ShaderHoverEffectInputs, groupID: HoverEffectComponent.GroupID) -> HoverEffectComponent.HoverEffect {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
    public var hoverEffect: HoverEffectComponent.HoverEffect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
    public enum OpacityFunction : Hashable, Sendable {
        case full
        case mask
        case blend
        
        public static func == (a: HoverEffectComponent.OpacityFunction, b: HoverEffectComponent.OpacityFunction) -> Bool {
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
    
    @available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
    public struct SpotlightHoverEffectStyle : Equatable {
        @safe public static nonisolated(unsafe) let `default`: HoverEffectComponent.SpotlightHoverEffectStyle = {
            assertUnimplemented()
        }()
        
        public var strength: Float
        
        public var opacityFunction: HoverEffectComponent.OpacityFunction
        
        public static func == (a: HoverEffectComponent.SpotlightHoverEffectStyle, b: HoverEffectComponent.SpotlightHoverEffectStyle) -> Bool {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
    public struct HighlightHoverEffectStyle : Equatable {
        @safe public static nonisolated(unsafe) let `default`: HoverEffectComponent.HighlightHoverEffectStyle = {
            assertUnimplemented()
        }()
        
        public var strength: Float
        
        public var opacityFunction: HoverEffectComponent.OpacityFunction
        
        public static func == (a: HoverEffectComponent.HighlightHoverEffectStyle, b: HoverEffectComponent.HighlightHoverEffectStyle) -> Bool {
            assertUnimplemented()
        }
    }
    
    @available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
    public struct ShaderHoverEffectInputs : Equatable {
        @safe public static nonisolated(unsafe) let `default`: HoverEffectComponent.ShaderHoverEffectInputs = {
            assertUnimplemented()
        }()
        
        public var fadeInDuration: TimeInterval {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var fadeOutDuration: TimeInterval {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init(fadeInDuration: TimeInterval, fadeOutDuration: TimeInterval) {
            assertUnimplemented()
        }
        
        public static func == (a: HoverEffectComponent.ShaderHoverEffectInputs, b: HoverEffectComponent.ShaderHoverEffectInputs) -> Bool {
            assertUnimplemented()
        }
    }
    
    public init() {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
    public init(_ hoverEffect: HoverEffectComponent.HoverEffect) {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension HoverEffectComponent {
    public struct GroupID : Hashable, Sendable {
        public init() {
            assertUnimplemented()
        }
        
        public static func == (a: HoverEffectComponent.GroupID, b: HoverEffectComponent.GroupID) -> Bool {
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
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension HoverEffectComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> HoverEffectComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
