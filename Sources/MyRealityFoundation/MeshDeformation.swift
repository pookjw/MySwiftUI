// 66EC90036D2199672CE95E447EDDF84E
private import CoreRE
private import os.log

@safe fileprivate let logger: os.Logger = {
    assertUnimplemented()
}()

struct MeshDeformationAssetBuilder {
    // TODO
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
    
    struct ResourceError : Error, Hashable {
        let type: _Proto_MeshDeformation_v1.ResourceError.Failure
        let details: String
    }
    
    @safe final class Resource {
        let coreAsset: OpaquePointer?
        private lazy var _definition: [_Proto_MeshDeformation_v1.Stack] = []
        
        var definition: [_Proto_MeshDeformation_v1.Stack] {
            guard self._definition.isEmpty, let coreAsset = unsafe self.coreAsset else {
                return self._definition
            }
            
            // <+116>
            do {
                let builder = try unsafe MeshDeformationBuilder(coreAsset)
                self._definition = try builder.makeDefinition()
            } catch {
                MyRealityFoundation::logger.error("Making a definition from an asset failed unexpectedly: \(error)")
            }
            
            return self._definition
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
    enum Failure : Hashable {
        case addDeformer
        case assignDeformer
        case createAsset
        case createAssetBuilder
        case invalidResource
        case invalidMeshIdTyp
        case unknownMeshIdType
    }
}

enum _Proto_MeshScope_v1 : Hashable {
    case model(name: String, parts: Set<String>)
    case instance(name: String, parts: Set<String>)
    case all
}
