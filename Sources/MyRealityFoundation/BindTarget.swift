@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public enum BindTarget : Equatable {
    @available(tvOS, unavailable)
    case `internal`(_: InternalBindPath)
    case transform
    case jointTransforms
    case parameter(_: String)
    case path(_: BindPath)
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    case opacity
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    case blendShapeWeights
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    case blendShapeWeightsAtIndex(_: Int = 0)
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    case blendShapeWeightsWithID(_: BlendShapeWeightsData.ID)
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    case billboardBlendFactor
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
    case skeletalPose(_: String)
    
    public struct ScenePath {
        public func anchorEntity(_ name: String) -> BindTarget.EntityPath {
            assertUnimplemented()
        }
        
        public var `self`: BindTarget {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public struct TextureCoordinateTransformPath {
        public var offset: BindTarget {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public struct MaterialPath {
        public var baseColorTint: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var roughnessScale: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var metallicScale: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var specularScale: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var sheenTint: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var clearcoatScale: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var clearcoatRoughnessScale: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var anisotropyLevelScale: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var anisotropyAngleScale: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var emissiveColor: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var emissiveIntensity: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var opacityThreshold: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var textureCoordinate: BindTarget.TextureCoordinateTransformPath {
            get {
                assertUnimplemented()
            }
        }
        
        public var secondaryTextureCoordinate: BindTarget.TextureCoordinateTransformPath {
            get {
                assertUnimplemented()
            }
        }
        
        public var customValue: BindTarget {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public struct EntityPath {
        public func entity(_ name: String) -> BindTarget.EntityPath {
            assertUnimplemented()
        }
        
        public var transform: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public var jointTransforms: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public func blendShapeWeights() -> BindTarget {
            assertUnimplemented()
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public func blendShapeWeightsAtIndex(_ index: Int = 0) -> BindTarget {
            assertUnimplemented()
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public func blendShapeWeightsWithID(_ id: BlendShapeWeightsData.ID) -> BindTarget {
            assertUnimplemented()
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public var billboardBlendFactor: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public func skeletalPose(_ name: SkeletalPose.ID) -> BindTarget {
            assertUnimplemented()
        }
        
        @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        public var opacity: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        public func parameter(_ name: String) -> BindTarget {
            assertUnimplemented()
        }
        
        @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        public func material(_ index: Int) -> BindTarget.MaterialPath {
            assertUnimplemented()
        }
        
        public var `self`: BindTarget {
            get {
                assertUnimplemented()
            }
        }
        
        @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        public func ikSolver(_ id: IKComponent.Solver.ID? = nil) -> BindTarget.IkSolverPath {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public struct IkSolverPath {
        public func constraintTarget(_ constraintName: String) -> BindTarget {
            assertUnimplemented()
        }
        
        public func constraintLookAtTarget(_ constraintName: String) -> BindTarget {
            assertUnimplemented()
        }
    }
    
    public static func scene(_ name: String) -> BindTarget.ScenePath {
        assertUnimplemented()
    }
    
    public static func anchorEntity(_ name: String) -> BindTarget.EntityPath {
        assertUnimplemented()
    }
    
    public static func entity(_ name: String) -> BindTarget.EntityPath {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public static func material(_ index: Int) -> BindTarget.MaterialPath {
        assertUnimplemented()
    }
    
    public static func == (lhs: BindTarget, rhs: BindTarget) -> Bool {
        assertUnimplemented()
    }
}
