public import Spatial

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
public struct ManipulationComponent : Component {
    public init() {
        assertUnimplemented()
    }
    
    public var dynamics: ManipulationComponent.Dynamics
    
    public var releaseBehavior: ManipulationComponent.ReleaseBehavior
    
    public var audioConfiguration: ManipulationComponent.AudioConfiguration
    
    public struct ReleaseBehavior : Equatable, Sendable {
        public static var reset: ManipulationComponent.ReleaseBehavior {
            get {
                assertUnimplemented()
            }
        }
        
        public static var stay: ManipulationComponent.ReleaseBehavior {
            get {
                assertUnimplemented()
            }
        }
        
        public static func == (a: ManipulationComponent.ReleaseBehavior, b: ManipulationComponent.ReleaseBehavior) -> Bool {
            assertUnimplemented()
        }
    }
    
    public struct AudioConfiguration : Equatable, Sendable {
        public static var `default`: ManipulationComponent.AudioConfiguration {
            get {
                assertUnimplemented()
            }
        }
        
        public static var none: ManipulationComponent.AudioConfiguration {
            get {
                assertUnimplemented()
            }
        }
        
        public static func == (a: ManipulationComponent.AudioConfiguration, b: ManipulationComponent.AudioConfiguration) -> Bool {
            assertUnimplemented()
        }
    }
    
    public struct HitTarget : Component {
        weak public var redirectedEntity: Entity? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init(redirectedEntity: Entity? = nil) {
            assertUnimplemented()
        }
    }
    
    public struct InputDevice : Hashable, Sendable {
        public enum Chirality : Hashable, Sendable {
            case left
            case right
            
            public static func == (a: ManipulationComponent.InputDevice.Chirality, b: ManipulationComponent.InputDevice.Chirality) -> Bool {
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
        
        public enum Kind : Int, Hashable, Sendable {
            case indirectPinch
            case directPinch
            case pointer
            
            public struct Set : OptionSet, Hashable, Sendable {
                public typealias Element = ManipulationComponent.InputDevice.Kind.Set
                
                public var rawValue: Int
                
                public init(rawValue: Int) {
                    assertUnimplemented()
                }
                
                public init(_ kind: ManipulationComponent.InputDevice.Kind) {
                    assertUnimplemented()
                }
                
                public static var indirectPinch: ManipulationComponent.InputDevice.Kind.Set {
                    get {
                        assertUnimplemented()
                    }
                }
                
                public static var directPinch: ManipulationComponent.InputDevice.Kind.Set {
                    get {
                        assertUnimplemented()
                    }
                }
                
                public static var pointer: ManipulationComponent.InputDevice.Kind.Set {
                    get {
                        assertUnimplemented()
                    }
                }
                
                public static var all: ManipulationComponent.InputDevice.Kind.Set {
                    get {
                        assertUnimplemented()
                    }
                }
                
                @available(visionOS 26.0, *)
                @available(iOS, unavailable)
                @available(tvOS, unavailable)
                @available(watchOS, unavailable)
                @available(macOS, unavailable)
                @available(macCatalyst, unavailable)
                public typealias ArrayLiteralElement = ManipulationComponent.InputDevice.Kind.Set.Element
                
                @available(visionOS 26.0, *)
                @available(iOS, unavailable)
                @available(tvOS, unavailable)
                @available(watchOS, unavailable)
                @available(macOS, unavailable)
                @available(macCatalyst, unavailable)
                public typealias RawValue = Int
            }
            
            public init?(rawValue: Int) {
                assertUnimplemented()
            }
            
            @available(visionOS 26.0, *)
            @available(iOS, unavailable)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            @available(macOS, unavailable)
            @available(macCatalyst, unavailable)
            public typealias RawValue = Int
            
            public var rawValue: Int {
                get {
                    assertUnimplemented()
                }
            }
        }
        
        public var chirality: ManipulationComponent.InputDevice.Chirality? {
            get {
                assertUnimplemented()
            }
        }
        
        public var kind: ManipulationComponent.InputDevice.Kind {
            get {
                assertUnimplemented()
            }
        }
        
        public var pose: Pose3DFloat? {
            get {
                assertUnimplemented()
            }
        }
        
        public static func == (a: ManipulationComponent.InputDevice, b: ManipulationComponent.InputDevice) -> Bool {
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
    
    public struct Dynamics : Sendable {
        public struct TranslationBehavior : Hashable, Sendable {
            public static var none: ManipulationComponent.Dynamics.TranslationBehavior {
                get {
                    assertUnimplemented()
                }
            }
            
            public static var unconstrained: ManipulationComponent.Dynamics.TranslationBehavior {
                get {
                    assertUnimplemented()
                }
            }
            
            public static func == (a: ManipulationComponent.Dynamics.TranslationBehavior, b: ManipulationComponent.Dynamics.TranslationBehavior) -> Bool {
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
        
        public struct RotationBehavior : Hashable, Sendable {
            public static var none: ManipulationComponent.Dynamics.RotationBehavior {
                get {
                    assertUnimplemented()
                }
            }
            
            public static var unconstrained: ManipulationComponent.Dynamics.RotationBehavior {
                get {
                    assertUnimplemented()
                }
            }
            
            public static func == (a: ManipulationComponent.Dynamics.RotationBehavior, b: ManipulationComponent.Dynamics.RotationBehavior) -> Bool {
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
        
        public struct ScalingBehavior : Hashable, Sendable {
            public static var none: ManipulationComponent.Dynamics.ScalingBehavior {
                get {
                    assertUnimplemented()
                }
            }
            
            public static var unconstrained: ManipulationComponent.Dynamics.ScalingBehavior {
                get {
                    assertUnimplemented()
                }
            }
            
            public static func == (a: ManipulationComponent.Dynamics.ScalingBehavior, b: ManipulationComponent.Dynamics.ScalingBehavior) -> Bool {
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
        
        public struct Inertia : Hashable, Sendable {
            public static var zero: ManipulationComponent.Dynamics.Inertia {
                get {
                    assertUnimplemented()
                }
            }
            
            public static var low: ManipulationComponent.Dynamics.Inertia {
                get {
                    assertUnimplemented()
                }
            }
            
            public static var medium: ManipulationComponent.Dynamics.Inertia {
                get {
                    assertUnimplemented()
                }
            }
            
            public static var high: ManipulationComponent.Dynamics.Inertia {
                get {
                    assertUnimplemented()
                }
            }
            
            public static func == (a: ManipulationComponent.Dynamics.Inertia, b: ManipulationComponent.Dynamics.Inertia) -> Bool {
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
        
        public var inertia: ManipulationComponent.Dynamics.Inertia
        
        public var scalingBehavior: ManipulationComponent.Dynamics.ScalingBehavior
        
        public var secondaryRotationBehavior: ManipulationComponent.Dynamics.RotationBehavior
        
        public var primaryRotationBehavior: ManipulationComponent.Dynamics.RotationBehavior
        
        public var translationBehavior: ManipulationComponent.Dynamics.TranslationBehavior
        
        public init() {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension ManipulationComponent {
    public static func configureEntity(_ entity: Entity, hoverEffect: HoverEffectComponent.HoverEffect? = nil, allowedInputTypes: InputTargetComponent.InputType? = nil, collisionShapes: [ShapeResource]? = nil) {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension ManipulationComponent.InputDevice.Kind : RawRepresentable {}
