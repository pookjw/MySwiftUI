public import Foundation
public import UIKit

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.Presets {
    public static var impact: ParticleEmitterComponent {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.ParticleEmitter {
    public typealias Color = UIColor
    
    public enum ParticleColor : Equatable {
        public enum ColorValue : Equatable {
            case single(ParticleEmitterComponent.ParticleEmitter.Color)
            case random(a: ParticleEmitterComponent.ParticleEmitter.Color, b: ParticleEmitterComponent.ParticleEmitter.Color)
            
            public static func == (a: ParticleEmitterComponent.ParticleEmitter.ParticleColor.ColorValue, b: ParticleEmitterComponent.ParticleEmitter.ParticleColor.ColorValue) -> Bool {
                assertUnimplemented()
            }
        }
        case constant(ParticleEmitterComponent.ParticleEmitter.ParticleColor.ColorValue)
        case evolving(start: ParticleEmitterComponent.ParticleEmitter.ParticleColor.ColorValue, end: ParticleEmitterComponent.ParticleEmitter.ParticleColor.ColorValue)
        
        public static func == (a: ParticleEmitterComponent.ParticleEmitter.ParticleColor, b: ParticleEmitterComponent.ParticleEmitter.ParticleColor) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var color: ParticleEmitterComponent.ParticleEmitter.ParticleColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent {
    public enum Timing : Equatable, Codable {
        case once(warmUp: TimeInterval? = nil, emit: ParticleEmitterComponent.Timing.VariableDuration)
        case repeating(warmUp: TimeInterval? = nil, emit: ParticleEmitterComponent.Timing.VariableDuration, idle: ParticleEmitterComponent.Timing.VariableDuration? = nil)
        
        public struct VariableDuration : Equatable, Codable {
            public let duration: TimeInterval
            
            public let variation: TimeInterval?
            
            public init(duration: TimeInterval, variation: TimeInterval? = nil) {
                assertUnimplemented()
            }
            
            public static func == (lhs: ParticleEmitterComponent.Timing.VariableDuration, rhs: ParticleEmitterComponent.Timing.VariableDuration) -> Bool {
                assertUnimplemented()
            }
            
            public func encode(to encoder: any Encoder) throws {
                assertUnimplemented()
            }
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public static func == (lhs: ParticleEmitterComponent.Timing, rhs: ParticleEmitterComponent.Timing) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public var timing: ParticleEmitterComponent.Timing {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent {
    public struct Presets {
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.Presets {
    public static var snow: ParticleEmitterComponent {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.Presets {
    public static var sparks: ParticleEmitterComponent {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.Presets {
    public static var magic: ParticleEmitterComponent {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.Presets {
    public static var rain: ParticleEmitterComponent {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.Presets {
    public static var fireworks: ParticleEmitterComponent {
        get {
            assertUnimplemented()
        }
    }
}
