private import CoreRE

enum ImplicitAnimationStack {
    static func withModifier<T>(_ modifier: any EntityChangeModifier, operation: () throws -> T) rethrows -> T {
        return try ImplicitAnimationStack.$current.withValue(modifier) { 
            try operation()
        }
    }
    
    @TaskLocal static var current: (any EntityChangeModifier)?
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
public protocol _ImplicitlyAnimatableBuiltinComponent : Component {
    @_spi(Internal) static func animation(from: Self, to: Self) -> (from: ComponentAnimatableData<Self>, to: ComponentAnimatableData<Self>)
}

protocol EntityChangeModifier : Sendable {
    func setComponent<T : _ImplicitlyAnimatableBuiltinComponent>(entity: MyRealityFoundation::Entity, component: T, from: ComponentAnimatableData<T>, to: ComponentAnimatableData<T>)
}

@_spi(Internal) public struct ComponentAnimatableData<T> {
    private var propertyMapping: [AnyKeyPath : _Proto_AnyAnimatableProperty_v1<T>]
    
    init(propertyMapping: [AnyKeyPath : _Proto_AnyAnimatableProperty_v1<T>]) {
        self.propertyMapping = propertyMapping
    }
    
    func hasValues() -> Bool {
        return !self.propertyMapping.isEmpty
    }
    
    func debugPrintProperties() {
        assertUnimplemented()
    }
    
    func assignProperties(toComponent: inout T) {
        assertUnimplemented()
    }
}

extension ComponentAnimatableData : AdditiveArithmetic {
    public static var zero: ComponentAnimatableData<T> {
        assertUnimplemented()
    }
    
    public static func + (lhs: ComponentAnimatableData<T>, rhs: ComponentAnimatableData<T>) -> ComponentAnimatableData<T> {
        assertUnimplemented()
    }
    
    public static func - (lhs: ComponentAnimatableData<T>, rhs: ComponentAnimatableData<T>) -> ComponentAnimatableData<T> {
        assertUnimplemented()
    }
    
}
extension ComponentAnimatableData : Equatable {
    public static func == (lhs: borrowing ComponentAnimatableData<T>, rhs: borrowing ComponentAnimatableData<T>) -> Bool {
        assertUnimplemented()
    }
}

struct _Proto_AnyAnimatableProperty_v1<T> {
    private var storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage
    
    init() {
        self.storage = _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage()
    }
    
    init<U : RealityKitVectorArithmetic & Equatable>(_ value: U, _ keyPath: WritableKeyPath<T, U>) {
        self.storage = _Proto_AnyAnimatableProperty_v1<T>.PropertyStorage<U>(value, keyPath)
    }
}

extension _Proto_AnyAnimatableProperty_v1 {
    class TypeErasedStorage {
        init() {}
        
        func debugPrintValue() {
            assertUnimplemented()
        }
        
        func assignProperty(toComponent: inout T) {
            assertUnimplemented()
        }
        
        func processAddAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        func processSubtractAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        func processAdd(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        func processSubtract(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        func processScale(_ scale: Double) {
            assertUnimplemented()
        }
        
        func processScaled(_ scale: Double) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        func processMagnitudeSquared() -> Double {
            assertUnimplemented()
        }
        
        func processEqual(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> Bool {
            assertUnimplemented()
        }
    }
    
    final class PropertyStorage<U : RealityKitVectorArithmetic & Equatable> : _Proto_AnyAnimatableProperty_v1.TypeErasedStorage {
        private var value: U
        private let keyPath: WritableKeyPath<T, U>
        
        init(_ value: U, _ keyPath: WritableKeyPath<T, U>) {
            self.value = value
            self.keyPath = keyPath
        }
        
        override func debugPrintValue() {
            assertUnimplemented()
        }
        
        override func assignProperty(toComponent: inout T) {
            assertUnimplemented()
        }
        
        override func processAddAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        override func processSubtractAndAssign(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) {
            assertUnimplemented()
        }
        
        override func processAdd(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        override func processSubtract(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> _Proto_AnyAnimatableProperty_v1<T> {
            assertUnimplemented()
        }
        
        override func processScale(_ scale: Double) {
            assertUnimplemented()
        }
        
        override func processMagnitudeSquared() -> Double {
            assertUnimplemented()
        }
        
        override func processEqual(_ storage: _Proto_AnyAnimatableProperty_v1<T>.TypeErasedStorage) -> Bool {
            assertUnimplemented()
        }
    }
}

struct _Proto_MeshDeformation_v1 {
    let resource: _Proto_MeshDeformation_v1.Resource
    
    init() {
        self.resource = _Proto_MeshDeformation_v1.Resource()
    }
    
    init(_ block: () -> [_Proto_MeshDeformation_v1.Stack]) throws {
        self.resource = try _Proto_MeshDeformation_v1.Resource(block)
    }
    
    init(from resource: _Proto_MeshDeformation_v1.Resource) {
        self.resource = resource
    }
    
    init(from definition: [_Proto_MeshDeformation_v1.Stack]) throws {
        self.resource = try _Proto_MeshDeformation_v1.Resource(definition: definition)
    }
}

extension _Proto_MeshDeformation_v1 {
    struct CustomDeformerSpec {
        // TODO
    }
    
    struct PartFromCore<T> {
        // TOOD
    }
    
    struct CustomDeformerComponentStorage<T> {
        // TODO
    }
    
    struct CustomDeformerComponentGPU<T, U, V> {
        // TODO
    }
    
    struct CustomDeformerComponentCPU<T, U, V> {
        // TODO
    }
    
    struct BlendShape {
        // TODO
    }
    
    struct Skinning {
        // TODO
    }
    
    final class CustomDeformerRuntime {
        deinit {
            assertUnimplemented()
        }
    }
    
    enum CustomDeformerBuilderError {
        case failedToCreateRuntime
    }
    
    struct CustomDeformerBuilder {
        // TODO
    }
    
    struct CustomDeformer {
        // TODO
    }
    
    enum VertexType {
        case positions
        case normals
        case tangents
        case bitangents
    }
    
    enum Cadence {
        case onDemand
        case everyFrame
    }
    
    struct VertexTypeOptions {
        var rawValue: UInt8
    }
    
    struct CustomDeformerParameter<T, U> {
        // TODO
    }
    
    struct Stack {
        private var deformers: [_Proto_MeshDeformation_v1.Deformer]
        private var options: _Proto_MeshDeformation_v1.Stack.Options
        private var targets: Set<_Proto_MeshScope_v1>
    }
    
    struct DefinitionError {
        // TODO
    }
    
    struct ResourceError {
        // TODO
    }
    
    @safe final class Resource {
        let coreAsset: OpaquePointer?
        private lazy var _definition: [_Proto_MeshDeformation_v1.Stack]? = {
            assertUnimplemented()
        }()
        
        var definition: [_Proto_MeshDeformation_v1.Stack] {
            assertUnimplemented()
        }
        
        init(coreAsset: OpaquePointer) {
            unsafe self.coreAsset = coreAsset
#if RealityKitCompatibility
            unsafe unsafeBitCast(coreAsset, to: CoreRE::Asset.self)
                .myRealityKitRef = self
#else
            unsafe unsafeBitCast(coreAsset, to: CoreRE::Asset.self)
                .swiftObject = Unmanaged.passUnretained(self).toOpaque()
#endif
        }
        
        init() {
            unsafe self.coreAsset = nil
        }
        
        init(definition: [_Proto_MeshDeformation_v1.Stack]) throws {
            assertUnimplemented()
        }
        
        init(_ block: () -> [_Proto_MeshDeformation_v1.Stack]) throws {
            assertUnimplemented()
        }
        
        deinit {
            if let coreAsset = unsafe self.coreAsset {
#if RealityKitCompatibility
                unsafe unsafeBitCast(coreAsset, to: CoreRE::Asset.self)
                    .myRealityKitRef = nil
#else
                unsafe unsafeBitCast(coreAsset, to: CoreRE::Asset.self)
                    .swiftObject = nil
#endif
            }
        }
    }
    
    protocol Deformer {
        func addToBuilder(_: inout MeshDeformationAssetBuilder)
        func isDeformerEqual(other: _Proto_MeshDeformation_v1.Deformer) -> Bool
    }
}

extension _Proto_MeshDeformation_v1.CustomDeformerBuilder {
    struct InputGPU {
        // TODO
    }
    
    struct InputCPU {
        // TODO
    }
}

extension _Proto_MeshDeformation_v1.CustomDeformerParameter {
    struct VertexBuffers<V> {
        // TODO
    }
}

extension _Proto_MeshDeformation_v1.CustomDeformerParameter.VertexBuffers {
    struct Data {
        // TODO
    }
}

extension _Proto_MeshDeformation_v1.Stack {
    struct Options {
        // TODO
    }
}

extension _Proto_MeshDeformation_v1.DefinitionError {
    enum ErrorType {
        case emptyDeformation
        case incompatibleDeformations
        case renormalizationCorruption
    }
}

extension _Proto_MeshDeformation_v1.ResourceError {
    enum Failure {
        case addDeformer
        case assignDeformer
        case createAsset
        case createAssetBuilder
        case invalidResource
        case invalidMeshIdTyp
        case unknownMeshIdType
    }
}

struct MeshDeformationAssetBuilder {
    // TODO
}

enum _Proto_MeshScope_v1 : Hashable {
    case model(name: String, parts: Set<String>)
    case instance(name: String, parts: Set<String>)
    case all
}
