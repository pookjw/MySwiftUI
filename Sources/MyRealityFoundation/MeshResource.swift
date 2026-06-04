public import Foundation
public import simd

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class MeshResource : Resource {
    @MainActor @preconcurrency public var expectedMaterialCount: Int {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var bounds: BoundingBox {
        assertUnimplemented()
    }
    
    @objc deinit {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use Entity.loadModel(named:in:) instead")
    @MainActor @preconcurrency public static func __load(named name: String, in bundle: Bundle? = nil) throws -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateBox(size: Float, cornerRadius: Float = 0) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateBox(size: SIMD3<Float>, cornerRadius: Float = 0) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateBox(width: Float, height: Float, depth: Float, cornerRadius: Float = 0, splitFaces: Bool = false) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generatePlane(width: Float, height: Float, cornerRadius: Float = 0) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generatePlane(width: Float, depth: Float, cornerRadius: Float = 0) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __generatePlane(width: Float = 1, widthSegmentCount: UInt = 1, depth: Float = 1, depthSegmentCount: UInt = 1, cornerRadius: Float = 0, cornerSegmentCount: UInt = 0, addUVs: Bool = true, addNormals: Bool = true) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __generateOccluderPlane(width: Float, depth: Float, cornerRadius: Float = 0) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateSphere(radius: Float) -> MeshResource {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension MeshResource {
    @MainActor @preconcurrency public static func generateBox(size: SIMD3<Float>, majorCornerRadius: Float = 0.2, minorCornerRadius: Float = 0.05) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateCone(height: Float, radius: Float) -> MeshResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateCylinder(height: Float, radius: Float) -> MeshResource {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension MeshResource {
    @MainActor @preconcurrency convenience public init(shape resource: ShapeResource) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(shape resource: ShapeResource) async {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MeshResource {
    public struct Part : MeshBufferContainer, Identifiable {
        public var id: String {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var materialIndex: Int {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init(id: String, materialIndex: Int) {
            assertUnimplemented()
        }
        
        public var triangleIndices: MeshBuffers.TriangleIndices? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var buffers: [MeshBuffers.Identifier : AnyMeshBuffer] {
            assertUnimplemented()
        }
        
        public subscript<S>(semantic: S) -> MeshBuffer<S.Element>? where S : MeshBufferSemantic {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias ID = String
    }
    
    public struct Model : Identifiable {
        public var id: String {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var parts: MeshPartCollection {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init(id: String, parts: [MeshResource.Part]) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public init(id modelID: String, descriptors: [MeshDescriptor]) throws {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias ID = String
    }
    
    public struct Instance : Identifiable {
        public var id: String {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var model: String {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var transform: simd_float4x4 {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init(id: String, model: String, at transform: simd_float4x4? = nil) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias ID = String
    }
    
    public struct Contents {
        public var models: MeshModelCollection {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var instances: MeshInstanceCollection {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init() {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var contents: MeshResource.Contents {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func replace(with content: MeshResource.Contents) throws {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "replace(with:)")
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "replace(with:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "replace(with:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "replace(with:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public func replaceAsync(with content: MeshResource.Contents) -> LoadRequest<MeshResource> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generate(from content: MeshResource.Contents) throws -> MeshResource {
        assertUnimplemented()
    }
    
    nonisolated convenience public init(from content: MeshResource.Contents) async throws {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(from:)")
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "init(from:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "init(from:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "init(from:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func generateAsync(from content: MeshResource.Contents) -> LoadRequest<MeshResource> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generate(from descriptors: [MeshDescriptor]) throws -> MeshResource {
        assertUnimplemented()
    }
    
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(from:)")
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "init(from:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "init(from:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "init(from:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func generateAsync(from descriptors: [MeshDescriptor]) -> LoadRequest<MeshResource> {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource {
    public struct Skeleton : Identifiable {
        public struct Joint : Equatable {
            public var name: String {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
            
            public var parentIndex: Int? {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
            
            public var inverseBindPoseMatrix: simd_float4x4 {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
            
            public var restPoseTransform: Transform {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
            
            public init(name: String, parentIndex: Int?, inverseBindPoseMatrix: simd_float4x4, restPoseTransform: Transform) {
                assertUnimplemented()
            }
            
            public static func == (a: MeshResource.Skeleton.Joint, b: MeshResource.Skeleton.Joint) -> Bool {
                assertUnimplemented()
            }
        }
        
        public var id: String {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var joints: [MeshResource.Skeleton.Joint] {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init(id: String, joints: [MeshResource.Skeleton.Joint]) {
            assertUnimplemented()
        }
        
        public init?(id: String, jointNames: [String], inverseBindPoseMatrices: [simd_float4x4], restPoseTransforms: [Transform]? = nil, parentIndices: [Int?]? = nil) {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias ID = String
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource.Part {
    public var skeletonID: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var jointInfluences: MeshResource.JointInfluences? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource {
    public struct JointInfluences {
        public var influences: MeshBuffers.JointInfluences {
            assertUnimplemented()
        }
        
        public init(influences: MeshBuffers.JointInfluences, influencesPerVertex: Int) {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource.Contents {
    public var skeletons: MeshSkeletonCollection {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource {
    nonisolated convenience public init(from descriptors: [MeshDescriptor]) async throws {
        assertUnimplemented()
    }
    
    nonisolated public func replace(with content: MeshResource.Contents) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource {
    @MainActor @preconcurrency convenience public init(from mesh: LowLevelMesh) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(from mesh: LowLevelMesh) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var lowLevelMesh: LowLevelMesh? {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource {
    public struct GenerateTextOptions : Sendable {
        public var containerFrame: CGRect? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init() {
            assertUnimplemented()
        }
    }
    
    public struct ShapeExtrusionOptions : Sendable {
        public enum CurveStrokeResolution : Sendable {
            case uniformSegmentsPerSpan(segmentCount: Int)
        }
        
        public enum ChamferMode : Sendable {
            case front
            case back
            case both
            
            public static func == (a: MeshResource.ShapeExtrusionOptions.ChamferMode, b: MeshResource.ShapeExtrusionOptions.ChamferMode) -> Bool {
                assertUnimplemented()
            }
            
            public func hash(into hasher: inout Hasher) {
                assertUnimplemented()
            }
            
            public var hashValue: Int {
                assertUnimplemented()
            }
        }
        
        public struct MaterialAssignment : Sendable {
            public init(assignAll all: UInt32) {
                assertUnimplemented()
            }
            
            public init(front: UInt32 = 0, back: UInt32 = 0, extrusion: UInt32 = 0, frontChamfer: UInt32 = 0, backChamfer: UInt32 = 0) {
                assertUnimplemented()
            }
        }
        
        public enum ExtrusionMethod : Sendable {
            case linear(depth: Float)
            case tracePositions([SIMD3<Float>])
            case traceTransforms([simd_float4x4])
        }
        
        public init() {
            assertUnimplemented()
        }
        
        public var extrusionMethod: MeshResource.ShapeExtrusionOptions.ExtrusionMethod {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var chamferRadius: Float {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var boundaryResolution: MeshResource.ShapeExtrusionOptions.CurveStrokeResolution {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var chamferResolution: MeshResource.ShapeExtrusionOptions.CurveStrokeResolution {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var chamferMode: MeshResource.ShapeExtrusionOptions.ChamferMode {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var materialAssignment: MeshResource.ShapeExtrusionOptions.MaterialAssignment {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
    
    @MainActor @preconcurrency convenience public init(extruding string: AttributedString, textOptions: MeshResource.GenerateTextOptions = GenerateTextOptions(), extrusionOptions: MeshResource.ShapeExtrusionOptions = ShapeExtrusionOptions()) throws {
        assertUnimplemented()
    }
    
    nonisolated convenience public init(extruding string: AttributedString, textOptions: MeshResource.GenerateTextOptions = GenerateTextOptions(), extrusionOptions: MeshResource.ShapeExtrusionOptions = ShapeExtrusionOptions()) async throws {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, visionOS 26.0, tvOS 26.0, macCatalyst 26.0, *)
extension MeshResource {
    @MainActor @preconcurrency public func meshPartIndex(modelID: String, partID: String) -> Int? {
        assertUnimplemented()
    }
    
    @available(*, unavailable, renamed: "meshPartIndex(modelID:partID:)")
    @MainActor @preconcurrency public func getMeshPartIndex(modelID: String, partID: String) -> Int? {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource.ShapeExtrusionOptions.ChamferMode : Equatable {
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MeshResource.ShapeExtrusionOptions.ChamferMode : Hashable {
}
