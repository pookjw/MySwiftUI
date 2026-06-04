@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension ParticleEmitterComponent : _ImplicitlyAnimatableBuiltinComponent {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct ParticleEmitterComponent : Component, Codable {
    public enum EmitterShape : Codable, Equatable, Hashable {
        case point
        case plane
        case box
        case sphere
        case cone
        case cylinder
        case torus
        
        public static func == (a: ParticleEmitterComponent.EmitterShape, b: ParticleEmitterComponent.EmitterShape) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
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
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public enum BirthLocation : Codable, Equatable, Hashable {
        case surface
        case volume
        case vertices(count: SIMD3<UInt>)
        
        public static func == (a: ParticleEmitterComponent.BirthLocation, b: ParticleEmitterComponent.BirthLocation) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
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
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public enum BirthDirection : Codable, Equatable, Hashable {
        case world
        case local
        case normal
        
        public static func == (a: ParticleEmitterComponent.BirthDirection, b: ParticleEmitterComponent.BirthDirection) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
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
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public enum SpawnOccasion : Codable, Equatable, Hashable {
        case onBirth
        case onUpdate
        case onDeath
        
        public static func == (a: ParticleEmitterComponent.SpawnOccasion, b: ParticleEmitterComponent.SpawnOccasion) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
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
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public enum SimulationSpace : Codable {
        case local
        case global
        
        public static func == (a: ParticleEmitterComponent.SimulationSpace, b: ParticleEmitterComponent.SimulationSpace) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
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
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public enum SimulationState : Codable {
        case play
        case pause
        case stop
        
        public static func == (a: ParticleEmitterComponent.SimulationState, b: ParticleEmitterComponent.SimulationState) -> Bool {
            assertUnimplemented()
        }
        
        public func encode(to encoder: any Encoder) throws {
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
        
        public init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public var emitterShape: ParticleEmitterComponent.EmitterShape
    
    public var birthLocation: ParticleEmitterComponent.BirthLocation
    
    public var birthDirection: ParticleEmitterComponent.BirthDirection
    
    public var emitterShapeSize: SIMD3<Float>
    
    public var speed: Float
    
    public var speedVariation: Float
    
    public var emissionDirection: SIMD3<Float>
    
    public var radialAmount: Float
    
    public var torusInnerRadius: Float
    
    public var spawnOccasion: ParticleEmitterComponent.SpawnOccasion
    
    public var spawnVelocityFactor: Float
    
    public var spawnSpreadFactor: Float
    
    public var spawnSpreadFactorVariation: Float
    
    public var spawnInheritsParentColor: Bool
    
    public var simulationState: ParticleEmitterComponent.SimulationState
    
    public var particlesInheritTransform: Bool
    
    public var fieldSimulationSpace: ParticleEmitterComponent.SimulationSpace
    
    public mutating func restart() {
        assertUnimplemented()
    }
    
    public var isEmitting: Bool
    
    public mutating func burst() {
        assertUnimplemented()
    }
    
    public var burstCount: Int
    
    public var burstCountVariation: Int
    
    public var mainEmitter: ParticleEmitterComponent.ParticleEmitter
    
    public var spawnedEmitter: ParticleEmitterComponent.ParticleEmitter? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public struct ParticleEmitter {
        public enum BillboardMode : Codable, Equatable, Hashable {
            case billboard
            case billboardYAligned
            case free(axis: SIMD3<Float>, variation: Float)
            
            public static func == (a: ParticleEmitterComponent.ParticleEmitter.BillboardMode, b: ParticleEmitterComponent.ParticleEmitter.BillboardMode) -> Bool {
                assertUnimplemented()
            }
            
            public func encode(to encoder: any Encoder) throws {
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
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public enum OpacityCurve : Codable, Equatable, Hashable {
            case linearFadeOut
            case linearFadeIn
            case gradualFadeInOut
            case quickFadeInOut
            case easeFadeIn
            case easeFadeOut
            case constant
            
            public static func == (a: ParticleEmitterComponent.ParticleEmitter.OpacityCurve, b: ParticleEmitterComponent.ParticleEmitter.OpacityCurve) -> Bool {
                assertUnimplemented()
            }
            
            public func encode(to encoder: any Encoder) throws {
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
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public enum SortOrder : Codable, Equatable, Hashable {
            case increasingDepth
            case decreasingDepth
            case increasingID
            case decreasingID
            case increasingAge
            case decreasingAge
            case unsorted
            
            public static func == (a: ParticleEmitterComponent.ParticleEmitter.SortOrder, b: ParticleEmitterComponent.ParticleEmitter.SortOrder) -> Bool {
                assertUnimplemented()
            }
            
            public func encode(to encoder: any Encoder) throws {
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
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public enum BlendMode : Codable, Equatable, Hashable {
            case alpha
            case opaque
            case additive
            
            public static func == (a: ParticleEmitterComponent.ParticleEmitter.BlendMode, b: ParticleEmitterComponent.ParticleEmitter.BlendMode) -> Bool {
                assertUnimplemented()
            }
            
            public func encode(to encoder: any Encoder) throws {
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
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public struct ImageSequence : Codable, Equatable, Hashable {
            public var rowCount: Int
            
            public var columnCount: Int
            
            public var initialFrame: Int
            
            public var initialFrameVariation: Int
            
            public var frameRate: Float
            
            public var frameRateVariation: Float
            
            public var animationMode: ParticleEmitterComponent.ParticleEmitter.ImageSequence.AnimationRepeatMode
            
            public enum AnimationRepeatMode : Codable, Equatable, Hashable {
                case playOnce
                case looping
                case autoReverse
                
                public static func == (a: ParticleEmitterComponent.ParticleEmitter.ImageSequence.AnimationRepeatMode, b: ParticleEmitterComponent.ParticleEmitter.ImageSequence.AnimationRepeatMode) -> Bool {
                    assertUnimplemented()
                }
                
                public func encode(to encoder: any Encoder) throws {
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
                
                public init(from decoder: any Decoder) throws {
                    assertUnimplemented()
                }
            }
            
            public init() {
                assertUnimplemented()
            }
            
            public static func == (a: ParticleEmitterComponent.ParticleEmitter.ImageSequence, b: ParticleEmitterComponent.ParticleEmitter.ImageSequence) -> Bool {
                assertUnimplemented()
            }
            
            public func encode(to encoder: any Encoder) throws {
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
            
            public init(from decoder: any Decoder) throws {
                assertUnimplemented()
            }
        }
        
        public var birthRate: Float
        
        public var birthRateVariation: Float
        
        public var dampingFactor: Float
        
        public var acceleration: SIMD3<Float>
        
        public var spreadingAngle: Float
        
        public var size: Float
        
        public var sizeVariation: Float
        
        public var billboardMode: ParticleEmitterComponent.ParticleEmitter.BillboardMode
        
        public var mass: Float
        
        public var massVariation: Float
        
        public var lifeSpan: Double
        
        public var lifeSpanVariation: Double
        
        public var angle: Float
        
        public var angleVariation: Float
        
        public var angularSpeed: Float
        
        public var angularSpeedVariation: Float
        
        public var opacityCurve: ParticleEmitterComponent.ParticleEmitter.OpacityCurve
        
        public var sizeMultiplierAtEndOfLifespan: Float
        
        public var sizeMultiplierAtEndOfLifespanPower: Float
        
        public var colorEvolutionPower: Float
        
        public var noiseStrength: Float
        
        public var noiseScale: Float
        
        public var noiseAnimationSpeed: Float
        
        public var attractionStrength: Float
        
        public var attractionCenter: SIMD3<Float>
        
        public var vortexStrength: Float
        
        public var vortexDirection: SIMD3<Float>
        
        public var isLightingEnabled: Bool
        
        public var stretchFactor: Float
        
        public var sortOrder: ParticleEmitterComponent.ParticleEmitter.SortOrder
        
        public var blendMode: ParticleEmitterComponent.ParticleEmitter.BlendMode
        
        public var image: TextureResource?
        
        public var imageSequence: ParticleEmitterComponent.ParticleEmitter.ImageSequence?
        
        public init() {
            assertUnimplemented()
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> ParticleEmitterComponent {
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

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.ParticleEmitter : Codable {
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.SimulationSpace : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.SimulationSpace : Hashable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.SimulationState : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ParticleEmitterComponent.SimulationState : Hashable {}
